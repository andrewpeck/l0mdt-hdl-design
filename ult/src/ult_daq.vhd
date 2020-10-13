library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ctrl_lib;
use ctrl_lib.DAQ_CTRL.all;

library types_def;
library ttc_def;
library daq_def;
library ttc_lib;
library daq_lib;

use types_def.common_defs.all;

use ttc_def.ttc_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;

entity daq is

  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    ctrl              : in  DAQ_CTRL_t;
    mon               : out DAQ_MON_t;

    i_inner_tdc_hits  : in  mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tdc_hits : in  mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tdc_hits  : in  mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tdc_hits  : in  mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    daq_streams_o     : out felix_stream_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0)
    );

end entity daq;

architecture behavioral of daq is

  -- emulation

  signal ptcalc_sump         : std_logic_vector (c_NUM_THREADS -1 downto 0);
  signal pl2mtc_sump         : std_logic_vector (c_MAX_NUM_SL -1 downto 0);
  signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_INN-1 downto 0);
  signal tdc_hit_middle_sump : std_logic_vector (c_HPS_NUM_MDT_CH_MID-1 downto 0);
  signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
  signal tdc_hit_extra_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_EXT-1 downto 0);


  -- actual


  function get_branches_struct (N: integer) return daq_branches_map_at is
    variable y : daq_branches_map_at;
  begin
    for j in y'range loop
      if j < N then
        y(j) := (TDCPOLMUX2TAR_LEN, others => 0);
      else
        y(j) := (others => 0);
      end if;
    end loop;
    return y;
  end function get_branches_struct;
  
  signal inner_er : daq_top_ert;
  signal middle_er : daq_top_ert;
  signal outer_er : daq_top_ert;
  signal extra_er : daq_top_ert;

  type stations is (inner, middle, outer, extra);
  type trunk_t is array(stations) of daq_branches_t;
  signal trunk : trunk_t;

  signal inner_tdc_hits  : mdt_polmux_bus_at(c_HPS_NUM_MDT_CH_INN-1 downto 0);
  signal middle_tdc_hits : mdt_polmux_bus_at(c_HPS_NUM_MDT_CH_MID-1 downto 0);
  signal outer_tdc_hits  : mdt_polmux_bus_at(c_HPS_NUM_MDT_CH_OUT-1 downto 0);
  signal extra_tdc_hits  : mdt_polmux_bus_at(c_HPS_NUM_MDT_CH_EXT-1 downto 0);
  signal daq_streams     : felix_stream_bus_at (c_NUM_DAQ_STREAMS-1 downto 0);

  function streamify (x: tdcpolmux2tar_rt;
                      v: tdcpolmux2tar_rvt) return daq_stream_rt is
    variable y : daq_stream_rt;
  begin
    y.bcid := x.tdc.coarsetime;
    y.valid := x.data_valid;
    y.data := (y.data'left downto v'length => '0') & v;
    return y;
  end function streamify;

  function outputify(x: daq_to_felix_rt) return felix_stream_rt is
    variable y : felix_stream_rt;
  begin
    y.valid := x.wr_en;
    y.data := x.data;
    return y;
  end function outputify;

begin

  inner_tdc_hits  <=  structify(i_inner_tdc_hits);
  middle_tdc_hits <=  structify(i_middle_tdc_hits);
  outer_tdc_hits  <=  structify(i_outer_tdc_hits);
  extra_tdc_hits  <=  structify(i_extra_tdc_hits);
  daq_streams_o   <=  vectorify(daq_streams);


  DAQ_GEN : if c_DAQ_ENABLED generate

    gen_daq_inner : if   c_HPS_ENABLE_ST_INN = '1' generate
      u_daq_inner: entity daq_lib.daq_top
        generic map (G => (BRANCHES_STRUCT => get_branches_struct(c_HPS_NUM_MDT_CH_INN),
                           COUNTER_WIDTH => 32))
        port map (port_ir => inner_er.i, port_or =>  inner_er.o);
      
      inner_er.i.sys <= (clock_and_control.clk, clock_and_control.rst);
      inner_er.i.ttc.cmds.bx <= clock_and_control.bx;
      inner_er.i.ttc.cmds.bcr <= ttc_commands.bcr;
      inner_er.i.ttc.cmds.ecr <= ttc_commands.ecr;
      inner_er.i.ttc.cmds.lxa <= ttc_commands.l0a;
      inner_er.i.ttc.cmds.ocr <= ttc_commands.ocr;
      
      inner_er.i.ttc.cnt.bcid <= ttc_commands.bcid;
      inner_er.i.ttc.cnt.evid <= ttc_commands.evid;
      inner_er.i.ttc.cnt.orid <= ttc_commands.orid;
      
      gen_daq_conn_inner: for j in inner_tdc_hits'range generate
        inner_er.i.branches(j)(0) <= streamify(inner_tdc_hits(j), i_inner_tdc_hits(j));
        daq_streams(j) <= outputify(inner_er.o.f2e_bus(j));
      end generate gen_daq_conn_inner;
    end generate gen_daq_inner;
      
    gen_daq_middle : if   c_HPS_ENABLE_ST_MID = '1' generate
      u_daq_middle: entity daq_lib.daq_top
        generic map (G => (BRANCHES_STRUCT => get_branches_struct(c_HPS_NUM_MDT_CH_MID),
                           COUNTER_WIDTH => 32))
        port map (port_ir => middle_er.i, port_or =>  middle_er.o);
      
      middle_er.i.sys <= (clock_and_control.clk, clock_and_control.rst);
      middle_er.i.ttc.cmds.bx <= clock_and_control.bx;
      middle_er.i.ttc.cmds.bcr <= ttc_commands.bcr;
      middle_er.i.ttc.cmds.ecr <= ttc_commands.ecr;
      middle_er.i.ttc.cmds.lxa <= ttc_commands.l0a;
      middle_er.i.ttc.cmds.ocr <= ttc_commands.ocr;
      
      middle_er.i.ttc.cnt.bcid <= ttc_commands.bcid;
      middle_er.i.ttc.cnt.evid <= ttc_commands.evid;
      middle_er.i.ttc.cnt.orid <= ttc_commands.orid;
      
      gen_daq_conn_middle: for j in middle_tdc_hits'range generate
        middle_er.i.branches(j)(0) <= streamify(middle_tdc_hits(j), i_middle_tdc_hits(j));
        daq_streams(c_HPS_NUM_MDT_CH_INN + j) <= outputify(middle_er.o.f2e_bus(j));
      end generate gen_daq_conn_middle;
    end generate gen_daq_middle;
      
    gen_daq_outer : if   c_HPS_ENABLE_ST_OUT = '1' generate
      u_daq_outer: entity daq_lib.daq_top
        generic map (G => (BRANCHES_STRUCT => get_branches_struct(c_HPS_NUM_MDT_CH_OUT),
                           COUNTER_WIDTH => 32))
        port map (port_ir => outer_er.i, port_or =>  outer_er.o);
      
      outer_er.i.sys <= (clock_and_control.clk, clock_and_control.rst);
      outer_er.i.ttc.cmds.bx <= clock_and_control.bx;
      outer_er.i.ttc.cmds.bcr <= ttc_commands.bcr;
      outer_er.i.ttc.cmds.ecr <= ttc_commands.ecr;
      outer_er.i.ttc.cmds.lxa <= ttc_commands.l0a;
      outer_er.i.ttc.cmds.ocr <= ttc_commands.ocr;
      
      outer_er.i.ttc.cnt.bcid <= ttc_commands.bcid;
      outer_er.i.ttc.cnt.evid <= ttc_commands.evid;
      outer_er.i.ttc.cnt.orid <= ttc_commands.orid;
      
      gen_daq_conn_outer: for j in outer_tdc_hits'range generate
        outer_er.i.branches(j)(0) <= streamify(outer_tdc_hits(j), i_outer_tdc_hits(j));
        daq_streams(c_HPS_NUM_MDT_CH_INN
                    + c_HPS_NUM_MDT_CH_MID +j) <= outputify(outer_er.o.f2e_bus(j));
      end generate gen_daq_conn_outer;
    end generate gen_daq_outer;
      
    gen_daq_extra : if   c_HPS_ENABLE_ST_EXT = '1' generate
      u_daq_extra: entity daq_lib.daq_top
        generic map (G => (BRANCHES_STRUCT => get_branches_struct(c_HPS_NUM_MDT_CH_EXT),
                           COUNTER_WIDTH => 32))
        port map (port_ir => extra_er.i, port_or =>  extra_er.o);
      
      extra_er.i.sys <= (clock_and_control.clk, clock_and_control.rst);
      extra_er.i.ttc.cmds.bx <= clock_and_control.bx;
      extra_er.i.ttc.cmds.bcr <= ttc_commands.bcr;
      extra_er.i.ttc.cmds.ecr <= ttc_commands.ecr;
      extra_er.i.ttc.cmds.lxa <= ttc_commands.l0a;
      extra_er.i.ttc.cmds.ocr <= ttc_commands.ocr;
      
      extra_er.i.ttc.cnt.bcid <= ttc_commands.bcid;
      extra_er.i.ttc.cnt.evid <= ttc_commands.evid;
      extra_er.i.ttc.cnt.orid <= ttc_commands.orid;
      
      gen_daq_conn_extra: for j in extra_tdc_hits'range generate
        extra_er.i.branches(j)(0) <= streamify(extra_tdc_hits(j), i_extra_tdc_hits(j));
        daq_streams(c_HPS_NUM_MDT_CH_INN
                    + c_HPS_NUM_MDT_CH_MID
                    + c_HPS_NUM_MDT_CH_OUT + j) <= outputify(extra_er.o.f2e_bus(j));
      end generate gen_daq_conn_extra;
    end generate gen_daq_extra;
      
  end generate;

  DAQ_EMU : if not c_DAQ_ENABLED generate

    sump_proc : process (clock_and_control.clk) is
    begin  -- process tdc_hit_sump_proc
      if (rising_edge(clock_and_control.clk)) then  -- rising clock edge

        inner_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_INN-1 loop
          tdc_hit_inner_sump(I) <= xor_reduce(i_inner_tdc_hits(I));
        end loop;
        middle_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_MID-1 loop
          tdc_hit_middle_sump(I) <= xor_reduce(i_middle_tdc_hits(I));
        end loop;
        outer_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_OUT-1 loop
          tdc_hit_outer_sump(I) <= xor_reduce(i_outer_tdc_hits(I));
        end loop;
        extra_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_EXT-1 loop
          tdc_hit_extra_sump(I) <= xor_reduce(i_extra_tdc_hits(I));
        end loop;


        daq_streams_o_loop : for I in 0 to c_NUM_DAQ_STREAMS-1 loop
          daq_streams_o(I) <= (others => (xor_reduce(tdc_hit_inner_sump) xor
                                          xor_reduce(tdc_hit_middle_sump) xor
                                          xor_reduce(tdc_hit_outer_sump) xor
                                          xor_reduce(tdc_hit_extra_sump)));
        end loop;
      end if;
    end process;

  end generate;


end behavioral;

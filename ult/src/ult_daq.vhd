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


  constant TOP_gr : daq_top_grt := (
    PIPELINES       => 32,
    BRANCHES_STRUCT => ((TDCPOLMUX2TAR_LEN, others => 0),
                        (TDCPOLMUX2TAR_LEN, others => 0),
                        (TDCPOLMUX2TAR_LEN, others => 0),
                        (TDCPOLMUX2TAR_LEN, others => 0),
                        (TDCPOLMUX2TAR_LEN, others => 0),
                        (TDCPOLMUX2TAR_LEN, others => 0),
                        others => (others => 0)),
    COUNTER_WIDTH     => 32);

  type top_aert is array (integer range <>) of daq_top_ert;
  signal inner_aer  : top_aert(c_HPS_NUM_MDT_CH_INN-1 downto 0);
  signal middle_aer : top_aert(c_HPS_NUM_MDT_CH_MID-1 downto 0);
  signal outer_aer  : top_aert(c_HPS_NUM_MDT_CH_OUT-1 downto 0);
  signal extra_aer  : top_aert(c_HPS_NUM_MDT_CH_EXT-1 downto 0);

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
    y.data := x.data(y.data'range);
    return y;
  end function outputify;
  
begin

  inner_tdc_hits  <=  structify(i_inner_tdc_hits);
  middle_tdc_hits <=  structify(i_middle_tdc_hits); 
  outer_tdc_hits  <=  structify(i_outer_tdc_hits);
  extra_tdc_hits  <=  structify(i_extra_tdc_hits);
  daq_streams_o   <=  vectorify(daq_streams);
  
  
  DAQ_GEN : if c_DAQ_ENABLED generate


    gen_daq_inner: for j in inner_tdc_hits'range generate

      u_daq_inner: entity daq_lib.daq_top
        generic map (G => TOP_gr)
        port map (port_ir => inner_aer(j).i, port_or =>  inner_aer(j).o);

      inner_aer(j).i.sys <= (clock_and_control.clk, clock_and_control.rst);
      inner_aer(j).i.ttc.cmds.bx <= clock_and_control.bx;
      inner_aer(j).i.ttc.cmds.bcr <= ttc_commands.bcr;
      inner_aer(j).i.ttc.cmds.ecr <= ttc_commands.ecr;
      inner_aer(j).i.ttc.cmds.lxa <= ttc_commands.l0a;
      inner_aer(j).i.ttc.cmds.ocr <= ttc_commands.ocr;

      inner_aer(j).i.ttc.cnt.bcid <= ttc_commands.bcid;
      inner_aer(j).i.ttc.cnt.evid <= ttc_commands.evid;
      inner_aer(j).i.ttc.cnt.orid <= ttc_commands.orid;

      inner_aer(j).i.branches(j)(0) <= streamify(inner_tdc_hits(j), i_inner_tdc_hits(j));
      daq_streams(j) <= outputify(inner_aer(j).o.f2e_bus(0));
    end generate gen_daq_inner;

    gen_daq_middle: for j in middle_tdc_hits'range generate

      u_daq_middle: entity daq_lib.daq_top
        generic map (G => TOP_gr)
        port map (port_ir => middle_aer(j).i, port_or =>  middle_aer(j).o);

      middle_aer(j).i.sys <= (clock_and_control.clk, clock_and_control.rst);
      middle_aer(j).i.ttc.cmds.bx <= clock_and_control.bx;
      middle_aer(j).i.ttc.cmds.bcr <= ttc_commands.bcr;
      middle_aer(j).i.ttc.cmds.ecr <= ttc_commands.ecr;
      middle_aer(j).i.ttc.cmds.lxa <= ttc_commands.l0a;
      middle_aer(j).i.ttc.cmds.ocr <= ttc_commands.ocr;

      middle_aer(j).i.ttc.cnt.bcid <= ttc_commands.bcid;
      middle_aer(j).i.ttc.cnt.evid <= ttc_commands.evid;
      middle_aer(j).i.ttc.cnt.orid <= ttc_commands.orid;

      middle_aer(j).i.branches(j)(0) <= streamify(middle_tdc_hits(j), i_middle_tdc_hits(j));
      daq_streams(c_HPS_NUM_MDT_CH_INN + j) <= outputify(middle_aer(j).o.f2e_bus(0));
    end generate gen_daq_middle;

    gen_daq_outer: for j in outer_tdc_hits'range generate
      u_daq_outer: entity daq_lib.daq_top
        generic map (G => TOP_gr)
        port map (port_ir => outer_aer(j).i, port_or =>  outer_aer(j).o);

      outer_aer(j).i.sys <= (clock_and_control.clk, clock_and_control.rst);
      outer_aer(j).i.ttc.cmds.bx <= clock_and_control.bx;
      outer_aer(j).i.ttc.cmds.bcr <= ttc_commands.bcr;
      outer_aer(j).i.ttc.cmds.ecr <= ttc_commands.ecr;
      outer_aer(j).i.ttc.cmds.lxa <= ttc_commands.l0a;
      outer_aer(j).i.ttc.cmds.ocr <= ttc_commands.ocr;

      outer_aer(j).i.ttc.cnt.bcid <= ttc_commands.bcid;
      outer_aer(j).i.ttc.cnt.evid <= ttc_commands.evid;
      outer_aer(j).i.ttc.cnt.orid <= ttc_commands.orid;

      outer_aer(j).i.branches(j)(0) <= streamify(outer_tdc_hits(j), i_outer_tdc_hits(j));
      daq_streams(c_HPS_NUM_MDT_CH_INN
                  + c_HPS_NUM_MDT_CH_MID +j) <= outputify(outer_aer(j).o.f2e_bus(0));
    end generate gen_daq_outer;
    
    gen_daq_extra: for j in extra_tdc_hits'range generate

      u_daq_extra: entity daq_lib.daq_top
        generic map (G => TOP_gr)
        port map (port_ir => extra_aer(j).i, port_or =>  extra_aer(j).o);

      extra_aer(j).i.sys <= (clock_and_control.clk, clock_and_control.rst);
      extra_aer(j).i.ttc.cmds.bx <= clock_and_control.bx;
      extra_aer(j).i.ttc.cmds.bcr <= ttc_commands.bcr;
      extra_aer(j).i.ttc.cmds.ecr <= ttc_commands.ecr;
      extra_aer(j).i.ttc.cmds.lxa <= ttc_commands.l0a;
      extra_aer(j).i.ttc.cmds.ocr <= ttc_commands.ocr;

      extra_aer(j).i.ttc.cnt.bcid <= ttc_commands.bcid;
      extra_aer(j).i.ttc.cnt.evid <= ttc_commands.evid;
      extra_aer(j).i.ttc.cnt.orid <= ttc_commands.orid;

      extra_aer(j).i.branches(j)(0) <= streamify(extra_tdc_hits(j), i_extra_tdc_hits(j));
      daq_streams(c_HPS_NUM_MDT_CH_INN
                  + c_HPS_NUM_MDT_CH_MID
                  + c_HPS_NUM_MDT_CH_OUT + j) <= outputify(extra_aer(j).o.f2e_bus(0));
    end generate gen_daq_extra;

    -- top_er.i.ctrl <= port_ir.ctrl;
    -- 
    -- port_or.status0 <= top_er.o.status_bus(0);
    -- port_or.status1 <= top_er.o.status_bus(1);

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

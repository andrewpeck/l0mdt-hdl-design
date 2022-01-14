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

library ttc_def;
library daq_def;
library daq_lib;

use ttc_def.ttc_defs.all;

use daq_def.daq_config_defs.all;
use daq_def.daq_defs.all;

entity daq is
  generic (DELAY : integer; memory_type: string);
  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    ctrl_v            : in std_logic_vector; -- : in  DAQ_CTRL_t;
    mon_v             : out std_logic_vector;-- : out DAQ_MON_t;

    i_inn_tdc_hits_av : in  mdt_polmux_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tdc_hits_av : in  mdt_polmux_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tdc_hits_av : in  mdt_polmux_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tdc_hits_av : in  mdt_polmux_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);
    o_daq_streams     : out felix_stream_bus_avt (c_HPS_MAX_HP_INN     
                                                  + c_HPS_MAX_HP_MID   
                                                  + c_HPS_MAX_HP_OUT - 1 downto 0)
    -- o_sump            : out std_logic
  );
end entity daq;

architecture behavioral of daq is

  -- emulation

  -- signal ptcalc_sump         : std_logic_vector (c_NUM_THREADS -1 downto 0);
  -- signal pl2mtc_sump         : std_logic_vector (c_MAX_NUM_SL -1 downto 0);
  -- signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_MAX_HP_INN-1 downto 0);
  -- signal tdc_hit_middle_sump : std_logic_vector (c_HPS_MAX_HP_MID-1 downto 0);
  -- signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_MAX_HP_OUT-1 downto 0);
  -- signal tdc_hit_extra_sump  : std_logic_vector (c_HPS_MAX_HP_EXT-1 downto 0);


  -- actual


  function get_branches_struct (N: integer) return daq_branches_map_at is
    variable y : daq_branches_map_at;
  begin
    for j in y'range loop
      if j < N then
        y(j) := ((TDCPOLMUX2TAR_LEN, 1024), others => (0, 0));
      else
        y(j) := (others => (0, 0));
      end if;
    end loop;
    return y;
  end function get_branches_struct;
  
  function get_branches_mask (N: integer) return daq_branches_mask_at is
    variable y : daq_branches_mask_at;
  begin
    for j in y'range loop
      if j < N then
        y(j) := 1;
      else
        y(j) := 0;
      end if;
    end loop;
    return y;
  end function get_branches_mask;
  
  signal inner_er  : daq_branch_ert;
  signal middle_er : daq_branch_ert;
  signal outer_er  : daq_branch_ert;
  signal extra_er  : daq_branch_ert;

  type stations is (inner, middle, outer, extra);
  type trunk_t is array(stations) of daq_branches_t;
  signal trunk : trunk_t;

  signal inner_tdc_hits_v  : mdt_polmux_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
  signal middle_tdc_hits_v : mdt_polmux_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
  signal outer_tdc_hits_v  : mdt_polmux_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  signal extra_tdc_hits_v  : mdt_polmux_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);
  
  signal inner_tdc_hits  : mdt_polmux_bus_at(c_HPS_MAX_HP_INN-1 downto 0);
  signal middle_tdc_hits : mdt_polmux_bus_at(c_HPS_MAX_HP_MID-1 downto 0);
  signal outer_tdc_hits  : mdt_polmux_bus_at(c_HPS_MAX_HP_OUT-1 downto 0);
  signal extra_tdc_hits  : mdt_polmux_bus_at(c_HPS_MAX_HP_EXT-1 downto 0);
  signal daq_streams     : felix_stream_bus_at (c_HPS_MAX_HP_INN
                                                + c_HPS_MAX_HP_MID
                                                + c_HPS_MAX_HP_OUT - 1 downto 0);

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

  inner_tdc_hits  <=  structify(inner_tdc_hits_v);
  middle_tdc_hits <=  structify(middle_tdc_hits_v);
  outer_tdc_hits  <=  structify(outer_tdc_hits_v);
  extra_tdc_hits  <=  structify(extra_tdc_hits_v);
  o_daq_streams   <=  vectorify(daq_streams);


  DAQ_GEN : if c_DAQ_ENABLED generate

    gen_daq_inner : if   c_HPS_ENABLE_ST_INN = '1' generate

      u_daq_inner: entity daq_lib.daq_branch
        generic map (PIPELINES         => 40,
                     BRANCHES_MASK     => get_branches_mask(c_HPS_MAX_HP_INN),
                     BRANCHES_STRUCT   => get_branches_struct(c_HPS_MAX_HP_INN),
                     COUNTER_WIDTH     => 32,
                     OUTPUT_DATA_WIDTH => TDCPOLMUX2TAR_LEN)
        port map (branch_ir => inner_er.i, branch_or =>  inner_er.o);
   
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
        u_daq_inner_delay: entity shared_lib.std_pipeline
          generic map (g_MEMORY_TYPE => memory_type,
                       g_DELAY_CYCLES => DELAY,
                       g_PIPELINE_WIDTH => i_inn_tdc_hits_av(j)'length)
          port map (clk => clock_and_control.clk,
                    rst => clock_and_control.rst,
                    glob_en => '1',
                    i_data => i_inn_tdc_hits_av(j),
                    o_data => inner_tdc_hits_v(j));
        inner_er.i.branches(j)(0) <= streamify(inner_tdc_hits(j), inner_tdc_hits_v(j));
        daq_streams(j) <= outputify(inner_er.o.f2e_bus(j));
      end generate gen_daq_conn_inner;
    end generate gen_daq_inner;
      
    gen_daq_middle : if   c_HPS_ENABLE_ST_MID = '1' generate
      u_daq_middle: entity daq_lib.daq_branch
        generic map (PIPELINES       => 40,
                     BRANCHES_MASK   => get_branches_mask(c_HPS_MAX_HP_MID),
                     BRANCHES_STRUCT => get_branches_struct(c_HPS_MAX_HP_MID),
                     COUNTER_WIDTH     => 32,
                     OUTPUT_DATA_WIDTH => TDCPOLMUX2TAR_LEN)
        port map (branch_ir => middle_er.i, branch_or =>  middle_er.o);
   
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
        u_daq_middle_delay: entity shared_lib.std_pipeline
          generic map (g_MEMORY_TYPE => memory_type,
                       g_DELAY_CYCLES => DELAY,
                       g_PIPELINE_WIDTH => i_mid_tdc_hits_av(j)'length)
          port map (clk => clock_and_control.clk,
                    rst => clock_and_control.rst,
                    glob_en => '1',
                    i_data => i_mid_tdc_hits_av(j),
                    o_data => middle_tdc_hits_v(j));
        middle_er.i.branches(j)(0) <= streamify(middle_tdc_hits(j), middle_tdc_hits_v(j));
        daq_streams(c_HPS_MAX_HP_INN + j) <= outputify(middle_er.o.f2e_bus(j));
      end generate gen_daq_conn_middle;
    end generate gen_daq_middle;
      
    gen_daq_outer : if   c_HPS_ENABLE_ST_OUT = '1' generate
      u_daq_outer: entity daq_lib.daq_branch
        generic map (PIPELINES       => 40,
                     BRANCHES_MASK   => get_branches_mask(c_HPS_MAX_HP_OUT),
                     BRANCHES_STRUCT => get_branches_struct(c_HPS_MAX_HP_OUT),
                     COUNTER_WIDTH     => 32,
                     OUTPUT_DATA_WIDTH => TDCPOLMUX2TAR_LEN)
        port map (branch_ir => outer_er.i, branch_or =>  outer_er.o);
   
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
        u_daq_outer_delay: entity shared_lib.std_pipeline
          generic map (g_MEMORY_TYPE => memory_type,
                       g_DELAY_CYCLES => DELAY,
                       g_PIPELINE_WIDTH => i_out_tdc_hits_av(j)'length)
          port map (clk => clock_and_control.clk,
                    rst => clock_and_control.rst,
                    glob_en => '1',
                    i_data => i_out_tdc_hits_av(j),
                    o_data => outer_tdc_hits_v(j));
        outer_er.i.branches(j)(0) <= streamify(outer_tdc_hits(j), outer_tdc_hits_v(j));
        daq_streams(c_HPS_MAX_HP_INN
                    + c_HPS_MAX_HP_MID +j) <= outputify(outer_er.o.f2e_bus(j));
      end generate gen_daq_conn_outer;
    end generate gen_daq_outer;
      
    -- gen_daq_extra : if   c_HPS_ENABLE_ST_EXT = '1' generate
    --   u_daq_extra: entity daq_lib.daq_branch
    --     generic map (G => (PIPELINES       => 40,
    --                        BRANCHES_MASK   => (others => 1),
    --                        BRANCHES_STRUCT => get_branches_struct(c_HPS_MAX_HP_EXT),
    --                        COUNTER_WIDTH     => 32,
    --                        OUTPUT_DATA_WIDTH => TDCPOLMUX2TAR_LEN))
    --     port map (branch_ir => extra_er.i, branch_or =>  extra_er.o);
    -- 
    --   extra_er.i.sys <= (clock_and_control.clk, clock_and_control.rst);
    --   extra_er.i.ttc.cmds.bx <= clock_and_control.bx;
    --   extra_er.i.ttc.cmds.bcr <= ttc_commands.bcr;
    --   extra_er.i.ttc.cmds.ecr <= ttc_commands.ecr;
    --   extra_er.i.ttc.cmds.lxa <= ttc_commands.l0a;
    --   extra_er.i.ttc.cmds.ocr <= ttc_commands.ocr;
    -- 
    --   extra_er.i.ttc.cnt.bcid <= ttc_commands.bcid;
    --   extra_er.i.ttc.cnt.evid <= ttc_commands.evid;
    --   extra_er.i.ttc.cnt.orid <= ttc_commands.orid;
    -- 
    --   gen_daq_conn_extra: for j in extra_tdc_hits'range generate
    --     u_daq_extra_delay: entity shared_lib.std_pipeline
    --       generic map (g_MEMORY_TYPE => memory_type,
    --                    g_DELAY_CYCLES => DELAY,
    --                    g_PIPELINE_WIDTH => i_ext_tdc_hits_av(j)'length)
    --       port map (clk => clock_and_control.clk,
    --                 rst => clock_and_control.rst,
    --                 glob_en => '1',
    --                 i_data => i_ext_tdc_hits_av(j),
    --                 o_data => extra_tdc_hits_v(j));
    --     extra_er.i.branches(j)(0) <= streamify(extra_tdc_hits(j), extra_tdc_hits_v(j));
    --     daq_streams(c_HPS_MAX_HP_INN
    --                 + c_HPS_MAX_HP_MID
    --                 + c_HPS_MAX_HP_OUT + j) <= outputify(extra_er.o.f2e_bus(j));
    --   end generate gen_daq_conn_extra;
    -- end generate gen_daq_extra;
      
  end generate DAQ_GEN;

  -- DAQ_EMU : if not c_DAQ_ENABLED generate


  -- end generate;


end behavioral;

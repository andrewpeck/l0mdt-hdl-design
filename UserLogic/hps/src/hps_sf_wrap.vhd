--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: HPS candidate distributor
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;
-- library hegtypes_lib;
-- use hegtypes_lib.hp_pkg.all;
-- use hegtypes_lib.heg_pkg.all;

library csf_lib;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

library lsf_lib;
use lsf_lib.all;

library fm_lib;
use fm_lib.fm_ult_pkg.all;


entity hps_sf_wrap is
  generic(
    g_STATION_RADIUS : integer := 0     --station
    );
  port (
    clk     : in std_logic;
    rst     : in std_logic;
    glob_en : in std_logic;

    -- control
    csf_ctrl_v : in std_logic_vector;--  HPS_CSF_CSF_CTRL_t;
    csf_mon_v  : out std_logic_vector;--HPS_CSF_CSF_MON_t;

    lsf_ctrl_v : in  std_logic_vector;--HPS_LSF_LSF_CTRL_t;
    lsf_mon_v  : out std_logic_vector;--HPS_LSF_LSF_MON_t;

    sf_fm_data : out fm_rt_array( 0 to sf_sb_n - 1);
    -- configuration
    i_control_v  : in  heg_ctrl2sf_vt;
    i_slc_data_v : in  heg2sfslc_vt;
    i_mdt_data_v : in  heg2sfhit_vt;
    --
    o_sf_data_v  : out sf2ptcalc_vt
    );
end entity hps_sf_wrap;

architecture beh of hps_sf_wrap is
  signal i_control_r : heg_ctrl2sf_rt;

  signal csf_ctrl_r : HPS_CSF_CSF_CTRL_t;
  signal csf_mon_r  : HPS_CSF_CSF_MON_t;
  signal lsf_ctrl_r : HPS_LSF_LSF_CTRL_t;
  signal lsf_mon_r  : HPS_LSF_LSF_MON_t;

  signal sf_data_v : std_logic_vector(o_sf_data_v'length -1 downto 0);

  constant lc_HEG2SFSLC_LEN : integer := i_slc_data_v'length;--len():
  constant lc_HEG2SFHIT_LEN : integer := i_mdt_data_v'length;--len():
  constant lc_SF2PTCALC_LEN : integer := o_sf_data_v'length;--len():

begin

  i_control_r <= convert(i_control_v,i_control_r);

  csf_ctrl_r <= convert(csf_ctrl_v,csf_ctrl_r);
  -- csf_mon_v  <= convert(csf_mon_r ,csf_mon_v );
  lsf_ctrl_r <= convert(lsf_ctrl_v,lsf_ctrl_r);
  -- lsf_mon_v  <= convert(lsf_mon_r ,lsf_mon_v );
  --
  lsf_mon_r <= zero(lsf_mon_r);
--  csf_mon_r <= zero(csf_mon_r);
  --
  sf_fm_data(0).fm_data <= (mon_dw_max-1 downto lc_HEG2SFSLC_LEN => '0') & i_slc_data_v;
  sf_fm_data(0).fm_vld  <= i_slc_data_v(lc_HEG2SFSLC_LEN-1);

  sf_fm_data(1).fm_data <= (mon_dw_max-1 downto lc_HEG2SFHIT_LEN => '0') & i_mdt_data_v;
  sf_fm_data(1).fm_vld  <= i_mdt_data_v(lc_HEG2SFHIT_LEN-1);

  sf_fm_data(2).fm_data <= (mon_dw_max-1 downto lc_SF2PTCALC_LEN => '0') & o_sf_data_v;
  sf_fm_data(2).fm_vld  <= o_sf_data_v(lc_SF2PTCALC_LEN -1);


  EN_SF : if c_SF_ENABLED = '1' generate

    SF_BP: if c_SF_BYPASS = '0' generate
      --
      -- csf_ctrl_r <= convert(csf_ctrl_v,csf_ctrl_r);
      -- csf_mon_r <= zero(csf_mon_r);

      -- lsf_ctrl_r <= convert(lsf_ctrl_v,lsf_ctrl_r);
      -- lsf_mon_r <= zero(lsf_mon_r);


      
      --
      SF_TYPE : if c_SF_TYPE = '0' generate

--        csf_mon_v  <= convert(csf_mon_r ,csf_mon_v );
        lsf_mon_v  <= convert(lsf_mon_r ,lsf_mon_v );
        

        CSF : entity csf_lib.csf
          generic map(
            IS_ENDCAP => to_integer(unsigned'("0" & c_ST_nBARREL_ENDCAP)),
            MDT_STATION => g_STATION_RADIUS
            )
          port map(
            clk       => clk,
            rst     => rst,
            glob_en => glob_en,
            i_ctrl_v => csf_ctrl_v,
            o_mon_v => csf_mon_v,
            i_seed    => i_slc_data_v,
            i_mdt_hit => i_mdt_data_v,
            i_eof     => i_control_r.eof,
            o_seg     => o_sf_data_v
        );

        -- lsf_mon_r <= zero(lsf_mon_r);
        -- csf_mon_r <= zero(csf_mon_r);

      else generate

        LSF : entity lsf_lib.top_lsf
         
          port map(
            clock                               => clk,
            reset                               => rst,
            slc_roi                             => i_slc_data_v,
            mdt_hit                             => i_mdt_data_v,
            lsf                                 => o_sf_data_v,
            i_eof                               => i_control_r.eof,
            hba_max_clocks                      => lsf_ctrl_r.hba_max_clocks            
        );

        -- csf_mon_r <= zero(csf_mon_r);


      end generate;
    else generate


      csf_ctrl : entity shared_lib.vhdl_utils_deserializer 
        generic map (g_DATA_WIDTH => csf_mon_v'length) 
        port map(
          clk     => clk,
          rst     => rst,
          i_data  => xor_reduce(csf_ctrl_v),
          o_data  => csf_mon_v
      );
      lsf_ctrl : entity shared_lib.vhdl_utils_deserializer 
        generic map (g_DATA_WIDTH => lsf_mon_v'length) 
        port map(
          clk     => clk,
          rst     => rst,
          i_data  => xor_reduce(lsf_ctrl_v),
          o_data  => lsf_mon_v
      );

      des0 : entity shared_lib.vhdl_utils_deserializer
        generic map (g_DATA_WIDTH => sf_data_v'length)
        port map(
          clk     => clk,
          rst     => rst,
          i_data  => glob_en OR (xor_reduce(i_control_v) xor xor_reduce(i_slc_data_v) xor xor_reduce(i_mdt_data_v)),
          o_data  => sf_data_v
      );
      o_sf_data_v <= sf_data_v;

    end generate SF_BP;

  else generate

    -- lsf_mon_r <= zero(lsf_mon_r);
    -- csf_mon_r <= zero(csf_mon_r);

    o_sf_data_v <= (others => '0');

  end generate;

end beh;

  -- DIS_SF : if c_SF_ENABLED = '0' generate
  --   --
  --   o_sf_data_v <= (others => '0');
  --   --CSF
  --   csf_mon.STATUS <= '0';
  --   csf_mon.READY <= '0';
  --   --LSF
  --   lsf_mon_r.STATUS <= '0';
  --   lsf_mon_r.sb_lsf_mdt_hits_rdata_31_0 <= (others =>'0');
  --   lsf_mon_r.sb_lsf_mdt_hits_rdata_40_32 <= (others => '0');
  -- else generate
  -- end generate;

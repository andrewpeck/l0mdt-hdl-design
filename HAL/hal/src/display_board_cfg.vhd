library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library hal;
use hal.system_types_pkg.all;
use hal.constants_pkg.all;
use hal.board_pkg.all;
use hal.board_pkg_common.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

package display_board_cfg_pkg is
  procedure display_board_cfg (verbose : boolean);
end package;

package body display_board_cfg_pkg is


  procedure display_board_cfg (verbose : boolean) is
    variable downlink_idx  : integer;
    variable uplink_idx    : integer;
    variable idx           : integer;
    variable downlink_data : std_logic_vector (31 downto 0);
  begin

    --------------------------------------------------------------------------------
    -- MGTS
    --------------------------------------------------------------------------------

    --for I in 0 to c_NUM_MGTS-1 loop
    --  assert false report "LPGBT_IDX_ARRAY(" & integer'image(I) & ") = "
    --    & integer'image(lpgbt_idx_array(I)) severity note;
    --end loop;

    --for I in 0 to c_NUM_MGTS-1 loop
    --  assert false report "FELIX_IDX_ARRAY(" & integer'image(I) & ") = "
    --    & integer'image(felix_idx_array(I)) severity note;
    --end loop;

    --for I in 0 to c_NUM_MGTS-1 loop
    --  assert false report "TTC_IDX_ARRAY(" & integer'image(I) & ") = "
    --    & integer'image(ttc_idx_array(I)) severity note;
    --end loop;

    --for I in 0 to c_NUM_MGTS-1 loop
    --  assert false report "LPGBT_UPLINK_IDX_ARRAY(" & integer'image(I) & ") = "
    --    & integer'image(lpgbt_uplink_idx_array(I)) severity note;
    --end loop;

    --for I in 0 to c_NUM_MGTS-1 loop
    --  assert false report "LPGBT_DOWNLINK_IDX_ARRAY(" & integer'image(I) & ") = "
    --    & integer'image(lpgbt_downlink_idx_array(I)) severity note;
    --end loop;

    --for I in 0 to c_NUM_MGTS-1 loop
    --  assert false report "SL_IDX_ARRAY(" & integer'image(I) & ") = "
    --    & integer'image(sl_idx_array(I)) severity note;
    --end loop;



    --------------------------------------------------------------------------------
    -- Polmux
    --------------------------------------------------------------------------------

    -- for I in 0 to (c_NUM_POLMUX) loop
    --   assert false report " > Inner Polmux IDX (" & to_string(I) &
    --     ")=" & to_string(inner_polmux_idx_array(I));
    -- end loop;

    -- for I in 0 to (c_NUM_POLMUX) loop
    --   assert false report " > Middle Polmux IDX (" & to_string(I) &
    --     ")=" & to_string(middle_polmux_idx_array(I));
    -- end loop;

    -- for I in 0 to (c_NUM_POLMUX) loop
    --   assert false report " > Outer Polmux IDX (" & to_string(I) &
    --     ")=" & to_string(outer_polmux_idx_array(I));
    -- end loop;

    -- for I in 0 to (c_NUM_POLMUX) loop
    --   assert false report " > Extra Polmux IDX (" & to_string(I) &
    --     ")=" & to_string(extra_polmux_idx_array(I));
    -- end loop;

    mgt_gen : for I in 0 to c_NUM_MGTS-1 loop

      --   --assert false report "GENERATING MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) severity note;
      --   --assert (c_MGT_MAP(I).refclk /= -1) and (c_MGT_MAP(I).refclk < c_NUM_REFCLKS) report "invalid refclk selected" severity error;

      --------------------------------------------------------------------------------
      -- LPGBT Type
      --------------------------------------------------------------------------------

      lpgbt_gen : if (lpgbt_idx_array(I) /= -1) then

        downlink_idx := lpgbt_downlink_idx_array(I);
        uplink_idx   := lpgbt_uplink_idx_array(I);

        --------------------------------------------------------------------------------

        assert (c_NUM_CSM_UPLINKS mod 2 = 0)
          report "You NEED to instantiate an even number of uplinks because a CSM is always 2+1 (c_NUM_CSM_UPLINKS="
          & integer'image(c_NUM_CSM_UPLINKS) & " c_NUM_CSM_DOWNLINKS=)" & integer'image(c_NUM_CSM_DOWNLINKS)
          severity error;

        assert (c_NUM_CSM_UPLINKS/2 = c_NUM_CSM_DOWNLINKS)
          report "Number of CSM Uplinks should be twice the number of downlinks"
          & integer'image(c_NUM_CSM_UPLINKS) & "\nc_NUM_CSM_DOWNLINKS=" & integer'image(c_NUM_CSM_DOWNLINKS)
          severity error;

        assert false report "GENERATING LPGBT TYPE LINK ON MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " LPGBT_LINK_CNT=" & integer'image(lpgbt_idx_array(I)) severity note;
        assert false report "   > downlink_idx=" & integer'image(downlink_idx) severity note;
        assert false report "   > uplink_idx=" & integer'image(uplink_idx) severity note;
        assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_SYNC320) report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;

      end if;

      --------------------------------------------------------------------------------
      -- LPGBT Emulator Type
      --------------------------------------------------------------------------------

      emul_gen : if (emul_idx_array(I) /= -1) then
        idx := emul_idx_array(I);
        assert false report "GENERATING LPGBT EMULATOR LINK ON MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " LPGBT_LINK_CNT=" & integer'image(idx) severity note;
        assert false report "    > link_idx=" & integer'image(idx) severity note;
        assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_SYNC320) report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;
      end if;

      --------------------------------------------------------------------------------
      -- Sector Logic Type
      --------------------------------------------------------------------------------

      sl_gen : if (sl_idx_array(I) /= -1) then
        idx         := sl_idx_array(I);
        assert false report "GENERATING SECTOR LOGIC TYPE LINK ON MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " SL_LINK_CNT=" & integer'image(idx) severity note;
        assert (c_NUM_SECTOR_LOGIC_INPUTS = c_NUM_SECTOR_LOGIC_OUTPUTS) report "We only support symmetric # of SL inputs / outputs" severity error;
        assert (idx <= c_NUM_SECTOR_LOGIC_OUTPUTS) report "conflict between # of sl links in board file and c_NUM_SECTOR_LOGIC_DOWNLINKS" severity error;
        assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_SYNC240) report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;
      end if;

      --------------------------------------------------------------------------------
      -- Felix Link Type
      --------------------------------------------------------------------------------

      -- only then per-QUAD for these
      -- felix_gen : if (felix_idx_array(I) /= -1 and (I mod 4 = 0)) then
      felix_gen : if (felix_idx_array(I) /= -1) then
        idx := felix_idx_array(I);
        assert false report "GENERATING FELIX LINK ON MGT=" & integer'image(I)   & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " FELIX_LINK_CNT=" & integer'image(idx) severity note;
        -- assert false report "GENERATING FELIX LINK ON MGT=" & integer'image(I+1) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " FELIX_LINK_CNT=" & integer'image(idx) severity note;
        -- assert false report "GENERATING FELIX LINK ON MGT=" & integer'image(I+2) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " FELIX_LINK_CNT=" & integer'image(idx) severity note;
        -- assert false report "GENERATING FELIX LINK ON MGT=" & integer'image(I+3) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " FELIX_LINK_CNT=" & integer'image(idx) severity note;
        --assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_ASYNC_320) report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;
      end if;

    end loop;

    assert false report "GENERATING " & integer'image(c_NUM_MGTS) & " MGT LINKS:";
    assert false report "GENERATING " & integer'image(c_NUM_REFCLKS) & " REFERENCE CLOCKS";

    assert false report "--------------------------------------------------------";
    assert false report "c_NUM_TDC_INPUTS    = " & integer'image(c_NUM_TDC_INPUTS);
    assert false report "c_NUM_POLMUX_INNER  = " & integer'image(c_NUM_POLMUX_INNER);
    assert false report "c_NUM_POLMUX_MIDDLE = " & integer'image(c_NUM_POLMUX_MIDDLE);
    assert false report "c_NUM_POLMUX_OUTER  = " & integer'image(c_NUM_POLMUX_OUTER);
    assert false report "c_NUM_POLMUX_EXTRA  = " & integer'image(c_NUM_POLMUX_EXTRA);
    assert false report "c_NUM_POLMUX        = " & integer'image(c_NUM_POLMUX);
    assert false report "--------------------------------------------------------";
    assert false report "c_NUM_CSMS_ACTIVE   = " & integer'image(c_NUM_CSMS_ACTIVE);
    assert false report "c_NUM_CSM_UPLINKS   = " & integer'image(c_NUM_CSM_UPLINKS);
    assert false report "c_NUM_CSM_DOWNLINKS = " & integer'image(c_NUM_CSM_DOWNLINKS);
    assert false report "--------------------------------------------------------";
    assert false report "c_MAX_LPGBT_UPLINKS   = " & integer'image(c_MAX_LPGBT_UPLINKS);
    assert false report "c_MAX_LPGBT_DOWNLINKS = " & integer'image(c_MAX_LPGBT_DOWNLINKS);
    assert false report "c_NUM_LPGBT_UPLINKS   = " & integer'image(c_NUM_LPGBT_UPLINKS);
    assert false report "c_NUM_LPGBT_DOWNLINKS = " & integer'image(c_NUM_LPGBT_DOWNLINKS);
    assert false report "--------------------------------------------------------";
    assert false report "c_NUM_LPGBT_EMUL_UPLINKS   = " & integer'image(c_NUM_LPGBT_EMUL_UPLINKS);
    assert false report "c_NUM_LPGBT_EMUL_DOWNLINKS = " & integer'image(c_NUM_LPGBT_EMUL_DOWNLINKS);
    assert false report "--------------------------------------------------------";
    assert false report "c_NUM_FELIX_UPLINKS   = " & integer'image(c_NUM_FELIX_UPLINKS);
    assert false report "c_NUM_FELIX_DOWNLINKS = " & integer'image(c_NUM_FELIX_DOWNLINKS);
    assert false report "--------------------------------------------------------";
    assert false report "c_NUM_SF_INPUT_LINKS  = " & integer'image(c_NUM_SF_INPUT_LINKS);
    assert false report "c_NUM_SF_OUTPUT_LINKS = " & integer'image(c_NUM_SF_OUTPUT_LINKS);
    assert false report "--------------------------------------------------------";
    assert false report "c_NUM_SECTOR_LOGIC_INPUTS  = " & integer'image(c_NUM_SECTOR_LOGIC_INPUTS);
    assert false report "c_NUM_SECTOR_LOGIC_OUTPUTS = " & integer'image(c_NUM_SECTOR_LOGIC_OUTPUTS);
    assert false report "--------------------------------------------------------";

    assert false report "--------------------------------------------------------";
    assert false report "MAIN_CFG_COMPILE_HW   = " & std_logic'image(MAIN_CFG_COMPILE_HW);
    assert false report "MAIN_CFG_COMPILE_UL   = " & std_logic'image(MAIN_CFG_COMPILE_UL);
    assert false report "c_SECTOR_SIDE         = " & integer'image(c_SECTOR_SIDE);
    assert false report "c_ST_nBARREL_ENDCAP   = " & std_logic'image(c_ST_nBARREL_ENDCAP);
    assert false report "c_ENABLE_NEIGHBORS    = " & std_logic'image(c_ENABLE_NEIGHBORS);
    assert false report "c_SECTOR_ID           = " & integer'image(c_SECTOR_ID);
    assert false report "c_ENDCAP_nSMALL_LARGE = " & std_logic'image(c_ENDCAP_nSMALL_LARGE);
    assert false report "PHY_BARREL_R0         = " & integer'image(to_integer(PHY_BARREL_R0));
    assert false report "PHY_BARREL_R1         = " & integer'image(to_integer(PHY_BARREL_R1));
    assert false report "PHY_BARREL_R2         = " & integer'image(to_integer(PHY_BARREL_R2));
    assert false report "PHY_BARREL_R3         = " & integer'image(to_integer(PHY_BARREL_R3));
    assert false report "c_HPS_ENABLE_ST_INN   = " & std_logic'image(c_HPS_ENABLE_ST_INN);
    assert false report "c_HPS_ENABLE_ST_EXT   = " & std_logic'image(c_HPS_ENABLE_ST_EXT);
    assert false report "c_HPS_ENABLE_ST_MID   = " & std_logic'image(c_HPS_ENABLE_ST_MID);
    assert false report "c_HPS_ENABLE_ST_OUT   = " & std_logic'image(c_HPS_ENABLE_ST_OUT);
    assert false report "c_HPS_NUM_MDT_CH_INN  = " & integer'image(c_HPS_NUM_MDT_CH_INN);
    assert false report "c_HPS_NUM_MDT_CH_EXT  = " & integer'image(c_HPS_NUM_MDT_CH_EXT);
    assert false report "c_HPS_NUM_MDT_CH_MID  = " & integer'image(c_HPS_NUM_MDT_CH_MID);
    assert false report "c_HPS_NUM_MDT_CH_OUT  = " & integer'image(c_HPS_NUM_MDT_CH_OUT);


    assert false report "c_NUM_MTC             = " & integer'image(c_NUM_MTC);
    assert false report "c_NUM_NSP             = " & integer'image(c_NUM_NSP);
    assert false report "c_UCM_ENABLED         = " & std_logic'image(c_UCM_ENABLED);
    assert false report "c_MPL_ENABLED         = " & std_logic'image(c_MPL_ENABLED);
    assert false report "c_SF_ENABLED          = " & std_logic'image(c_SF_ENABLED);
    assert false report "c_SF_TYPE             = " & std_logic'image(c_SF_TYPE);
    assert false report "c_NUM_DAQ_STREAMS     = " & integer'image(c_NUM_DAQ_STREAMS);
  --assert false report "MAX_NUM_HP            = " & integer'image(MAX_NUM_HP);
  --assert false report "MAX_NUM_HPS           = " & integer'image(MAX_NUM_HPS);
    assert false report "c_NUM_SF_INPUTS       = " & integer'image(c_NUM_SF_INPUTS);
    assert false report "c_NUM_SF_OUTPUTS      = " & integer'image(c_NUM_SF_OUTPUTS);
    assert false report "c_MAX_NUM_SL          = " & integer'image(c_MAX_NUM_SL);
    assert false report "c_NUM_THREADS         = " & integer'image(c_NUM_THREADS);
    assert false report "--------------------------------------------------------";

  end;

end package body display_board_cfg_pkg;

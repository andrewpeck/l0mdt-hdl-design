library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library work;
use work.system_types_pkg.all;
use work.constants_pkg.all;
use work.board_pkg.all;
use work.board_pkg_common.all;

entity display_board_cfg is
end display_board_cfg;

architecture Behavioral of display_board_cfg is
begin
  --------------------------------------------------------------------------------
  -- MGTS
  --------------------------------------------------------------------------------

  lpgbt_idx_array_print : for I in 0 to c_NUM_MGTS-1 generate
    assert false report "LPGBT_IDX_ARRAY(" & integer'image(I) & ") = " & integer'image(lpgbt_idx_array(I)) severity note;
  end generate;

  lpgbt_upidx_array_print : for I in 0 to c_NUM_MGTS-1 generate
    assert false report "LPGBT_UPLINK_IDX_ARRAY(" & integer'image(I) & ") = " & integer'image(lpgbt_uplink_idx_array(I)) severity note;
  end generate;

  lpgbt_downidx_array_print : for I in 0 to c_NUM_MGTS-1 generate
    assert false report "LPGBT_DOWNLINK_IDX_ARRAY(" & integer'image(I) & ") = " & integer'image(lpgbt_downlink_idx_array(I)) severity note;
  end generate;

  sl_idx_array_print : for I in 0 to c_NUM_MGTS-1 generate
    assert false report "SL_IDX_ARRAY(" & integer'image(I) & ") = " & integer'image(sl_idx_array(I)) severity note;
  end generate;

  --------------------------------------------------------------------------------
  -- Polmux
  --------------------------------------------------------------------------------

  inner_loop : for I in 0 to (c_POLMUX_MAXID) generate
    assert (false) report " > Inner Polmux IDX (" & integer'image(I) &
      ")=" & integer'image(inner_polmux_idx_array(I)) severity note;
  end generate;
  middle_loop : for I in 0 to (c_POLMUX_MAXID) generate
    assert (false) report " > Middle Polmux IDX (" & integer'image(I) &
      ")=" & integer'image(middle_polmux_idx_array(I)) severity note;
  end generate;
  outer_loop : for I in 0 to (c_POLMUX_MAXID) generate
    assert (false) report " > Outer Polmux IDX (" & integer'image(I) &
      ")=" & integer'image(outer_polmux_idx_array(I)) severity note;
  end generate;
  extra_loop : for I in 0 to (c_POLMUX_MAXID) generate
    assert (false) report " > Extra Polmux IDX (" & integer'image(I) &
      ")=" & integer'image(extra_polmux_idx_array(I)) severity note;
  end generate;

  mgt_gen : for I in 0 to c_NUM_MGTS-1 generate
  begin

    --assert false report "GENERATING MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) severity note;
    --assert (c_MGT_MAP(I).refclk /= -1) and (c_MGT_MAP(I).refclk < c_NUM_REFCLKS) report "invalid refclk selected" severity error;

    --------------------------------------------------------------------------------
    -- LPGBT Type
    --------------------------------------------------------------------------------

    lpgbt_gen : if (lpgbt_idx_array(I) /= -1) generate
      constant downlink_idx : integer := lpgbt_downlink_idx_array(I);
      constant uplink_idx   : integer := lpgbt_uplink_idx_array(I);
      signal downlink_data : std_logic_vector (31 downto 0);
    begin

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

    end generate lpgbt_gen;

    --------------------------------------------------------------------------------
    -- LPGBT Emulator Type
    --------------------------------------------------------------------------------

    emul_gen : if (emul_idx_array(I) /= -1) generate
      constant idx : integer := emul_idx_array(I);
    begin
      assert false report "GENERATING LPGBT EMULATOR LINK ON MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " LPGBT_LINK_CNT=" & integer'image(idx) severity note;
      assert false report "    > link_idx=" & integer'image(idx) severity note;
      assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_SYNC320) report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;
    end generate emul_gen;

    --------------------------------------------------------------------------------
    -- Sector Logic Type
    --------------------------------------------------------------------------------

    sl_gen : if (sl_idx_array(I) /= -1) generate
      constant idx : integer := sl_idx_array(I);
    begin
      assert false report "GENERATING SECTOR LOGIC TYPE LINK ON MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " SL_LINK_CNT=" & integer'image(idx) severity note;
      assert (c_NUM_SECTOR_LOGIC_INPUTS = c_NUM_SECTOR_LOGIC_OUTPUTS) report "We only support symmetric # of SL inputs / outputs" severity error;
      assert (idx <= c_NUM_SECTOR_LOGIC_OUTPUTS) report "conflict between # of sl links in board file and c_NUM_SECTOR_LOGIC_DOWNLINKS" severity error;
      assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_SYNC240) report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;
    end generate sl_gen;

    --------------------------------------------------------------------------------
    -- Felix Link Type
    --------------------------------------------------------------------------------

    -- only generate per-QUAD for these
    felix_gen : if (felix_idx_array(I) /= -1 and (I mod 4 = 0)) generate
      constant idx : integer := felix_idx_array(I);
    begin
      assert false report "GENERATING FELIX LINK ON MGT=" & integer'image(I)   & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " FELIX_LINK_CNT=" & integer'image(idx) severity note;
      assert false report "GENERATING FELIX LINK ON MGT=" & integer'image(I+1) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " FELIX_LINK_CNT=" & integer'image(idx) severity note;
      assert false report "GENERATING FELIX LINK ON MGT=" & integer'image(I+2) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " FELIX_LINK_CNT=" & integer'image(idx) severity note;
      assert false report "GENERATING FELIX LINK ON MGT=" & integer'image(I+3) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " FELIX_LINK_CNT=" & integer'image(idx) severity note;
      assert (c_REFCLK_MAP (c_MGT_MAP(I).refclk).freq = REF_FELIX) report "Incompatible REFCLK selected on MGT#" & integer'image(I) severity error;
    end generate felix_gen;
  end generate mgt_gen;

  assert false report "GENERATING " & integer'image(c_NUM_MGTS) & " MGT LINKS:" severity note;
  assert false report "GENERATING " & integer'image(c_NUM_REFCLKS) & " REFERENCE CLOCKS" severity note;

  assert false report "--------------------------------------------------------" severity note;
  assert false report "c_NUM_TDC_INPUTS=" & integer'image(c_NUM_TDC_INPUTS) severity note;
  assert false report "c_NUM_POLMUX_INNER=" & integer'image(c_NUM_POLMUX_INNER) severity note;
  assert false report "c_NUM_POLMUX_MIDDLE=" & integer'image(c_NUM_POLMUX_MIDDLE) severity note;
  assert false report "c_NUM_POLMUX_OUTER=" & integer'image(c_NUM_POLMUX_OUTER) severity note;
  assert false report "c_NUM_POLMUX_EXTRA=" & integer'image(c_NUM_POLMUX_EXTRA) severity note;
  assert false report "c_POLMUX_MAXID=" & integer'image(c_POLMUX_MAXID) severity note;
  assert false report "--------------------------------------------------------" severity note;
  assert false report "c_NUM_CSM_LINKS_ACTIVE=" & integer'image(c_NUM_CSM_LINKS_ACTIVE) severity note;
  assert false report "c_NUM_CSM_UPLINKS=" & integer'image(c_NUM_CSM_UPLINKS) severity note;
  assert false report "c_NUM_CSM_DOWNLINKS=" & integer'image(c_NUM_CSM_DOWNLINKS) severity note;
  assert false report "--------------------------------------------------------" severity note;
  assert false report "c_MAX_LPGBT_UPLINKS=" & integer'image(c_MAX_LPGBT_UPLINKS) severity note;
  assert false report "c_MAX_LPGBT_DOWNLINKS=" & integer'image(c_MAX_LPGBT_DOWNLINKS) severity note;
  assert false report "c_NUM_LPGBT_UPLINKS=" & integer'image(c_NUM_LPGBT_UPLINKS) severity note;
  assert false report "c_NUM_LPGBT_DOWNLINKS=" & integer'image(c_NUM_LPGBT_DOWNLINKS) severity note;
  assert false report "--------------------------------------------------------" severity note;
  assert false report "c_NUM_LPGBT_EMUL_UPLINKS=" & integer'image(c_NUM_LPGBT_EMUL_UPLINKS) severity note;
  assert false report "c_NUM_LPGBT_EMUL_DOWNLINKS=" & integer'image(c_NUM_LPGBT_EMUL_DOWNLINKS) severity note;
  assert false report "--------------------------------------------------------" severity note;
  assert false report "c_NUM_FELIX_UPLINKS=" & integer'image(c_NUM_FELIX_UPLINKS) severity note;
  assert false report "c_NUM_FELIX_DOWNLINKS=" & integer'image(c_NUM_FELIX_DOWNLINKS) severity note;
  assert false report "--------------------------------------------------------" severity note;
  assert false report "c_NUM_SF_INPUT_LINKS=" & integer'image(c_NUM_SF_INPUT_LINKS) severity note;
  assert false report "c_NUM_SF_OUTPUT_LINKS=" & integer'image(c_NUM_SF_OUTPUT_LINKS) severity note;
  assert false report "--------------------------------------------------------" severity note;
  assert false report "c_NUM_SECTOR_LOGIC_INPUTS=" & integer'image(c_NUM_SECTOR_LOGIC_INPUTS) severity note;
  assert false report "c_NUM_SECTOR_LOGIC_OUTPUTS=" & integer'image(c_NUM_SECTOR_LOGIC_OUTPUTS) severity note;
  assert false report "--------------------------------------------------------" severity note;

end Behavioral;

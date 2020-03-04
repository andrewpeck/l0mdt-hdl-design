library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.system_types_pkg.all;
use work.constants_pkg.all;
use work.lpgbt_pkg.all;
use work.mgt_pkg.all;
use work.board_pkg.all;
use work.board_pkg_common.all;
use work.sector_logic_pkg.all;

entity mgt_wrapper is
  port(

    -- Clock
    clocks : in system_clocks_rt;

    reset : in std_logic;

    -- Refclk Inputs
    refclk_i_p : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);
    refclk_i_n : in std_logic_vector (c_NUM_REFCLKS-1 downto 0);

    -- MGT Links
    mgt_tx_p : out std_logic_vector (c_NUM_MGTS-1 downto 0);
    mgt_tx_n : out std_logic_vector (c_NUM_MGTS-1 downto 0);

    mgt_rx_p : in std_logic_vector (c_NUM_MGTS-1 downto 0);
    mgt_rx_n : in std_logic_vector (c_NUM_MGTS-1 downto 0);

    --------------------------------------------------------------------------------
    -- LPGBT
    --------------------------------------------------------------------------------

    -- Rxslide from LPGBT rx core
    lpgbt_rxslide_i : in std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- 32 bits / clock to mgt
    lpgbt_downlink_mgt_word_array_i : in std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- 32 bits / clock from mgt
    lpgbt_uplink_mgt_word_array_o : out std32_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- LPGBT Emulator
    --------------------------------------------------------------------------------

    -- Rxslide from LPGBT rx core
    lpgbt_emul_rxslide_i : in std_logic_vector (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);

    -- 32 bits / clock to mgt
    lpgbt_emul_downlink_mgt_word_array_o : out std32_array_t (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);

    -- 32 bits / clock from mgt
    lpgbt_emul_uplink_mgt_word_array_i : in std32_array_t (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- Sector Logic
    --------------------------------------------------------------------------------

    -- 32 bits / bx to mgt
    sl_tx_mgt_word_array_i : in std32_array_t (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0);

    -- 32 bits / bx from mgt
    sl_rx_mgt_word_array_o : out std32_array_t (c_NUM_SECTOR_LOGIC_INPUTS-1 downto 0);

    sl_tx_ctrl_i : in sl_tx_ctrl_rt_array (c_NUM_SECTOR_LOGIC_OUTPUTS-1 downto 0)


    );
end mgt_wrapper;

architecture Behavioral of mgt_wrapper is


  signal refclk : std_logic_vector (c_NUM_REFCLKS-1 downto 0);

  signal tx_resets : mgt_reset_rt_array (c_NUM_MGTS-1 downto 0);
  signal rx_resets : mgt_reset_rt_array (c_NUM_MGTS-1 downto 0);

  signal mgt_drp_i : mgt_drp_in_rt_array (c_NUM_MGTS-1 downto 0);
  signal mgt_drp_o : mgt_drp_out_rt_array (c_NUM_MGTS-1 downto 0);

  constant sl_idx_array    : int_array_t (0 to c_NUM_MGTS-1) := func_fill_subtype_idx (c_NUM_SECTOR_LOGIC_INPUTS, c_MGT_MAP, MGT_SL);
  constant lpgbt_idx_array : int_array_t (0 to c_NUM_MGTS-1) := func_fill_subtype_idx (c_NUM_LPGBT_UPLINKS, c_MGT_MAP, MGT_LPGBT);

  -- set of functions to get the maximum BOARD LINK ID based on the number of
  -- each type of link that the user wants to instantiate...
  -- i.e. the user can REDUCE the # of each link type from the board maximum
  -- but obviously can't increase it
  --
  function func_max_user_link_id (user_max : integer; mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t)
    return integer is
    variable count : integer := 0;
  begin
    for I in 0 to c_NUM_MGTS-1 loop
      if mgt_list(I).mgt_type = i_mgt_type then
        count := count + 1;
        if (count = user_max) then
          return count-1;
        end if;
      end if;
    end loop;  -- I
    return -1;
  end func_max_user_link_id;

  constant LPGBT_LINK_MAX_ID : integer := func_max_user_link_id (c_NUM_LPGBT_UPLINKS, c_MGT_MAP, MGT_LPGBT);
  constant SL_LINK_MAX_ID    : integer := func_max_user_link_id (c_NUM_SECTOR_LOGIC_INPUTS, c_MGT_MAP, MGT_SL);

begin
  --------------------------------------------------------------------------------
  -- Refclk
  --------------------------------------------------------------------------------

  assert false report "GENERATING " & integer'image(c_NUM_MGTS) & "MGT LINKS:" severity note;

  refclk_gen : for I in 0 to c_NUM_REFCLKS-1 generate

    assert false report "GENERATING REFCLK IBUF=" & integer'image(I) severity note;

    refclk_ibufds : ibufds_gte4
      generic map(
        REFCLK_EN_TX_PATH  => '0',
        REFCLK_HROW_CK_SEL => (others => '0'),
        REFCLK_ICNTL_RX    => (others => '0')
        )
      port map (
        O     => refclk(I),
        ODIV2 => open,
        CEB   => '0',
        I     => refclk_i_p(I),
        IB    => refclk_i_n(I)
        );
  end generate;

  --------------------------------------------------------------------------------
  -- MGTS
  --------------------------------------------------------------------------------

  assert false report "NUMBER of SL LINKS REQUESTED: " & integer'image(c_NUM_SECTOR_LOGIC_INPUTS) & " MAX LINK ID: " & integer'image(SL_LINK_MAX_ID) severity note;
  sl_output_gen : for I in 0 to c_NUM_MGTS-1 generate
    assert false report "SL_IDX_ARRAY(" & integer'image(I) & ") = " & integer'image(sl_idx_array(I)) severity note;
  end generate;

  lpgbt_output_gen : for I in 0 to c_NUM_MGTS-1 generate
    assert false report "LPGBT_IDX_ARRAY(" & integer'image(I) & ") = " & integer'image(lpgbt_idx_array(I)) severity note;
  end generate;


  mgt_gen : for I in 0 to c_NUM_MGTS-1 generate

    signal lpgbt_link_count : integer := 0;
    signal sl_link_count    : integer := 0;

  begin

    assert false report "GENERATING MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) severity note;
    assert (c_MGT_MAP(I).refclk /= -1) and (c_MGT_MAP(I).refclk < c_NUM_REFCLKS) report "invalid refclk selected" severity error;

    --------------------------------------------------------------------------------
    -- LPGBT Type
    --------------------------------------------------------------------------------

    lpgbt_gen : if (lpgbt_idx_array(I) /= -1) generate

      attribute X_LOC           : integer;
      attribute Y_LOC           : integer;
      attribute X_LOC of MGT_GEN : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(I).y_loc;
      attribute DONT_TOUCH of MGT_GEN : label is "true";
      attribute DONT_TOUCH : string;

    begin

      -- assert false report "LPGBT_LINK_MAX_ID=" & integer'image(LPGBT_LINK_MAX_ID) severity note;

      assert false report "GENERATING LPGBT TYPE LINK ON MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " LPGBT_LINK_CNT=" & integer'image(lpgbt_idx_array(I)) severity note;

      MGT_GEN : entity work.mgt_10g24_wrapper
        generic map (index => I, gt_type => c_MGT_MAP(I).gt_type)
        port map (
          clock                 => clocks.clock40,
          reset                 => reset,
          mgt_refclk_i          => refclk(c_MGT_MAP(I).refclk),
          mgt_rxusrclk_i        => clocks.clock320,
          mgt_rxusrclk_active_i => not reset,
          mgt_txusrclk_i        => clocks.clock320,
          mgt_txusrclk_active_i => not reset,
          tx_resets_i           => tx_resets(I),
          rx_resets_i           => rx_resets(I),
          mgt_rxslide_i         => lpgbt_rxslide_i(lpgbt_idx_array(I)),
          status_o              => open,
          mgt_word_i            => lpgbt_downlink_mgt_word_array_i(lpgbt_idx_array(I)),
          mgt_word_o            => lpgbt_uplink_mgt_word_array_o(lpgbt_idx_array(I)),
          rxn_i                 => mgt_rx_p(I),
          rxp_i                 => mgt_rx_n(I),
          txn_o                 => mgt_tx_p(I),
          txp_o                 => mgt_tx_n(I),
          mgt_drp_i             => mgt_drp_i(I),
          mgt_drp_o             => mgt_drp_o(I)
          );

      -- santity check
      lpgbt_link_count         <= lpgbt_link_count + 1;
      assert (c_NUM_LPGBT_UPLINKS = c_NUM_LPGBT_DOWNLINKS) report "We only support symmetric # of LPGBT inputs / outputs for now" severity error;
      assert (lpgbt_link_count <= c_NUM_LPGBT_UPLINKS) report "conflict between # of lpgbt links in board file and c_NUM_LPGBT_UPLINKS" severity error;
      assert (lpgbt_link_count <= c_NUM_LPGBT_DOWNLINKS) report "conflict between # of lpgbt links in board file and c_NUM_LPGBT_DOWNLINKS" severity error;

    end generate lpgbt_gen;

    --------------------------------------------------------------------------------
    -- Sector Logic Type
    --------------------------------------------------------------------------------

    sl_gen : if (sl_idx_array(I) /= -1) generate

      attribute X_LOC           : integer;
      attribute Y_LOC           : integer;
      attribute X_LOC of MGT_GEN : label is c_MGT_MAP(I).x_loc;
      attribute Y_LOC of MGT_GEN : label is c_MGT_MAP(I).y_loc;

    begin

      -- assert false report "LPGBT_LINK_MAX_ID=" & integer'image(LPGBT_LINK_MAX_ID) severity note;

      assert false report "GENERATING SECTOR LOGIC TYPE LINK ON MGT=" & integer'image(I) & " with REFCLK=" & integer'image(c_MGT_MAP(I).refclk) & " SL_LINK_CNT=" & integer'image(sl_idx_array(I)) severity note;

      MGT_GEN : entity work.mgt_sl_wrapper
        generic map (index => I, gt_type => c_MGT_MAP(I).gt_type)
        port map (
          clock                 => clocks.clock40,
          reset                 => reset,
          mgt_refclk_i          => refclk(c_MGT_MAP(I).refclk),
          mgt_rxusrclk_i        => clocks.clock240,
          mgt_rxusrclk_active_i => not reset,
          mgt_txusrclk_i        => clocks.clock240,
          mgt_txusrclk_active_i => not reset,
          tx_resets_i           => tx_resets(I),
          rx_resets_i           => rx_resets(I),
          status_o              => open,
          txctrl0_in            => x"000" & sl_tx_ctrl_i(sl_idx_array(I)).ctrl0,
          txctrl1_in            => x"000" & sl_tx_ctrl_i(sl_idx_array(I)).ctrl1,
          txctrl2_in            =>   x"0" & sl_tx_ctrl_i(sl_idx_array(I)).ctrl2,
          mgt_word_i            => sl_tx_mgt_word_array_i(sl_idx_array(I)),
          mgt_word_o            => sl_rx_mgt_word_array_o(sl_idx_array(I)),
          rxn_i                 => mgt_rx_p(I),
          rxp_i                 => mgt_rx_n(I),
          txn_o                 => mgt_tx_p(I),
          txp_o                 => mgt_tx_n(I),
          mgt_drp_i             => mgt_drp_i(I),
          mgt_drp_o             => mgt_drp_o(I)
          );

      -- santity check
      sl_link_count         <= sl_link_count + 1;
      assert (c_NUM_SECTOR_LOGIC_INPUTS = c_NUM_SECTOR_LOGIC_OUTPUTS) report "We only support symmetric # of SL inputs / outputs" severity error;
      assert (sl_link_count <= c_NUM_SECTOR_LOGIC_INPUTS) report "conflict between # of sl links in board file and c_NUM_SECTOR_LOGIC_UPLINKS" severity error;
      assert (sl_link_count <= c_NUM_SECTOR_LOGIC_OUTPUTS) report "conflict between # of sl links in board file and c_NUM_SECTOR_LOGIC_DOWNLINKS" severity error;

    end generate sl_gen;

  end generate mgt_gen;

end Behavioral;

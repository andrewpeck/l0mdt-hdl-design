library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;


library work;
use work.lpgbt_pkg.all;

entity lpgbt_direct_tb is
  generic (
    g_NUM_LPGBTS : integer := 1
    );
end lpgbt_direct_tb;


architecture Behavioral of lpgbt_direct_tb is

  -- architecture declarative part

  signal clock    : std_logic := '1';
  signal clock160 : std_logic := '1';
  signal clock80  : std_logic := '1';
  signal clock40  : std_logic := '1';

  signal cnt16 : std_logic_vector (15 downto 0);

  signal lpgbt_downlink_mgt_word_array         : std32_array_t (g_NUM_LPGBTS-1 downto 0);  -- 32 bit lpgbt formatted data to mgt @ 40MHz
  signal lpgbt_downlink_mgt_word_array_bitslip : std32_array_t (g_NUM_LPGBTS-1 downto 0);  -- 32 bit lpgbt formatted data to mgt @ 40MHz
  signal lpgbt_uplink_mgt_word_array           : std32_array_t (g_NUM_LPGBTS-1 downto 0);  -- 32 bit mgt data @ 40MHz
  signal lpgbt_uplink_mgt_word_array_bitslip   : std32_array_t (g_NUM_LPGBTS-1 downto 0);  -- 32 bit mgt data @ 40MHz

  signal backend_data_to_lpgbt   : std32_array_t (g_NUM_LPGBTS-1 downto 0);
  signal backend_data_from_lpgbt : std224_array_t (g_NUM_LPGBTS-1 downto 0);

  signal lpgbt_data_to_backend     : std224_array_t (g_NUM_LPGBTS-1 downto 0);
  signal lpgbt_data_from_backend   : std32_array_t (g_NUM_LPGBTS-1 downto 0);
  signal lpgbt_data_from_backend_r : std32_array_t (g_NUM_LPGBTS-1 downto 0);

  signal uplink_ic_i : std2_array_t (g_NUM_LPGBTS-1 downto 0);
  signal uplink_ec_i : std2_array_t (g_NUM_LPGBTS-1 downto 0);

  signal downlink_ic_o : std2_array_t (g_NUM_LPGBTS-1 downto 0);
  signal downlink_ec_o : std2_array_t (g_NUM_LPGBTS-1 downto 0);

  signal clk_en : std_logic;

  signal emul_downlink_ready_o  : std_logic_vector (g_NUM_LPGBTS-1 downto 0);
  signal lpgbt_downlink_ready_o : std_logic_vector (g_NUM_LPGBTS-1 downto 0);
  signal emul_uplink_ready_o    : std_logic_vector (g_NUM_LPGBTS-1 downto 0);
  signal lpgbt_uplink_ready_o   : std_logic_vector (g_NUM_LPGBTS-1 downto 0);

  signal uplink_clken_i   : std_logic_vector (g_NUM_LPGBTS-1 downto 0);
  signal uplink_ready_i   : std_logic_vector (g_NUM_LPGBTS-1 downto 0);
  signal downlink_ready_i : std_logic_vector (g_NUM_LPGBTS-1 downto 0);
  signal rxslide          : std_logic_vector (g_NUM_LPGBTS-1 downto 0);
  signal rst_downlink_i   : std_logic_vector (g_NUM_LPGBTS-1 downto 0);
  signal rst_uplink_i     : std_logic_vector (g_NUM_LPGBTS-1 downto 0);
  signal clock_vec        : std_logic_vector (g_NUM_LPGBTS-1 downto 0);
  signal clock40_vec      : std_logic_vector (g_NUM_LPGBTS-1 downto 0);

  signal uplink_bitslip : std_logic_vector (g_NUM_LPGBTS-1 downto 0);

  signal downlink_bitslip_cnt : std_logic_vector (3 downto 0);
  signal uplink_bitslip_cnt   : std_logic_vector (3 downto 0);

  signal reset : std_logic := '1';

begin

  --------------------------------------------------------------------------------
  -- clocks
  --------------------------------------------------------------------------------
  clock <= not clock after 1.5625 ns;

  process (clock)
  begin
    if (rising_edge(clock)) then
      clock160 <= not clock160;
    end if;
  end process;

  process (clock160)
  begin
    if (rising_edge(clock160)) then
      clock80 <= not clock80;
    end if;
  end process;

  process (clock80)
  begin
    if (rising_edge(clock80)) then
      clock40 <= not clock40;
    end if;
  end process;

  --------------------------------------------------------------------------------
  -- reset
  --------------------------------------------------------------------------------

  process (clock40)
    variable counter : integer range 0 to 31;
  begin
    if (rising_edge(clock40)) then
      counter := counter + 1;
    end if;

    if (reset = '1' and counter = 31) then
      reset <= '0';
    end if;

  end process;

  --------------------------------------------------------------------------------
  -- fake data
  --------------------------------------------------------------------------------

  process (clock40)
    variable counter : integer range 0 to 65535;
  begin
    if (rising_edge(clock40)) then
      counter := counter + 1;
    end if;

    cnt16 <= std_logic_vector(to_unsigned(counter, 16));

  end process;

  --------------------------------------------------------------------------------
  -- clk_en
  --------------------------------------------------------------------------------
  process (clock)
    variable counter : integer range 0 to 8;
  begin
    if (rising_edge(clock)) then

      if rst_uplink_i(0) = '1' then
        counter := 0;
        clk_en  <= '0';

      else
        counter := counter + 1;

        if counter = 8 then
          counter := 0;
        end if;

        clk_en <= '0';
        if counter = 0 then
          clk_en <= '1';
        end if;
      end if;


    end if;
  end process;

  data_init : for I in 0 to (g_NUM_LPGBTS-1) generate
  begin
    process (clock)
    begin
      if (rising_edge(clock)) then
        if (reset = '1' or emul_uplink_ready_o(I) = '0' or emul_downlink_ready_o(I) = '0') then
          lpgbt_data_from_backend_r(I) <= (others => '0');
        else
          lpgbt_data_from_backend_r(I) <= lpgbt_data_from_backend(I);
        end if;
      end if;
    end process;

    backend_data_to_lpgbt(I) <= cnt16 & cnt16;
    lpgbt_data_to_backend(I) <= lpgbt_data_from_backend_r(I) &lpgbt_data_from_backend_r(I) &lpgbt_data_from_backend_r(I) &lpgbt_data_from_backend_r(I) &lpgbt_data_from_backend_r(I) &lpgbt_data_from_backend_r(I) & lpgbt_data_from_backend_r(I);
    -- lpgbt_data_to_backend(I) <= x"FFFFEEEEDDDDCCCCBBBBAAAA99998888777766665555444433332222";
    -- lpgbt_data_to_backend(I) <= x"F012E012d012c012b012a01290128012701260125012401230122012";
    -- lpgbt_data_to_backend(I) <= x"FFFFEEEEDDDDCCCCBBBBAAAA999988887777666655554444" & lpgbt_data_from_backend_r(0);
    -- lpgbt_data_to_backend(I) <= lpgbt_data_to_backend_x(I);
    uplink_ic_i (I)          <= "00";
    uplink_ec_i (I)          <= "00";

    uplink_clken_i (I)  <= clk_en;
    uplink_ready_i (I)  <= '1';
    downlink_ready_i(I) <= '1';
    rst_downlink_i(I)   <= reset;
    rst_uplink_i(I)     <= reset;
    clock_vec(I)        <= clock;
    clock40_vec(I)      <= clock40;


  end generate;

  --------------------------------------------------------------------------------
  --
  --------------------------------------------------------------------------------

  process (rxslide(0))
    variable counter : integer range 0 to 15;
  begin
    if (rising_edge(rxslide(0))) then
      counter := counter + 1;
    end if;
    --bitslip_cnt <= std_logic_vector(to_unsigned(counter,5));
    downlink_bitslip_cnt <= std_logic_vector(to_unsigned(counter, 4));
  end process;

  process (uplink_bitslip(0))
    variable counter : integer range 0 to 15;
  begin
    if (rising_edge(rxslide(0))) then
      counter := counter + 1;
    end if;
    --bitslip_cnt <= std_logic_vector(to_unsigned(counter,5));
    uplink_bitslip_cnt <= std_logic_vector(to_unsigned(counter, 4));
  end process;

  bitslip_gen : for I in 0 to (g_NUM_LPGBTS-1) generate
  begin
    -- i_bitslip : entity work.bitslip
    -- port map(
    --     fabric_clk  => clock,
    --     reset       => '0',
    --     bitslip_cnt => bitslip_cnt,
    --     din         =>  lpgbt_downlink_mgt_word_array(I),
    --     dout        =>  lpgbt_downlink_mgt_word_array_bitslip(I)
    -- );

    i_srl16e_bbl : entity work.srl16e_bbl
      generic map (
        WIDTH => 32
        )
      port map (
        clock => clock,
        ce    => std_ulogic'('1'),
      adr => downlink_bitslip_cnt,
      d   => lpgbt_downlink_mgt_word_array(I),
      q   => lpgbt_downlink_mgt_word_array_bitslip(I)
      );

    i_srl16e_bbl2 : entity work.srl16e_bbl
      generic map (
        WIDTH => 32
        )
      port map (
        clock => clock,
        ce    => std_ulogic'('1'),
      adr => uplink_bitslip_cnt,
      d   => lpgbt_uplink_mgt_word_array(I),
      q   => lpgbt_uplink_mgt_word_array_bitslip(I)
      );

  end generate;
  --------------------------------------------------------------------------------
  --
  --------------------------------------------------------------------------------

  lpgbtemul_wrapper_1 : entity work.lpgbtemul_wrapper
    generic map (
      g_NUM_LPGBTS => g_NUM_LPGBTS
      )
    port map (
      uplink_data_array_i   => lpgbt_data_to_backend,
      downlink_data_array_o => lpgbt_data_from_backend,

      lpgbt_uplink_mgt_word_array_o   => lpgbt_uplink_mgt_word_array,
      lpgbt_downlink_mgt_word_array_i => lpgbt_downlink_mgt_word_array_bitslip,

      uplink_ic_i      => uplink_ic_i,
      uplink_ec_i      => uplink_ec_i,
      downlink_ic_o    => downlink_ic_o,
      downlink_ec_o    => downlink_ec_o,
      uplink_clken_i   => uplink_clken_i,
      uplink_ready_o   => emul_uplink_ready_o,
      downlink_ready_o => emul_downlink_ready_o,
      downlink_clken_o => open,
      rxusrclk_i       => clock_vec,    -- 320
      txusrclk_i       => clock_vec,
      uplink_ready_i   => uplink_ready_i,
      downlink_ready_i => downlink_ready_i,
      rxslide_o        => rxslide,
      rst_downlink_i   => rst_downlink_i,
      rst_uplink_i     => rst_uplink_i
      );

  lpgbt_logic_top_1 : entity work.lpgbt_logic_top
    generic map (
      g_NUM_UPLINKS   => g_NUM_LPGBTS,
      g_NUM_DOWNLINKS => g_NUM_LPGBTS)
    port map (
      clock320_i => clock,
      reset_i    => reset,

      lpgbt_uplink_data_array_o   => backend_data_from_lpgbt,
      lpgbt_downlink_data_array_i => backend_data_to_lpgbt,

      lpgbt_downlink_mgt_word_array_o => lpgbt_downlink_mgt_word_array,
      lpgbt_uplink_mgt_word_array_i   => lpgbt_uplink_mgt_word_array_bitslip,

      lpgbt_downlink_ready_o  => lpgbt_downlink_ready_o,
      lpgbt_uplink_ready_o    => lpgbt_uplink_ready_o,
      lpgbt_uplink_bitslip_o  => uplink_bitslip,
      lpgbt_uplink_rxusrclk_i => (others => clock),  -- 320
      lpgbt_uplink_clock_en_o => open
      );


end Behavioral;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library tdc;
use tdc.csm_pkg.all;

library hal;
use hal.lpgbt_pkg.all;
use hal.system_types_pkg.all;
use hal.board_pkg.all;
use hal.board_pkg_common.all;
use hal.link_map.all;

library shared_lib;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_types_pkg.all;

entity tdc_decoder_wrapper is
  generic(
    g_ENABLE_MASK : std_logic_vector;
    g_LEGACY_FLAG : std_logic_vector;
    g_CSM         : integer;
    g_NUM_TDCS    : integer;
    g_NUM_UPLINKS : integer
    );

  port(

    clock : in std_logic;
    reset : in std_logic;

    -- data from LPGBTs
    lpgbt_uplink_data_i : in lpgbt_uplink_data_rt_array (g_NUM_UPLINKS-1 downto 0);


    -- TDC hits from CSM
    tdc_hits_o  : out tdcpolmux2tar_avt (g_NUM_TDCS-1 downto 0);
    err_cnt_o   : out std16_array_t (g_NUM_TDCS-1 downto 0);
    synced_o    : out std_logic_vector (g_NUM_TDCS-1 downto 0);
    read_done_i : in  std_logic_vector (g_NUM_TDCS-1 downto 0)

    );
end tdc_decoder_wrapper;

architecture behavioral of tdc_decoder_wrapper is

  type err_cnt_array_t is array (integer range <>) of std_logic_vector(15 downto 0);
  signal err_cnt : err_cnt_array_t (g_NUM_TDCS-1 downto 0) := (others => (others => '0'));

begin

  tdc_loop : for I in g_ENABLE_MASK'range generate
  begin

    tdc_gen : if (g_ENABLE_MASK(I)) generate

      -- d0 carries the odd bits, d1 carries the even bits
      constant d1    : integer := elink_pair_map(I).ch2;
      constant d0    : integer := elink_pair_map(I).ch1;
      constant lpgbt : integer := elink_pair_map(I).lpgbt;

      signal err       : std_logic;
      signal even_data : std_logic_vector (7 downto 0);
      signal odd_data  : std_logic_vector (7 downto 0);

      signal tdc_word  : std_logic_vector (31 downto 0);
      signal tdc_valid : std_logic;

      signal valid : std_logic := '0';

      signal tdc_hit : tdcpolmux2tar_rt;

      -- given a std_logic_vector A such as 111011, and a position index POS,
      -- this function returns the zero supressed count of the set bit
      -- bits which are not set will return -1.
      --
      -- test cases are below
      --
      -- only works correctly with descending vectors, e.g. x downto y.. if you
      -- have an ascending vector you should reverse it

      function get_ith_bit_index (a : std_logic_vector; pos : integer; length : integer)
        return integer is
        variable n_ones : natural := 0;
      begin
        -- short circuit: a 0 should always return -1
        if (a(pos) = '0') then
          return -1;
        elsif (pos=0) then
          return 0;
        else
          for index in 0 to pos-1 loop
            if a(index) = '1' then
              n_ones := n_ones + 1;
            end if;
          end loop;
          return n_ones;
        end if;
      end function;
        
      -- the idx of the TDC is actually retrieved by suppressing the zeroes in the mask
      constant idx : integer := get_ith_bit_index (g_ENABLE_MASK, I, c_MDT_CONFIG'length);

    begin

      --------------------------------------------------------------------------------
      -- function tests
      --------------------------------------------------------------------------------

      test_gen : if (true) generate
        constant test : std_logic_vector(5 downto 0) := "111011";
      begin
        assert get_ith_bit_index(test,0,6)=0  report "function get_ith_bit_index failed " & integer'image(0) severity error;
        assert get_ith_bit_index(test,1,6)=1  report "function get_ith_bit_index failed " & integer'image(1) severity error;
        assert get_ith_bit_index(test,2,6)=-1 report "function get_ith_bit_index failed " & integer'image(2) severity error;
        assert get_ith_bit_index(test,3,6)=2  report "function get_ith_bit_index failed " & integer'image(3) severity error;
        assert get_ith_bit_index(test,4,6)=3  report "function get_ith_bit_index failed " & integer'image(4) severity error;
        assert get_ith_bit_index(test,5,6)=4  report "function get_ith_bit_index failed " & integer'image(5) severity error;
        assert get_ith_bit_index("111111111111111111",17,18)=17  report "function get_ith_bit_index failed" & integer'image(17)  severity error;
      end generate;

      --------------------------------------------------------------------------------
      -- Data Mapping
      --------------------------------------------------------------------------------

      even_data <= lpgbt_uplink_data_i(lpgbt).data(8*(d1+1)-1 downto 8*d1);
      odd_data  <= lpgbt_uplink_data_i(lpgbt).data(8*(d0+1)-1 downto 8*d0);
      valid     <= lpgbt_uplink_data_i(lpgbt).valid;

      tdc_hit.csmid      <= to_unsigned(g_CSM, tdc_hit.csmid'length);
      tdc_hit.tdcid      <= to_unsigned(I, tdc_hit.tdcid'length);
      tdc_hit.tdc        <= convert(tdc_word,tdc_hit.tdc);
      tdc_hit.data_valid <= tdc_valid;

      tdc_hits_o(idx) <= convert (tdc_hit,tdc_hits_o(idx));

      --------------------------------------------------------------------------------
      -- New TDC
      --------------------------------------------------------------------------------

      new_tdc_gen : if (g_LEGACY_FLAG(I) = '0') generate

        tdc_decoder_inst : entity tdc.tdc_decoder
          port map (
            clock       => clock,
            reset       => reset,
            resync_i    => '0',            -- TODO: connect this to AXI
            synced_o    => synced_o(idx),  -- TODO: connect this to AXI
            data_even   => even_data,
            data_odd    => odd_data,
            valid_i     => valid,          -- lpgbt valid flag
            tdc_word_o  => tdc_word,
            valid_o     => tdc_valid,
            read_done_i => read_done_i(idx),
            tdc_err_o   => err
            );
      end generate;  -- new TDC gen

      --------------------------------------------------------------------------------
      -- Legacy TDC
      --------------------------------------------------------------------------------

      legacy_tdc_gen : if (g_LEGACY_FLAG(I) = '1') generate
        assert false report "ERROR: we don't support legacy TDC links yet" severity error;
      end generate;  -- new TDC gen

      --------------------------------------------------------------------------------
      -- Err Counter
      --------------------------------------------------------------------------------

      cnt_err : entity work.counter
        generic map (width => 16)
        port map (
          clk    => clock,
          reset  => '0',
          enable => '1',
          event  => err,
          count  => err_cnt(idx),
          at_max => open
          );

    end generate;
  end generate;  -- TDC loop

end behavioral;

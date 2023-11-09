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
  
COMPONENT ila_tdc

PORT (
	clk : IN STD_LOGIC;
	probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe3 : IN STD_LOGIC_VECTOR(9 DOWNTO 0); 
	probe4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe5 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe6 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe7 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe8 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe9 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe10 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe11 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe12 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe13 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe14 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe15 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe16 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe17 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe18 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe19 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe20 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe21 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	probe22 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe23 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe24 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe25 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe26 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe27 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe28 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe29 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
	probe30 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	probe31 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END COMPONENT  ;
  
    
    type lpgbt_data is array (integer range 0 to 9) of  std_logic_vector (7 downto 0);
    type tdc_data is array (integer range 0 to 9) of  std_logic_vector (31 downto 0);

    signal even_data_a : lpgbt_data;
    signal odd_data_a : lpgbt_data;
    signal tdc_word_a : tdc_data;
    signal tdc_valid_a : std_logic_vector(9 downto 0);

begin
 
   ila_tdc_inst : ila_tdc
   PORT MAP (
      clk => clock,
      probe0(0) => lpgbt_uplink_data_i(0).valid, 
      probe1 => even_data_a(0), 
      probe2 => odd_data_a(0), 
      probe3 => tdc_valid_a,
      probe4 => even_data_a(1),
      probe5 => odd_data_a(1),
      probe6 => even_data_a(2),
      probe7 => odd_data_a(2),
      probe8 => even_data_a(3),
      probe9 => odd_data_a(3),
      probe10 => even_data_a(4),
      probe11 => odd_data_a(4),
      probe12 => even_data_a(5),
      probe13 => odd_data_a(5),
      probe14 => even_data_a(6),
      probe15 => odd_data_a(6),
      probe16 => even_data_a(7),
      probe17 => odd_data_a(7),
      probe18 => even_data_a(8),
      probe19 => odd_data_a(8),
      probe20 => even_data_a(9),
      probe21 => odd_data_a(9),
      probe22 => tdc_word_a(0),
      probe23 => tdc_word_a(1),
      probe24 => tdc_word_a(2),
      probe25 => tdc_word_a(3),
      probe26 => tdc_word_a(4),
      probe27 => tdc_word_a(5),
      probe28 => tdc_word_a(6),
      probe29 => tdc_word_a(7),
      probe30 => tdc_word_a(8),
      probe31 => tdc_word_a(9)
   );


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
        
      ila_gen: if (I < 10) generate
      begin
        even_data_a(I) <= even_data;
        odd_data_a(I) <= odd_data;
        tdc_valid_a(I) <= tdc_valid;
        tdc_word_a(I) <= tdc_word;
      end generate;


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

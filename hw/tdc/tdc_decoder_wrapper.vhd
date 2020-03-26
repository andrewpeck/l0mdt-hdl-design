library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_constants_pkg.all;
use l0mdt_lib.mdttp_functions_pkg.all;

library framework;
use framework.board_pkg.all;
use framework.board_pkg_common.all;
use framework.constants_pkg.all;
use framework.system_types_pkg.all;
use framework.lpgbt_pkg.all;

entity tdc_decoder_wrapper is
  port(

    clock          : in std_logic;
    pipeline_clock : in std_logic;
    reset          : in std_logic;

    -- data from LPGBTs
    lpgbt_uplink_data : in lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- TDC hits from CSM
    tdc_hits : out TDCPOLMUX_rt_array (c_NUM_TDC_INPUTS-1 downto 0)

    );
end tdc_decoder_wrapper;

architecture behavioral of tdc_decoder_wrapper is

begin

  assert false report "Generating " & integer'image(c_NUM_TDC_INPUTS) & " TDC Decoders" severity note;

  mgt_loop : for I in 0 to (c_NUM_MGTS-1) generate
  begin

    tdc_gen : if (c_TDC_LINK_MAP(I).link_id /= -1 and lpgbt_uplink_idx_array(I) /= -1) generate

      function interleave (even : std_logic_vector (7 downto 0); odd : std_logic_vector (7 downto 0))
        return std_logic_vector is
        variable int : std_logic_vector (15 downto 0);
      begin
        for I in 0 to even'length-1 loop
          int ((I+1)*2-1 downto I*2) := even(I) & odd(I);
        end loop;
        return int;
      end interleave;

      signal even_data        : std_logic_vector (7 downto 0);
      signal odd_data         : std_logic_vector (7 downto 0);
      signal interleaved_data : std_logic_vector (15 downto 0);
      signal valid            : std_logic;

      signal tdc_hit_vector : TDC_at;

      signal tdc_hits_pre_cdc : TDC_at;
      signal tdc_hits_pre_cdc_valid : std_logic;

      constant idx     : integer := lpgbt_uplink_idx_array(I);
      constant even_id : integer := c_TDC_LINK_MAP(I).even_elink;
      constant odd_id  : integer := c_TDC_LINK_MAP(I).odd_elink;
      constant legacy  : boolean := c_TDC_LINK_MAP(I).legacy;

    begin

      gen_tdc : if (idx /= -1 and even_id /= -1 and odd_id /= -1) generate

        attribute DONT_TOUCH             : string;
        attribute MGT_INDEX              : integer;
        attribute MGT_INDEX of sync_csm  : label is I;
        attribute DONT_TOUCH of sync_csm : label is "true";

      begin

        assert false report " > Generating TDC Decoder #" & integer'image(idx) & " on MGT #"
          & integer'image(I) & " even elink = " & integer'image(even_id) &
          " odd elink = " & integer'image(odd_id) severity note;

        assert (c_MGT_MAP(I).mgt_type = MGT_LPGBT or c_MGT_MAP(I).mgt_type = MGT_LPGBT_SIMPLEX) report
          " > TDC_LINK_MAP assigns elink to non-lpgbt MGT" severity error;

        even_data        <= lpgbt_uplink_data(idx).data(8*(even_id+1)-1 downto 8*even_id);
        odd_data         <= lpgbt_uplink_data(idx).data(8*(odd_id +1)-1 downto 8* odd_id);
        valid            <= lpgbt_uplink_data(idx).valid;
        interleaved_data <= interleave (even_data, odd_data);

        -- constants
        tdc_hits(I).fiberid <= std_logic_vector(to_unsigned(I,       TDCPOLMUX_FIBERID_LEN));
        tdc_hits(I).elinkid <= std_logic_vector(to_unsigned(even_id, TDCPOLMUX_ELINKID_LEN));

        tdc_gen : if (legacy = false) generate
          --assert false report " > Generating Legacy TDC Decoder #" & integer'image(idx) & " on MGT #"
          -- & integer'image(I) & " elink = " & integer'image(even_id) severity note;

          tdc_decoder_v2_inst : entity framework.tdc_decoder_v2
            port map (
              clock      => clock,
              reset      => reset,
              data_i     => interleaved_data,
              valid_i    => valid,
              tdc_word_o => tdc_hits_pre_cdc,
              valid_o    => tdc_hits_pre_cdc_valid,
              tdc_err_o  => open -- TODO: connect this to a counter
              );

        end generate;

        -- legacy_tdc_gen : if (legacy = true) generate
        --   tdc_hits(I).tdc_r     <= (others => '0');
        --   tdc_hits(I).datavalid <= valid;
        -- end generate;

        -- constants don't need any CDC, only cross clocks with the 32 bit hit
        -- data + valid flag

        sync_csm : entity work.sync_cdc
          generic map (
            WIDTH    => TDC_LEN,
            N_STAGES => 1)
          port map (
            clk_i   => pipeline_clock,
            valid_i => tdc_hits_pre_cdc_valid,
            data_i  => tdc_hits_pre_cdc,
            valid_o => tdc_hits(I).datavalid,
            data_o  => tdc_hit_vector
            );

        tdc_hits(I).tdc_r <= tdc_2rf(tdc_hit_vector);

      end generate;


    end generate;

  end generate;

end behavioral;

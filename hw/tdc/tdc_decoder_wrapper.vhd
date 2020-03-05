library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library framework;
use framework.all;
use framework.board_pkg.all;
use framework.board_pkg_common.all;
use framework.constants_pkg.all;
use framework.lpgbt_pkg.all;
use framework.mdttp_types_pkg.all;
use framework.mdttp_pkg.all;
use framework.mgt_pkg.all;
use framework.system_types_pkg.all;

entity tdc_decoder_wrapper is
  port(

    clock          : in std_logic;
    pipeline_clock : in std_logic;
    reset          : in std_logic;

    -- data from LPGBTs
    lpgbt_uplink_data : in lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- TDC hits from CSM
    tdc_hits : out TDCFORMAT_rt_array (c_NUM_TDC_INPUTS-1 downto 0)

    );
end tdc_decoder_wrapper;


architecture behavioral of tdc_decoder_wrapper is

  signal tdc_hits_pre_cdc : TDCFORMAT_rt_array (c_NUM_TDC_INPUTS-1 downto 0);

begin

  mgt_loop : for I in 0 to (c_NUM_MGTS-1) generate
  begin

    -- only generate downlinks for duplex lpgbts
    tdc_gen : if (c_TDC_LINK_MAP(I).link_id /= -1) generate

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

      constant idx        : integer := lpgbt_uplink_idx_array(I);
      constant even_id    : integer := c_TDC_LINK_MAP(I).even_elink;
      constant odd_id     : integer := c_TDC_LINK_MAP(I).odd_elink;
      constant station_id : integer := c_TDC_LINK_MAP(I).station_id;

    begin

      assert (c_MGT_MAP(I).mgt_type = MGT_LPGBT or c_MGT_MAP(I).mgt_type = MGT_LPGBT_SIMPLEX) report "TDC_LINK_MAP assigns elink to non-lpgbt MGT" severity error;

      even_data        <= lpgbt_uplink_data(idx).data(8*(even_id+1)-1 downto 8*even_id);
      odd_data         <= lpgbt_uplink_data(idx).data(8*(odd_id +1)-1 downto 8* odd_id);
      valid            <= lpgbt_uplink_data(idx).valid;
      interleaved_data <= interleave (even_data, odd_data);

      tdc_hits(I) <= tdc_hits_pre_cdc(I);

      -- tdc_decoder_inst : entity tdc.tdc_decoder
      --   port map (
      --     clock      => clock,
      --     data => interleaved_data,
      --     valid => valid,
      --     tdc_hit_o  => tdc_hits_pre_cdc(I)
      -- );

      tdc_hits_pre_cdc(I).CSM       <= interleaved_data & interleaved_data;  -- FIXME temp dummy
      tdc_hits_pre_cdc(I).datavalid <= valid;
      tdc_hits_pre_cdc(I).fiberid   <= std_logic_vector(to_unsigned(I, TDCFORMAT_fiberid_width));
      tdc_hits_pre_cdc(I).elinkid   <= std_logic_vector(to_unsigned(even_id, TDCFORMAT_elinkid_width));
      tdc_hits_pre_cdc(I).stationid <= std_logic_vector(to_unsigned(station_id, TDCFORMAT_stationid_width));

    end generate;
  end generate;

end behavioral;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library tdc;
use tdc.csm_pkg.all;

--library xil_defaultlib;

library hal;

use hal.board_pkg.all;
use hal.board_pkg_common.all;
use hal.constants_pkg.all;
use hal.system_types_pkg.all;
use hal.lpgbt_pkg.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

entity polmux_wrapper is
  generic (
    ASYNC_FIFO    : boolean := false;
    g_WIDTH       : integer := 0;
    g_ID          : integer := 0;
    g_STATION     : station_id_t;
    g_STATION_STR : string
    );
  port(

    clock          : in std_logic;
    pipeline_clock : in std_logic;
    reset          : in std_logic;

    tdc_hits_i  : in  tdcpolmux2tar_avt (g_WIDTH-1 downto 0);
    read_done_o : out std_logic_vector (g_WIDTH-1 downto 0);

    tdc_hits_o : out tdcpolmux2tar_vt

    );
end polmux_wrapper;
architecture behavioral of polmux_wrapper is
  signal polmux_o  : tdcpolmux2tar_rt;
  signal polmux_o_v  : tdcpolmux2tar_vt;
  signal read_done : std_logic_vector (g_WIDTH-1 downto 0);
  signal valid     : std_logic := '0';
  signal tdc_hits  : tdcpolmux2tar_vt;
begin

  -- polmux_inst
  polling_mux_inst : entity tdc.polling_mux
    generic map (
      g_WIDTH => g_WIDTH
      )
    port map (
      clock       => clock,             -- 320MHz system clock
      tdc_hits_i  => tdc_hits_i,        -- input hits
      read_done_o => read_done_o,       -- will be asserted high once a tdc hit is read,
      tdc_hit_o   => polmux_o           -- polling mux outputs to cdc
      );

  ----------------------------------------------------------------------------------------------------
  -- Clock domain crossing
  ----------------------------------------------------------------------------------------------------

  -- TODO: check the timing of the 'not valid' bit as a valid signal, make sure it is applied to the
  -- right clock cycle
  --
  -- TODO: a "smart sync" of some sort..?... can CDC based on a valid bit on certain clock cycles
  -- only

  sync_gen : if (not ASYNC_FIFO) generate

    process (pipeline_clock) is
    begin
      if (rising_edge(pipeline_clock)) then
        tdc_hits   <= convert(polmux_o,tdc_hits);
        tdc_hits_o <= tdc_hits;
      end if;
    end process;

  end generate;

  async_gen : if (ASYNC_FIFO) generate
    signal fifo_din  : std_logic_vector (63 downto 0) := (others => '0');
    signal fifo_dout : std_logic_vector (63 downto 0) := (others => '0');
  begin

    fifo_din <= std_logic_vector(resize(unsigned(convert(polmux_o,polmux_o_v)), fifo_din'length));  -- zero pad

    polmux_sync_fifo_inst : entity tdc.fifo_async
      generic map (
        DEPTH    => 16,
        WR_WIDTH => 64,
        RD_WIDTH => 64
        )
      port map (
        rst     => std_logic0,
        wr_clk  => clock,
        rd_clk  => pipeline_clock,
        din     => fifo_din,
        dout    => fifo_dout,
        wr_en   => polmux_o.data_valid,
        rd_en   => std_logic1,          --  FIFO internally gates the read signal with (not EMPTY)
        empty   => open,
        valid   => valid,
        full    => open,
        sbiterr => open,
        dbiterr => open
        );

    process (pipeline_clock) is
    begin
      if (rising_edge(pipeline_clock)) then
        tdc_hits <= fifo_dout when
                    valid = '1' else (others => '0');
        tdc_hits_o <= tdc_hits;
      end if;
    end process;
  end generate;

end behavioral;

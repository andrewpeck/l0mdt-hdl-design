library IEEE;
library xpm;
library types_def;
library daq_def;

use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.math_real.all;

use xpm.vcomponents.all;

use types_def.common_defs.all;

use daq_def.daq_devel_defs.all;
use daq_def.daq_defs.all;
use daq_def.daq_row_defs.all;

entity daq_node_fifo is
  generic (G: daq_node_fifo_grt);
  port (port_ir: in  daq_node_fifo_irt; port_or: out daq_node_fifo_ort);
end entity daq_node_fifo;

architecture V1 of daq_node_fifo is

  signal fifo_er : daq_node_fifo_ert;

  constant FIFO_READ_MODE : string := "fwft";

  impure function READ_MODE_VAL return integer is
    variable y: integer;
  begin
    y := 0 when FIFO_READ_MODE = "std" else 1;
    return y;
  end function READ_MODE_VAL;

  constant FIFO_READ_DEPTH : integer := DAQ_NODE_FIFO_DEPTH
                                        * G.WRITE_DATA_WIDTH / G.READ_DATA_WIDTH;

  constant PROG_FULL_THR : integer := (DAQ_NODE_FIFO_DEPTH - 3)
                                        - (READ_MODE_VAL * 2
                                           * (DAQ_NODE_FIFO_DEPTH / FIFO_READ_DEPTH));

  constant PROG_EMPTY_THR : integer :=  (DAQ_NODE_FIFO_DEPTH - 3) - (READ_MODE_VAL * 2);

  constant WRITE_DATA_COUNT_WIDTH : integer := integer(ceil(log2(real(G.WRITE_DATA_WIDTH))));


  constant READ_DATA_COUNT_WIDTH  : integer := integer(ceil(log2(real(G.READ_DATA_WIDTH))));

  signal dout        : std_logic_vector(G.READ_DATA_WIDTH-1 downto 0);
  signal empty       : std_logic;
  signal full        : std_logic;
  signal rd_rst_busy : std_logic;
  signal rd_count    : std_logic_vector(READ_DATA_COUNT_WIDTH-1 downto 0);
  signal wr_rst_busy : std_logic;
  signal din         : std_logic_vector(G.WRITE_DATA_WIDTH-1 downto 0);
  signal rd_en       : std_logic;
  signal rst         : std_logic;
  signal wr_clk      : std_logic;
  signal wr_en       : std_logic;

begin

  wr_clk <= port_ir.sys.clk320;
  rst <= port_ir.sys.rst;

  wr_en <= port_ir.src.wr_en
           when (rst = '0'
                 and rd_rst_busy = '0'
                 and wr_rst_busy = '0')
           else '0';

  rd_en <= port_ir.dst.rd_en
           when (rst = '0'
                 and rd_rst_busy = '0'
                 and wr_rst_busy = '0')
           else '0';

  port_or.dst.nempty <= not empty;
  port_or.src.full <= full;

  ig0: if port_or.dst.count'length < rd_count'length generate
    port_or.dst.count <= rd_count(port_or.dst.count'range);
  end generate ig0;

  ig1: if port_or.dst.count'length > rd_count'length generate
    port_or.dst.count <= (port_or.dst.count'left downto rd_count'length => '0')
                    & rd_count;
  end generate ig1;

  ig2: if port_or.dst.count'length = dout'length generate
    port_or.dst.count <= dout;
  end generate ig2;

  ig_dout0: if port_or.dst.data'length < dout'length generate
    port_or.dst.data <= dout(port_or.dst.data'range);
  end generate ig_dout0;

  ig_dout1: if port_or.dst.data'length > dout'length generate
    port_or.dst.data <= (port_or.dst.data'left downto dout'length => '0')
                    & dout;
  end generate ig_dout1;

  ig_dout2: if port_or.dst.data'length = dout'length generate
    port_or.dst.data <= dout;
  end generate ig_dout2;

  ig_din0: if din'length < port_ir.src.data'length generate
    din <= port_ir.src.data(din'range);
  end generate ig_din0;

  ig_din1: if din'length > port_ir.src.data'length generate
    din <= (din'left downto port_ir.src.data'length => '0')
                    & port_ir.src.data;
  end generate ig_din1;

  ig_din2: if din'length = port_ir.src.data'length generate
    din <= port_ir.src.data;
  end generate ig_din2;

  xpm_fifo_sync_inst : xpm_fifo_sync
    generic map (
      DOUT_RESET_VALUE    => "0",                            -- String
      ECC_MODE            => "no_ecc",                       -- String
      FIFO_MEMORY_TYPE    => "auto",                         -- String
      FIFO_READ_LATENCY   => 0,                              -- DECIMAL
      FIFO_WRITE_DEPTH    => DAQ_NODE_FIFO_DEPTH,            -- DECIMAL
      FULL_RESET_VALUE    => 0,                              -- DECIMAL
      PROG_EMPTY_THRESH   => PROG_EMPTY_THR,                 -- DECIMAL
      PROG_FULL_THRESH    => PROG_FULL_THR,                  -- DECIMAL
      RD_DATA_COUNT_WIDTH => READ_DATA_COUNT_WIDTH,          -- DECIMAL
      READ_DATA_WIDTH     => G.READ_DATA_WIDTH,              -- DECIMAL
      READ_MODE           => FIFO_READ_MODE,                 -- String
      SIM_ASSERT_CHK      => 0,                              -- DECIMAL
      USE_ADV_FEATURES    => "0400",                         -- rd counter
      WAKEUP_TIME         => 0,                              -- DECIMAL
      WRITE_DATA_WIDTH    => G.WRITE_DATA_WIDTH,             -- DECIMAL
      WR_DATA_COUNT_WIDTH => WRITE_DATA_COUNT_WIDTH)         -- DECIMAL
    port map (
      almost_empty  => open,
      almost_full   => open,
      data_valid    => open,
      dbiterr       => open,
      dout          => dout,
      empty         => empty,
      full          => full,
      overflow      => open,
      prog_empty    => open,
      prog_full     => open,
      rd_data_count => rd_count,
      rd_rst_busy   => rd_rst_busy,
      sbiterr       => open,
      underflow     => open,
      wr_ack        => open,
      wr_data_count => open,
      wr_rst_busy   => wr_rst_busy,
      din           => din,
      injectdbiterr => '0',
      injectsbiterr => '0',
      rd_en         => rd_en,
      rst           => rst,
      sleep         => '0',
      wr_clk        => wr_clk,
      wr_en         => wr_en);

end architecture V1;

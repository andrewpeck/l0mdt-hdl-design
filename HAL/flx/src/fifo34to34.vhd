library ieee;
use ieee.std_logic_1164.all;

library unisim;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity fifo34to34b is
  port (rst            : in  std_logic
        ; fifo34_wclk  : in  std_logic
        ; fifo34b_we   : in  std_logic
        ; fifo34_din   : in  std_logic_vector(31 downto 0)
        ; fifo34_dtype : in  std_logic_vector( 1 downto 0)
        ; fifo34_full  : out std_logic
        ; fifo34_rclk  : in  std_logic
        ; fifo34_re    : in  std_logic
        ; fifo34_dout  : out std_logic_vector(31 downto 0)
        ; fifo_dtype   : out std_logic_vector( 1 downto 0)
        ; fifo34_empty : out std_logic);
end entity fifo34to34b;

architecture rtl of fifo34to34b is

  component fifo1kb_34bit
    port (rst         : in  std_logic
          ; wr_clk    : in  std_logic
          ; din       : in  std_logic_vector(33 downto 0)
          ; wr_en     : in  std_logic
          ; prog_full : out std_logic
          ; full      : out std_logic
          ; rd_clk    : in  std_logic
          ; rd_en     : in  std_logic
          ; dout      : out std_logic_vector(33 downto 0)
          ; empty     : out std_logic);
  end component;

  signal fifo34_we: std_logic;
  signal sfifo34_dout, sfifo34_din: std_logic_vector (33 downto 0);

begin


  fifo34b : fifo1kb_34bit
    port map (rst         => rst
              , wr_clk    => fifo34_wclk
              , din       => sfifo34_din
              , wr_en     => fifo34b_we
              , prog_full => fifo34_full
              , full      => open
              , rd_clk    => fifo34_rclk
              , rd_en     => fifo34_re
              , dout      => sfifo34_dout
              , empty     => fifo34_empty);

  sfifo34_din <= fifo34_dtype & fifo34_din;

  fifo34_dout <= sfifo34_dout(31 downto 0);
  fifo_dtype  <= sfifo34_dout(33 downto 32);

end architecture rtl ; -- of fifo34to34b






library ieee, UNISIM;
use ieee.numeric_std.all;
use UNISIM.VCOMPONENTS.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;

entity FIFO34to34b is
  port (
    FIFO34b_WE   : in     std_logic;
    clk240       : in     std_logic;
    fifo34_din   : in     std_logic_vector(31 downto 0);
    fifo34_dout  : out    std_logic_vector(31 downto 0);
    fifo34_dtype : in     std_logic_vector(1 downto 0);
    fifo34_empty : out    std_logic;
    fifo34_full  : out    std_logic;
    fifo34_rclk  : in     std_logic;
    fifo34_re    : in     std_logic;
    fifo_dtype   : out    std_logic_vector(1 downto 0);
    rst          : in     std_logic);
end entity FIFO34to34b;



architecture rtl of FIFO34to34b is
COMPONENT fifo1KB_34bit
  PORT (
    rst : IN std_logic;
    wr_clk : IN std_logic;
    rd_clk : IN std_logic;
    din : IN std_logic_vector(33 DOWNTO 0);
    wr_en : IN std_logic;
    rd_en : IN std_logic;
    dout : OUT std_logic_vector(33 DOWNTO 0);
    full : OUT std_logic;
    empty : OUT std_logic;
    prog_full : OUT std_logic
  );
END COMPONENT;

signal fifo34_we: std_logic;
signal sfifo34_dout, sfifo34_din: std_logic_vector (33 downto 0);

begin


FIFO34b : fifo1KB_34bit
  PORT MAP (
    rst => rst,
    wr_clk => clk240,
    rd_clk => fifo34_rclk,
    din => sfifo34_din,
    wr_en => FIFO34b_WE,
    rd_en => fifo34_re,
    dout => sfifo34_dout,
    full => open,
    empty => fifo34_empty,
    prog_full => fifo34_full
  );

sfifo34_din <= fifo34_dtype & fifo34_din;

fifo34_dout <= sfifo34_dout(31 downto 0);
fifo_dtype <= sfifo34_dout(33 downto 32);

end architecture rtl ; -- of FIFO34to34b


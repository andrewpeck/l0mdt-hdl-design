library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

entity flx_tx is
  generic (NLINKS : natural := 20);
  port (clk240_i              : in  std_logic
        ; clk320_i            : in  std_logic
        ; rst_i               : in  std_logic

        ; busy_i              : in  std_logic

        ; usr_data_vi : in  std_logic_vector_array(NLINKS-1 downto 0)(31 downto 0)
        ; usr_ctrl_vi : in  std_logic_vector_array(NLINKS-1 downto 0)(1 downto 0)
        ; usr_wren_vi : in  std_logic_vector(NLINKS-1 downto 0)
        ; mgt_data_vo : out std_logic_vector_array(NLINKS-1 downto 0)(31 downto 0));
end entity flx_tx;

architecture logic of flx_tx is
begin

  GEN_FM_PATHS : for ii in 0 to NLINKS-1 generate
    signal fifo_rd_clk   : std_logic;
    signal fifo_rd_en    : std_logic;
    signal fifo_rd_dbody : std_logic_vector(31 downto 0);
    signal fifo_rd_dtype : std_logic_vector( 1 downto 0);
    signal fifo_rd_empty : std_logic;
  begin
  
    u_fifo34to34b : entity work.fifo34to34b
      port map (rst            => rst_i             -- : in  std_logic);
                , fifo34_wclk  => clk320_i          -- : in  std_logic;
                , fifo34b_we   => usr_wren_vi(ii)   -- : in  std_logic;
                , fifo34_dtype => usr_ctrl_vi(ii)   -- : in  std_logic_vector(1 downto 0);
                , fifo34_din   => usr_data_vi(ii)   -- : in  std_logic_vector(31 downto 0);
                , fifo34_full  => open              -- : out std_logic;
                , fifo34_rclk  => fifo_rd_clk       -- : in  std_logic;
                , fifo34_re    => fifo_rd_en        -- : in  std_logic;
                , fifo34_empty => fifo_rd_empty     -- : out std_logic;
                , fifo34_dout  => fifo_rd_dbody     -- : out std_logic_vector(31 downto 0);
                , fifo_dtype   => fifo_rd_dtype);   -- : out std_logic_vector(1 downto 0);

    u_FMchannelTXctrl : entity work.FMchannelTXctrl
      port map (rst          => rst_i           -- : in  std_logic;
                , clk240     => clk240_i        -- : in  std_logic;
                , busy       => busy_i          -- : in  std_logic;
                , fifo_rclk  => fifo_rd_clk     -- : out std_logic;
                , fifo_re    => fifo_rd_en      -- : out std_logic;
                , fifo_dout  => fifo_rd_dbody   -- : in  std_logic_vector(31 downto 0);
                , fifo_dtype => fifo_rd_dtype   -- : in  std_logic_vector(1 downto 0);
                , fifo_empty => fifo_rd_empty   -- : in  std_logic;
                , dout       => mgt_data_vo(ii) -- : out std_logic_vector(31 downto 0);
                , kout       => open);          -- : out std_logic_vector(3 downto 0));
    
  end generate GEN_FM_PATHS;

end architecture logic;

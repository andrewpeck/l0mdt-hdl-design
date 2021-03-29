library ieee;
use ieee.std_logic_1164.all;

package spies_pkg is

  -------------------------
  -- TAR_SPY
  -------------------------

  -- bram control
  type tar_spy_bram_ctrl_t is record
    clk  : std_logic;
    en   : std_logic;
    rst  : std_logic;
    we   : std_logic_vector (3 downto 0);
    din  : std_logic_vector (31 downto 0);
    addr : std_logic_vector (15 downto 0);
  end record;

  -- spybuffer + bram control
  type tar_spy_ctrl_t is record
    bram     : tar_spy_bram_ctrl_t;
    freeze   : std_logic;
    playback : std_logic_vector (1 downto 0);
  end record;

  -- spybuffer readout
  type tar_spy_mon_t is record
    dout : std_logic_vector (31 downto 0);
  end record;

  -------------------------
  -- MPL_SPY
  -------------------------

  -- bram control
  type mpl_spy_bram_ctrl_t is record
    clk  : std_logic;
    en   : std_logic;
    rst  : std_logic;
    we   : std_logic_vector (3 downto 0);
    din  : std_logic_vector (31 downto 0);
    addr : std_logic_vector (14 downto 0);
  end record;

  -- spybuffer + bram control
  type mpl_spy_ctrl_t is record
    bram     : mpl_spy_bram_ctrl_t;
    freeze   : std_logic;
    playback : std_logic_vector (1 downto 0);
  end record;

  -- spybuffer readout
  type mpl_spy_mon_t is record
    dout : std_logic_vector (31 downto 0);
  end record;

  -------------------------
  -- Zipped up records
  -------------------------

  type spy_ctrl_t is record
     tar_spy : tar_spy_ctrl_t;
     mpl_spy : mpl_spy_ctrl_t;
  end record;

  type spy_mon_t is record
     tar_spy : tar_spy_mon_t;
     mpl_spy : mpl_spy_mon_t;
  end record;

end package;

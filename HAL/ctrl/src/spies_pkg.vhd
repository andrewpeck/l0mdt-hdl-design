library ieee;
use ieee.std_logic_1164.all;

package spies_pkg is

  -------------------------
  -- TAR_SPY
  -------------------------

  constant TAR_SPY_WIDTH : natural := 32;
  constant TAR_SPY_DEPTH : natural := 65536;
  constant TAR_SPY_ADDRB : natural := 16;
  constant TAR_SPY_META_DEPTH : natural := 0;
  constant TAR_SPY_META_WIDTH : natural := 0;
  constant TAR_SPY_META_ADDRB : natural := 0;

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
    bram_a   : tar_spy_bram_ctrl_t;
    freeze      : std_logic;
    playback    : std_logic_vector (1 downto 0);
    playback_we : std_logic;
  end record;

  -- spybuffer readout
  type tar_spy_mon_t is record
    dout_a : std_logic_vector (31 downto 0);
    almost_full    : std_logic;
    empty          : std_logic;
  end record;

  -------------------------
  -- MPL_SPY
  -------------------------

  constant MPL_SPY_WIDTH : natural := 32;
  constant MPL_SPY_DEPTH : natural := 32768;
  constant MPL_SPY_ADDRB : natural := 15;
  constant MPL_SPY_META_DEPTH : natural := 16;
  constant MPL_SPY_META_WIDTH : natural := 8;
  constant MPL_SPY_META_ADDRB : natural := 4;

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
    bram_a   : mpl_spy_bram_ctrl_t;
    freeze      : std_logic;
    playback    : std_logic_vector (1 downto 0);
    playback_we : std_logic;
    -- metadata
    meta_read_addr : std_logic_vector (3 downto 0);
  end record;

  -- spybuffer readout
  type mpl_spy_mon_t is record
    dout_a : std_logic_vector (31 downto 0);
    almost_full    : std_logic;
    empty          : std_logic;
    -- metadata
    meta_read_data          : std_logic_vector (7 downto 0);
    dbg_spy_write_addr      : std_logic_vector (31 downto 0);
    dbg_spy_meta_write_addr : std_logic_vector (3 downto 0);
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

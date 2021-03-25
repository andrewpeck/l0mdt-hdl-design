package spybuffer_pkg is

  -- valid metadata words.
  constant START_EVENT : std_logic_vector (7 downto 0) := "10101011";
  constant END_EVENT   : std_logic_vector (7 downto 0) := "11001101";

  -- Playback states
  constant NO_PLAYBACK    : std_logic_vector (1 downto 0) := "00";
  constant PLAYBACK_ONCE  : std_logic_vector (1 downto 0) := "01";
  constant PLAYBACK_LOOP  : std_logic_vector (1 downto 0) := "10";
  constant PLAYBACK_WRITE : std_logic_vector (1 downto 0) := "11";

  component SpyBuffer is
    generic (
      -- The width of input data (e.g. 2^WIDTH bytes + 1 for metadata).
      DATA_WIDTH_A : integer := 65;
      DATA_WIDTH_B : integer := 65;

      -- Width of the spy buffer's memory block. (e.g. 2^WIDTH rows of DATA_WIDTH size).
      SPY_MEM_WIDTH_A : integer := 7;
      SPY_MEM_WIDTH_B : integer := 7;

      -- The width of the flow control buffer's memory.
      -- If this is pushed to 5 or higher; block RAM will be inferred.
      -- (Do we want that?)
      -- (Presumably; the threshold coul also be adjusted!)
      FC_FIFO_WIDTH : integer := 3;

      -- The size and width of the event list / metadata list memory.
      EL_MEM_SIZE    : integer := 16;
      EL_MEM_WIDTH_A : integer := 4;
      EL_MEM_WIDTH_B : integer := 4;

      -- Passthrough mode setting. If PASSTHROUGH is set to 1, then we
      -- will *not* instantiate the FIFO. Instead, input will be continually
      -- assigned to output, the "almost_full" and "empty" wires will be
      -- hardcoded to 1, and the enables will be ignored.
      PASSTHROUGH : integer := 0
      );
    port (
      -- Flow Control Signals
      -- The read and write clocks, For connecting RTL Blocks
      rclock : in std_logic;
      wclock : in std_logic;

      -- Read- and write-side resets. It may not be necessary to have two.
      -- These are really "resetbar" (aka "rstb")-- they reset on the negative edge.
      rresetbar : in std_logic;
      wresetbar : in std_logic;

      -- Inputs to the flow control FIFO.
      write_data   : in std_logic_vector (DATA_WIDTH_A-1 downto 0);
      write_enable : in std_logic;
      read_enable  : in std_logic;

      -- Outputs from the flow control FIFO.
      read_data   : out std_logic_vector (DATA_WIDTH_A-1 downto 0);
      almost_full : out std_logic;
      empty       : out std_logic;

      -- Debug
      -- The current values of the spy memory write pointers; can be used to measure
      -- "how full" the spy memory is (and also; where to start reading from).
      dbg_spy_meta_write_addr : out std_logic_vector (EL_MEM_WIDTH_A-1 downto 0);
      dbg_spy_write_addr      : out std_logic_vector (SPY_MEM_WIDTH_B-1 downto 0);

      -- Fast Monitoring Signals (To IPBUS or BlockRAM Controller)
      spy_clock      : in std_logic;
      spy_clock_meta : in std_logic;

      -- Freeze the spy buffer.
      freeze         : in std_logic;

      -- Playback toggle. See SpyProtocol.vh for the supported states.
      playback       : in std_logic_vector (1 downto 0);

      -- Interface for Spy Memory - Used to load playback data and readout data for fast monitoring
      spy_addr         : in  std_logic_vector (SPY_MEM_WIDTH_B-1 downto 0);
      spy_write_enable : in  std_logic;
      spy_write_data   : in  std_logic_vector (DATA_WIDTH_B-1 downto 0);
      spy_read_enable  : in  std_logic;
      spy_data         : out std_logic_vector (DATA_WIDTH_B-1 downto 0);

      -- Interface for Spy Meta Memory - Additional information on data stored in Spy Memory
      spy_meta_read_addr : in  std_logic_vector (EL_MEM_WIDTH_B-1 downto 0);
      spy_meta_read_data : out std_logic_vector (SPY_MEM_WIDTH_A downto 0)
      );
  end component;

end package spybuffer_pkg;

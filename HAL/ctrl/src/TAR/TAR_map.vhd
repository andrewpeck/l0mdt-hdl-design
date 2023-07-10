--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.TAR_Ctrl.all;
use work.TAR_Ctrl_DEF.all;


entity TAR_map is
  generic (
    READ_TIMEOUT     : integer := 2048;
    ALLOCATED_MEMORY_RANGE : integer 
    );
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    
    Mon              : in  TAR_Mon_t;
    
    
    Ctrl             : out TAR_Ctrl_t
        
    );
end entity TAR_map;
architecture behavioral of TAR_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 2153);
  constant Default_reg_data : slv32_array_t(integer range 0 to 2153) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  assert ((4*2153) <= ALLOCATED_MEMORY_RANGE)
    report "TAR: Regmap addressing range " & integer'image(4*2153) & " is outside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
  severity ERROR;
  assert ((4*2153) > ALLOCATED_MEMORY_RANGE)
    report "TAR: Regmap addressing range " & integer'image(4*2153) & " is inside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
  severity NOTE;

  AXIRegBridge : entity work.axiLiteRegBlocking
    generic map (
      READ_TIMEOUT => READ_TIMEOUT
      )
    port map (
      clk_axi     => clk_axi,
      reset_axi_n => reset_axi_n,
      readMOSI    => slave_readMOSI,
      readMISO    => slave_readMISO,
      writeMOSI   => slave_writeMOSI,
      writeMISO   => slave_writeMISO,
      address     => localAddress,
      rd_data     => localRdData_latch,
      wr_data     => localWrData,
      write_en    => localWrEn,
      read_req    => localRdReq,
      read_ack    => localRdAck);

  -------------------------------------------------------------------------------
  -- Record read decoding
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------

  latch_reads: process (clk_axi,reset_axi_n) is
  begin  -- process latch_reads
    if reset_axi_n = '0' then
      localRdAck <= '0';
    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      localRdAck <= '0';
      
      if regRdAck = '1' then
        localRdData_latch <= localRdData;
        localRdAck <= '1';
      
      end if;
    end if;
  end process latch_reads;

  
  reads: process (clk_axi,reset_axi_n) is
  begin  -- process latch_reads
    if reset_axi_n = '0' then
      regRdAck <= '0';
    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      regRdAck  <= '0';
      localRdData <= x"00000000";
      if localRdReq = '1' then
        regRdAck  <= '1';
        case to_integer(unsigned(localAddress(11 downto 0))) is
          
        when 0 => --0x0
          localRdData( 3)            <=  reg_data( 0)( 3);                            --
        when 1 => --0x1
          localRdData( 4)            <=  reg_data( 1)( 4);                            --
          localRdData( 5)            <=  reg_data( 1)( 5);                            --
          localRdData( 6)            <=  reg_data( 1)( 6);                            --
        when 2 => --0x2
          localRdData( 0)            <=  Mon.STATUS.ENABLED;                          --
          localRdData( 1)            <=  Mon.STATUS.READY;                            --
          localRdData( 2)            <=  Mon.STATUS.FREEZED;                          --
          localRdData(11 downto  4)  <=  Mon.STATUS.ERROR;                            --
        when 2064 => --0x810
          localRdData( 4)            <=  Mon.PL_ST.PL_MEM(0).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(2064)( 5);                          --flush memory to Zync
          localRdData( 6)            <=  Mon.PL_ST.PL_MEM(0).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(2064)( 7);                          --freeze memory
          localRdData(10 downto  8)  <=  reg_data(2064)(10 downto  8);                --sel memory
        when 2066 => --0x812
          localRdData(11 downto  0)  <=  reg_data(2066)(11 downto  0);                --wr_Address
          localRdData(27 downto 16)  <=  reg_data(2066)(27 downto 16);                --rd_Address
        when 2068 => --0x814
          localRdData(31 downto  0)  <=  reg_data(2068)(31 downto  0);                --Write Data 0
        when 2069 => --0x815
          localRdData( 9 downto  0)  <=  reg_data(2069)( 9 downto  0);                --Write Data 1
        when 2072 => --0x818
          localRdData(31 downto  0)  <=  Mon.PL_ST.PL_MEM(0).rd_data.rd_data_0;       --Read Data 0
        when 2073 => --0x819
          localRdData( 9 downto  0)  <=  Mon.PL_ST.PL_MEM(0).rd_data.rd_data_1;       --Read Data 1
        when 2080 => --0x820
          localRdData( 4)            <=  Mon.PL_ST.PL_MEM(1).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(2080)( 5);                          --flush memory to Zync
          localRdData( 6)            <=  Mon.PL_ST.PL_MEM(1).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(2080)( 7);                          --freeze memory
          localRdData(10 downto  8)  <=  reg_data(2080)(10 downto  8);                --sel memory
        when 2082 => --0x822
          localRdData(11 downto  0)  <=  reg_data(2082)(11 downto  0);                --wr_Address
          localRdData(27 downto 16)  <=  reg_data(2082)(27 downto 16);                --rd_Address
        when 2084 => --0x824
          localRdData(31 downto  0)  <=  reg_data(2084)(31 downto  0);                --Write Data 0
        when 2085 => --0x825
          localRdData( 9 downto  0)  <=  reg_data(2085)( 9 downto  0);                --Write Data 1
        when 2088 => --0x828
          localRdData(31 downto  0)  <=  Mon.PL_ST.PL_MEM(1).rd_data.rd_data_0;       --Read Data 0
        when 2089 => --0x829
          localRdData( 9 downto  0)  <=  Mon.PL_ST.PL_MEM(1).rd_data.rd_data_1;       --Read Data 1
        when 2096 => --0x830
          localRdData( 4)            <=  Mon.PL_ST.PL_MEM(2).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(2096)( 5);                          --flush memory to Zync
          localRdData( 6)            <=  Mon.PL_ST.PL_MEM(2).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(2096)( 7);                          --freeze memory
          localRdData(10 downto  8)  <=  reg_data(2096)(10 downto  8);                --sel memory
        when 2098 => --0x832
          localRdData(11 downto  0)  <=  reg_data(2098)(11 downto  0);                --wr_Address
          localRdData(27 downto 16)  <=  reg_data(2098)(27 downto 16);                --rd_Address
        when 2100 => --0x834
          localRdData(31 downto  0)  <=  reg_data(2100)(31 downto  0);                --Write Data 0
        when 2101 => --0x835
          localRdData( 9 downto  0)  <=  reg_data(2101)( 9 downto  0);                --Write Data 1
        when 2104 => --0x838
          localRdData(31 downto  0)  <=  Mon.PL_ST.PL_MEM(2).rd_data.rd_data_0;       --Read Data 0
        when 2105 => --0x839
          localRdData( 9 downto  0)  <=  Mon.PL_ST.PL_MEM(2).rd_data.rd_data_1;       --Read Data 1
        when 2112 => --0x840
          localRdData( 4)            <=  Mon.PL_ST.PL_MEM(3).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(2112)( 5);                          --flush memory to Zync
          localRdData( 6)            <=  Mon.PL_ST.PL_MEM(3).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(2112)( 7);                          --freeze memory
          localRdData(10 downto  8)  <=  reg_data(2112)(10 downto  8);                --sel memory
        when 2114 => --0x842
          localRdData(11 downto  0)  <=  reg_data(2114)(11 downto  0);                --wr_Address
          localRdData(27 downto 16)  <=  reg_data(2114)(27 downto 16);                --rd_Address
        when 2116 => --0x844
          localRdData(31 downto  0)  <=  reg_data(2116)(31 downto  0);                --Write Data 0
        when 2117 => --0x845
          localRdData( 9 downto  0)  <=  reg_data(2117)( 9 downto  0);                --Write Data 1
        when 2120 => --0x848
          localRdData(31 downto  0)  <=  Mon.PL_ST.PL_MEM(3).rd_data.rd_data_0;       --Read Data 0
        when 2121 => --0x849
          localRdData( 9 downto  0)  <=  Mon.PL_ST.PL_MEM(3).rd_data.rd_data_1;       --Read Data 1
        when 2128 => --0x850
          localRdData( 4)            <=  Mon.PL_ST.PL_MEM(4).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(2128)( 5);                          --flush memory to Zync
          localRdData( 6)            <=  Mon.PL_ST.PL_MEM(4).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(2128)( 7);                          --freeze memory
          localRdData(10 downto  8)  <=  reg_data(2128)(10 downto  8);                --sel memory
        when 2130 => --0x852
          localRdData(11 downto  0)  <=  reg_data(2130)(11 downto  0);                --wr_Address
          localRdData(27 downto 16)  <=  reg_data(2130)(27 downto 16);                --rd_Address
        when 2132 => --0x854
          localRdData(31 downto  0)  <=  reg_data(2132)(31 downto  0);                --Write Data 0
        when 2133 => --0x855
          localRdData( 9 downto  0)  <=  reg_data(2133)( 9 downto  0);                --Write Data 1
        when 2136 => --0x858
          localRdData(31 downto  0)  <=  Mon.PL_ST.PL_MEM(4).rd_data.rd_data_0;       --Read Data 0
        when 2137 => --0x859
          localRdData( 9 downto  0)  <=  Mon.PL_ST.PL_MEM(4).rd_data.rd_data_1;       --Read Data 1
        when 2144 => --0x860
          localRdData( 4)            <=  Mon.PL_ST.PL_MEM(5).SIGNALS.rd_rdy;          --Read ready
          localRdData( 5)            <=  reg_data(2144)( 5);                          --flush memory to Zync
          localRdData( 6)            <=  Mon.PL_ST.PL_MEM(5).SIGNALS.freeze_ena;      --freeze memory
          localRdData( 7)            <=  reg_data(2144)( 7);                          --freeze memory
          localRdData(10 downto  8)  <=  reg_data(2144)(10 downto  8);                --sel memory
        when 2146 => --0x862
          localRdData(11 downto  0)  <=  reg_data(2146)(11 downto  0);                --wr_Address
          localRdData(27 downto 16)  <=  reg_data(2146)(27 downto 16);                --rd_Address
        when 2148 => --0x864
          localRdData(31 downto  0)  <=  reg_data(2148)(31 downto  0);                --Write Data 0
        when 2149 => --0x865
          localRdData( 9 downto  0)  <=  reg_data(2149)( 9 downto  0);                --Write Data 1
        when 2152 => --0x868
          localRdData(31 downto  0)  <=  Mon.PL_ST.PL_MEM(5).rd_data.rd_data_0;       --Read Data 0
        when 2153 => --0x869
          localRdData( 9 downto  0)  <=  Mon.PL_ST.PL_MEM(5).rd_data.rd_data_1;       --Read Data 1


          when others =>
            regRdAck <= '0';
            localRdData <= x"00000000";
        end case;
      end if;
    end if;
  end process reads;


  -------------------------------------------------------------------------------
  -- Record write decoding
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------

  -- Register mapping to ctrl structures
  Ctrl.ACTIONS.FREEZE                      <=  reg_data( 0)( 3);                 
  Ctrl.CONFIGS.INPUT_EN                    <=  reg_data( 1)( 4);                 
  Ctrl.CONFIGS.OUTPUT_EN                   <=  reg_data( 1)( 5);                 
  Ctrl.CONFIGS.FLUSH_MEM_RESET             <=  reg_data( 1)( 6);                 
  Ctrl.PL_ST.PL_MEM(0).SIGNALS.flush_req   <=  reg_data(2064)( 5);               
  Ctrl.PL_ST.PL_MEM(0).SIGNALS.freeze_req  <=  reg_data(2064)( 7);               
  Ctrl.PL_ST.PL_MEM(0).SIGNALS.mem_sel     <=  reg_data(2064)(10 downto  8);     
  Ctrl.PL_ST.PL_MEM(0).wr_addr             <=  reg_data(2066)(11 downto  0);     
  Ctrl.PL_ST.PL_MEM(0).rd_addr             <=  reg_data(2066)(27 downto 16);     
  Ctrl.PL_ST.PL_MEM(0).wr_data.wr_data_0   <=  reg_data(2068)(31 downto  0);     
  Ctrl.PL_ST.PL_MEM(0).wr_data.wr_data_1   <=  reg_data(2069)( 9 downto  0);     
  Ctrl.PL_ST.PL_MEM(1).SIGNALS.flush_req   <=  reg_data(2080)( 5);               
  Ctrl.PL_ST.PL_MEM(1).SIGNALS.freeze_req  <=  reg_data(2080)( 7);               
  Ctrl.PL_ST.PL_MEM(1).SIGNALS.mem_sel     <=  reg_data(2080)(10 downto  8);     
  Ctrl.PL_ST.PL_MEM(1).wr_addr             <=  reg_data(2082)(11 downto  0);     
  Ctrl.PL_ST.PL_MEM(1).rd_addr             <=  reg_data(2082)(27 downto 16);     
  Ctrl.PL_ST.PL_MEM(1).wr_data.wr_data_0   <=  reg_data(2084)(31 downto  0);     
  Ctrl.PL_ST.PL_MEM(1).wr_data.wr_data_1   <=  reg_data(2085)( 9 downto  0);     
  Ctrl.PL_ST.PL_MEM(2).SIGNALS.flush_req   <=  reg_data(2096)( 5);               
  Ctrl.PL_ST.PL_MEM(2).SIGNALS.freeze_req  <=  reg_data(2096)( 7);               
  Ctrl.PL_ST.PL_MEM(2).SIGNALS.mem_sel     <=  reg_data(2096)(10 downto  8);     
  Ctrl.PL_ST.PL_MEM(2).wr_addr             <=  reg_data(2098)(11 downto  0);     
  Ctrl.PL_ST.PL_MEM(2).rd_addr             <=  reg_data(2098)(27 downto 16);     
  Ctrl.PL_ST.PL_MEM(2).wr_data.wr_data_0   <=  reg_data(2100)(31 downto  0);     
  Ctrl.PL_ST.PL_MEM(2).wr_data.wr_data_1   <=  reg_data(2101)( 9 downto  0);     
  Ctrl.PL_ST.PL_MEM(3).SIGNALS.flush_req   <=  reg_data(2112)( 5);               
  Ctrl.PL_ST.PL_MEM(3).SIGNALS.freeze_req  <=  reg_data(2112)( 7);               
  Ctrl.PL_ST.PL_MEM(3).SIGNALS.mem_sel     <=  reg_data(2112)(10 downto  8);     
  Ctrl.PL_ST.PL_MEM(3).wr_addr             <=  reg_data(2114)(11 downto  0);     
  Ctrl.PL_ST.PL_MEM(3).rd_addr             <=  reg_data(2114)(27 downto 16);     
  Ctrl.PL_ST.PL_MEM(3).wr_data.wr_data_0   <=  reg_data(2116)(31 downto  0);     
  Ctrl.PL_ST.PL_MEM(3).wr_data.wr_data_1   <=  reg_data(2117)( 9 downto  0);     
  Ctrl.PL_ST.PL_MEM(4).SIGNALS.flush_req   <=  reg_data(2128)( 5);               
  Ctrl.PL_ST.PL_MEM(4).SIGNALS.freeze_req  <=  reg_data(2128)( 7);               
  Ctrl.PL_ST.PL_MEM(4).SIGNALS.mem_sel     <=  reg_data(2128)(10 downto  8);     
  Ctrl.PL_ST.PL_MEM(4).wr_addr             <=  reg_data(2130)(11 downto  0);     
  Ctrl.PL_ST.PL_MEM(4).rd_addr             <=  reg_data(2130)(27 downto 16);     
  Ctrl.PL_ST.PL_MEM(4).wr_data.wr_data_0   <=  reg_data(2132)(31 downto  0);     
  Ctrl.PL_ST.PL_MEM(4).wr_data.wr_data_1   <=  reg_data(2133)( 9 downto  0);     
  Ctrl.PL_ST.PL_MEM(5).SIGNALS.flush_req   <=  reg_data(2144)( 5);               
  Ctrl.PL_ST.PL_MEM(5).SIGNALS.freeze_req  <=  reg_data(2144)( 7);               
  Ctrl.PL_ST.PL_MEM(5).SIGNALS.mem_sel     <=  reg_data(2144)(10 downto  8);     
  Ctrl.PL_ST.PL_MEM(5).wr_addr             <=  reg_data(2146)(11 downto  0);     
  Ctrl.PL_ST.PL_MEM(5).rd_addr             <=  reg_data(2146)(27 downto 16);     
  Ctrl.PL_ST.PL_MEM(5).wr_data.wr_data_0   <=  reg_data(2148)(31 downto  0);     
  Ctrl.PL_ST.PL_MEM(5).wr_data.wr_data_1   <=  reg_data(2149)( 9 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 0)( 0)  <= DEFAULT_TAR_CTRL_t.ACTIONS.RESET;
      reg_data( 0)( 1)  <= DEFAULT_TAR_CTRL_t.ACTIONS.ENABLE;
      reg_data( 0)( 2)  <= DEFAULT_TAR_CTRL_t.ACTIONS.DISABLE;
      reg_data( 0)( 3)  <= DEFAULT_TAR_CTRL_t.ACTIONS.FREEZE;
      reg_data( 1)( 4)  <= DEFAULT_TAR_CTRL_t.CONFIGS.INPUT_EN;
      reg_data( 1)( 5)  <= DEFAULT_TAR_CTRL_t.CONFIGS.OUTPUT_EN;
      reg_data( 1)( 6)  <= DEFAULT_TAR_CTRL_t.CONFIGS.FLUSH_MEM_RESET;
      reg_data(2064)( 0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(0).SIGNALS.wr_req;
      reg_data(2064)( 1)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(0).SIGNALS.wr_ack;
      reg_data(2064)( 2)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(0).SIGNALS.rd_req;
      reg_data(2064)( 3)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(0).SIGNALS.rd_ack;
      reg_data(2064)( 5)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(0).SIGNALS.flush_req;
      reg_data(2064)( 7)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(0).SIGNALS.freeze_req;
      reg_data(2064)(10 downto  8)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(0).SIGNALS.mem_sel;
      reg_data(2066)(11 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(0).wr_addr;
      reg_data(2066)(27 downto 16)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(0).rd_addr;
      reg_data(2068)(31 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(0).wr_data.wr_data_0;
      reg_data(2069)( 9 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(0).wr_data.wr_data_1;
      reg_data(2080)( 0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(1).SIGNALS.wr_req;
      reg_data(2080)( 1)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(1).SIGNALS.wr_ack;
      reg_data(2080)( 2)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(1).SIGNALS.rd_req;
      reg_data(2080)( 3)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(1).SIGNALS.rd_ack;
      reg_data(2080)( 5)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(1).SIGNALS.flush_req;
      reg_data(2080)( 7)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(1).SIGNALS.freeze_req;
      reg_data(2080)(10 downto  8)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(1).SIGNALS.mem_sel;
      reg_data(2082)(11 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(1).wr_addr;
      reg_data(2082)(27 downto 16)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(1).rd_addr;
      reg_data(2084)(31 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(1).wr_data.wr_data_0;
      reg_data(2085)( 9 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(1).wr_data.wr_data_1;
      reg_data(2096)( 0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(2).SIGNALS.wr_req;
      reg_data(2096)( 1)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(2).SIGNALS.wr_ack;
      reg_data(2096)( 2)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(2).SIGNALS.rd_req;
      reg_data(2096)( 3)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(2).SIGNALS.rd_ack;
      reg_data(2096)( 5)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(2).SIGNALS.flush_req;
      reg_data(2096)( 7)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(2).SIGNALS.freeze_req;
      reg_data(2096)(10 downto  8)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(2).SIGNALS.mem_sel;
      reg_data(2098)(11 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(2).wr_addr;
      reg_data(2098)(27 downto 16)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(2).rd_addr;
      reg_data(2100)(31 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(2).wr_data.wr_data_0;
      reg_data(2101)( 9 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(2).wr_data.wr_data_1;
      reg_data(2112)( 0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(3).SIGNALS.wr_req;
      reg_data(2112)( 1)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(3).SIGNALS.wr_ack;
      reg_data(2112)( 2)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(3).SIGNALS.rd_req;
      reg_data(2112)( 3)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(3).SIGNALS.rd_ack;
      reg_data(2112)( 5)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(3).SIGNALS.flush_req;
      reg_data(2112)( 7)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(3).SIGNALS.freeze_req;
      reg_data(2112)(10 downto  8)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(3).SIGNALS.mem_sel;
      reg_data(2114)(11 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(3).wr_addr;
      reg_data(2114)(27 downto 16)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(3).rd_addr;
      reg_data(2116)(31 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(3).wr_data.wr_data_0;
      reg_data(2117)( 9 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(3).wr_data.wr_data_1;
      reg_data(2128)( 0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(4).SIGNALS.wr_req;
      reg_data(2128)( 1)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(4).SIGNALS.wr_ack;
      reg_data(2128)( 2)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(4).SIGNALS.rd_req;
      reg_data(2128)( 3)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(4).SIGNALS.rd_ack;
      reg_data(2128)( 5)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(4).SIGNALS.flush_req;
      reg_data(2128)( 7)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(4).SIGNALS.freeze_req;
      reg_data(2128)(10 downto  8)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(4).SIGNALS.mem_sel;
      reg_data(2130)(11 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(4).wr_addr;
      reg_data(2130)(27 downto 16)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(4).rd_addr;
      reg_data(2132)(31 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(4).wr_data.wr_data_0;
      reg_data(2133)( 9 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(4).wr_data.wr_data_1;
      reg_data(2144)( 0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(5).SIGNALS.wr_req;
      reg_data(2144)( 1)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(5).SIGNALS.wr_ack;
      reg_data(2144)( 2)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(5).SIGNALS.rd_req;
      reg_data(2144)( 3)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(5).SIGNALS.rd_ack;
      reg_data(2144)( 5)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(5).SIGNALS.flush_req;
      reg_data(2144)( 7)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(5).SIGNALS.freeze_req;
      reg_data(2144)(10 downto  8)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(5).SIGNALS.mem_sel;
      reg_data(2146)(11 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(5).wr_addr;
      reg_data(2146)(27 downto 16)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(5).rd_addr;
      reg_data(2148)(31 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(5).wr_data.wr_data_0;
      reg_data(2149)( 9 downto  0)  <= DEFAULT_TAR_CTRL_t.PL_ST.PL_MEM(5).wr_data.wr_data_1;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.ACTIONS.RESET <= '0';
      Ctrl.ACTIONS.ENABLE <= '0';
      Ctrl.ACTIONS.DISABLE <= '0';
      Ctrl.PL_ST.PL_MEM(0).SIGNALS.wr_req <= '0';
      Ctrl.PL_ST.PL_MEM(0).SIGNALS.wr_ack <= '0';
      Ctrl.PL_ST.PL_MEM(0).SIGNALS.rd_req <= '0';
      Ctrl.PL_ST.PL_MEM(0).SIGNALS.rd_ack <= '0';
      Ctrl.PL_ST.PL_MEM(1).SIGNALS.wr_req <= '0';
      Ctrl.PL_ST.PL_MEM(1).SIGNALS.wr_ack <= '0';
      Ctrl.PL_ST.PL_MEM(1).SIGNALS.rd_req <= '0';
      Ctrl.PL_ST.PL_MEM(1).SIGNALS.rd_ack <= '0';
      Ctrl.PL_ST.PL_MEM(2).SIGNALS.wr_req <= '0';
      Ctrl.PL_ST.PL_MEM(2).SIGNALS.wr_ack <= '0';
      Ctrl.PL_ST.PL_MEM(2).SIGNALS.rd_req <= '0';
      Ctrl.PL_ST.PL_MEM(2).SIGNALS.rd_ack <= '0';
      Ctrl.PL_ST.PL_MEM(3).SIGNALS.wr_req <= '0';
      Ctrl.PL_ST.PL_MEM(3).SIGNALS.wr_ack <= '0';
      Ctrl.PL_ST.PL_MEM(3).SIGNALS.rd_req <= '0';
      Ctrl.PL_ST.PL_MEM(3).SIGNALS.rd_ack <= '0';
      Ctrl.PL_ST.PL_MEM(4).SIGNALS.wr_req <= '0';
      Ctrl.PL_ST.PL_MEM(4).SIGNALS.wr_ack <= '0';
      Ctrl.PL_ST.PL_MEM(4).SIGNALS.rd_req <= '0';
      Ctrl.PL_ST.PL_MEM(4).SIGNALS.rd_ack <= '0';
      Ctrl.PL_ST.PL_MEM(5).SIGNALS.wr_req <= '0';
      Ctrl.PL_ST.PL_MEM(5).SIGNALS.wr_ack <= '0';
      Ctrl.PL_ST.PL_MEM(5).SIGNALS.rd_req <= '0';
      Ctrl.PL_ST.PL_MEM(5).SIGNALS.rd_ack <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(11 downto 0))) is
        when 0 => --0x0
          Ctrl.ACTIONS.RESET                   <=  localWrData( 0);               
          Ctrl.ACTIONS.ENABLE                  <=  localWrData( 1);               
          Ctrl.ACTIONS.DISABLE                 <=  localWrData( 2);               
          reg_data( 0)( 3)                     <=  localWrData( 3);                --
        when 1 => --0x1
          reg_data( 1)( 4)                     <=  localWrData( 4);                --
          reg_data( 1)( 5)                     <=  localWrData( 5);                --
          reg_data( 1)( 6)                     <=  localWrData( 6);                --
        when 2064 => --0x810
          Ctrl.PL_ST.PL_MEM(0).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.PL_ST.PL_MEM(0).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.PL_ST.PL_MEM(0).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.PL_ST.PL_MEM(0).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(2064)( 5)                   <=  localWrData( 5);                --flush memory to Zync
          reg_data(2064)( 7)                   <=  localWrData( 7);                --freeze memory
          reg_data(2064)(10 downto  8)         <=  localWrData(10 downto  8);      --sel memory
        when 2066 => --0x812
          reg_data(2066)(11 downto  0)         <=  localWrData(11 downto  0);      --wr_Address
          reg_data(2066)(27 downto 16)         <=  localWrData(27 downto 16);      --rd_Address
        when 2068 => --0x814
          reg_data(2068)(31 downto  0)         <=  localWrData(31 downto  0);      --Write Data 0
        when 2069 => --0x815
          reg_data(2069)( 9 downto  0)         <=  localWrData( 9 downto  0);      --Write Data 1
        when 2080 => --0x820
          Ctrl.PL_ST.PL_MEM(1).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.PL_ST.PL_MEM(1).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.PL_ST.PL_MEM(1).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.PL_ST.PL_MEM(1).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(2080)( 5)                   <=  localWrData( 5);                --flush memory to Zync
          reg_data(2080)( 7)                   <=  localWrData( 7);                --freeze memory
          reg_data(2080)(10 downto  8)         <=  localWrData(10 downto  8);      --sel memory
        when 2082 => --0x822
          reg_data(2082)(11 downto  0)         <=  localWrData(11 downto  0);      --wr_Address
          reg_data(2082)(27 downto 16)         <=  localWrData(27 downto 16);      --rd_Address
        when 2084 => --0x824
          reg_data(2084)(31 downto  0)         <=  localWrData(31 downto  0);      --Write Data 0
        when 2085 => --0x825
          reg_data(2085)( 9 downto  0)         <=  localWrData( 9 downto  0);      --Write Data 1
        when 2096 => --0x830
          Ctrl.PL_ST.PL_MEM(2).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.PL_ST.PL_MEM(2).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.PL_ST.PL_MEM(2).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.PL_ST.PL_MEM(2).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(2096)( 5)                   <=  localWrData( 5);                --flush memory to Zync
          reg_data(2096)( 7)                   <=  localWrData( 7);                --freeze memory
          reg_data(2096)(10 downto  8)         <=  localWrData(10 downto  8);      --sel memory
        when 2098 => --0x832
          reg_data(2098)(11 downto  0)         <=  localWrData(11 downto  0);      --wr_Address
          reg_data(2098)(27 downto 16)         <=  localWrData(27 downto 16);      --rd_Address
        when 2100 => --0x834
          reg_data(2100)(31 downto  0)         <=  localWrData(31 downto  0);      --Write Data 0
        when 2101 => --0x835
          reg_data(2101)( 9 downto  0)         <=  localWrData( 9 downto  0);      --Write Data 1
        when 2112 => --0x840
          Ctrl.PL_ST.PL_MEM(3).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.PL_ST.PL_MEM(3).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.PL_ST.PL_MEM(3).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.PL_ST.PL_MEM(3).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(2112)( 5)                   <=  localWrData( 5);                --flush memory to Zync
          reg_data(2112)( 7)                   <=  localWrData( 7);                --freeze memory
          reg_data(2112)(10 downto  8)         <=  localWrData(10 downto  8);      --sel memory
        when 2114 => --0x842
          reg_data(2114)(11 downto  0)         <=  localWrData(11 downto  0);      --wr_Address
          reg_data(2114)(27 downto 16)         <=  localWrData(27 downto 16);      --rd_Address
        when 2116 => --0x844
          reg_data(2116)(31 downto  0)         <=  localWrData(31 downto  0);      --Write Data 0
        when 2117 => --0x845
          reg_data(2117)( 9 downto  0)         <=  localWrData( 9 downto  0);      --Write Data 1
        when 2128 => --0x850
          Ctrl.PL_ST.PL_MEM(4).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.PL_ST.PL_MEM(4).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.PL_ST.PL_MEM(4).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.PL_ST.PL_MEM(4).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(2128)( 5)                   <=  localWrData( 5);                --flush memory to Zync
          reg_data(2128)( 7)                   <=  localWrData( 7);                --freeze memory
          reg_data(2128)(10 downto  8)         <=  localWrData(10 downto  8);      --sel memory
        when 2130 => --0x852
          reg_data(2130)(11 downto  0)         <=  localWrData(11 downto  0);      --wr_Address
          reg_data(2130)(27 downto 16)         <=  localWrData(27 downto 16);      --rd_Address
        when 2132 => --0x854
          reg_data(2132)(31 downto  0)         <=  localWrData(31 downto  0);      --Write Data 0
        when 2133 => --0x855
          reg_data(2133)( 9 downto  0)         <=  localWrData( 9 downto  0);      --Write Data 1
        when 2144 => --0x860
          Ctrl.PL_ST.PL_MEM(5).SIGNALS.wr_req  <=  localWrData( 0);               
          Ctrl.PL_ST.PL_MEM(5).SIGNALS.wr_ack  <=  localWrData( 1);               
          Ctrl.PL_ST.PL_MEM(5).SIGNALS.rd_req  <=  localWrData( 2);               
          Ctrl.PL_ST.PL_MEM(5).SIGNALS.rd_ack  <=  localWrData( 3);               
          reg_data(2144)( 5)                   <=  localWrData( 5);                --flush memory to Zync
          reg_data(2144)( 7)                   <=  localWrData( 7);                --freeze memory
          reg_data(2144)(10 downto  8)         <=  localWrData(10 downto  8);      --sel memory
        when 2146 => --0x862
          reg_data(2146)(11 downto  0)         <=  localWrData(11 downto  0);      --wr_Address
          reg_data(2146)(27 downto 16)         <=  localWrData(27 downto 16);      --rd_Address
        when 2148 => --0x864
          reg_data(2148)(31 downto  0)         <=  localWrData(31 downto  0);      --Write Data 0
        when 2149 => --0x865
          reg_data(2149)( 9 downto  0)         <=  localWrData( 9 downto  0);      --Write Data 1

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;







  
end architecture behavioral;
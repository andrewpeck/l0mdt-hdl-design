--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.MEM_INT_12A42D_Ctrl.all;
use work.MEM_INT_12A42D_Ctrl_DEF.all;


entity MEM_INT_12A42D_map is
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
    
    Mon              : in  MEM_INT_12A42D_Mon_t;
    
    
    Ctrl             : out MEM_INT_12A42D_Ctrl_t
        
    );
end entity MEM_INT_12A42D_map;
architecture behavioral of MEM_INT_12A42D_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 9);
  constant Default_reg_data : slv32_array_t(integer range 0 to 9) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  assert ((4*9) <= ALLOCATED_MEMORY_RANGE)
    report "MEM_INT_12A42D: Regmap addressing range " & integer'image(4*9) & " is outside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
  severity ERROR;
  assert ((4*9) > ALLOCATED_MEMORY_RANGE)
    report "MEM_INT_12A42D: Regmap addressing range " & integer'image(4*9) & " is inside of AXI mapped range " & integer'image(ALLOCATED_MEMORY_RANGE)
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
        case to_integer(unsigned(localAddress(3 downto 0))) is
          
        when 0 => --0x0
          localRdData( 4)            <=  Mon.SIGNALS.rd_rdy;              --Read ready
          localRdData( 5)            <=  reg_data( 0)( 5);                --flush memory to Zync
          localRdData( 6)            <=  Mon.SIGNALS.freeze_ena;          --freeze memory
          localRdData( 7)            <=  reg_data( 0)( 7);                --freeze memory
          localRdData(10 downto  8)  <=  reg_data( 0)(10 downto  8);      --sel memory
        when 2 => --0x2
          localRdData(11 downto  0)  <=  reg_data( 2)(11 downto  0);      --wr_Address
          localRdData(27 downto 16)  <=  reg_data( 2)(27 downto 16);      --rd_Address
        when 4 => --0x4
          localRdData(31 downto  0)  <=  reg_data( 4)(31 downto  0);      --Write Data 0
        when 5 => --0x5
          localRdData( 9 downto  0)  <=  reg_data( 5)( 9 downto  0);      --Write Data 1
        when 8 => --0x8
          localRdData(31 downto  0)  <=  Mon.rd_data.rd_data_0;           --Read Data 0
        when 9 => --0x9
          localRdData( 9 downto  0)  <=  Mon.rd_data.rd_data_1;           --Read Data 1


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
  Ctrl.SIGNALS.flush_req   <=  reg_data( 0)( 5);               
  Ctrl.SIGNALS.freeze_req  <=  reg_data( 0)( 7);               
  Ctrl.SIGNALS.mem_sel     <=  reg_data( 0)(10 downto  8);     
  Ctrl.wr_addr             <=  reg_data( 2)(11 downto  0);     
  Ctrl.rd_addr             <=  reg_data( 2)(27 downto 16);     
  Ctrl.wr_data.wr_data_0   <=  reg_data( 4)(31 downto  0);     
  Ctrl.wr_data.wr_data_1   <=  reg_data( 5)( 9 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 0)( 0)  <= DEFAULT_MEM_INT_12A42D_CTRL_t.SIGNALS.wr_req;
      reg_data( 0)( 1)  <= DEFAULT_MEM_INT_12A42D_CTRL_t.SIGNALS.wr_ack;
      reg_data( 0)( 2)  <= DEFAULT_MEM_INT_12A42D_CTRL_t.SIGNALS.rd_req;
      reg_data( 0)( 3)  <= DEFAULT_MEM_INT_12A42D_CTRL_t.SIGNALS.rd_ack;
      reg_data( 0)( 5)  <= DEFAULT_MEM_INT_12A42D_CTRL_t.SIGNALS.flush_req;
      reg_data( 0)( 7)  <= DEFAULT_MEM_INT_12A42D_CTRL_t.SIGNALS.freeze_req;
      reg_data( 0)(10 downto  8)  <= DEFAULT_MEM_INT_12A42D_CTRL_t.SIGNALS.mem_sel;
      reg_data( 2)(11 downto  0)  <= DEFAULT_MEM_INT_12A42D_CTRL_t.wr_addr;
      reg_data( 2)(27 downto 16)  <= DEFAULT_MEM_INT_12A42D_CTRL_t.rd_addr;
      reg_data( 4)(31 downto  0)  <= DEFAULT_MEM_INT_12A42D_CTRL_t.wr_data.wr_data_0;
      reg_data( 5)( 9 downto  0)  <= DEFAULT_MEM_INT_12A42D_CTRL_t.wr_data.wr_data_1;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.SIGNALS.wr_req <= '0';
      Ctrl.SIGNALS.wr_ack <= '0';
      Ctrl.SIGNALS.rd_req <= '0';
      Ctrl.SIGNALS.rd_ack <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(3 downto 0))) is
        when 0 => --0x0
          Ctrl.SIGNALS.wr_req         <=  localWrData( 0);               
          Ctrl.SIGNALS.wr_ack         <=  localWrData( 1);               
          Ctrl.SIGNALS.rd_req         <=  localWrData( 2);               
          Ctrl.SIGNALS.rd_ack         <=  localWrData( 3);               
          reg_data( 0)( 5)            <=  localWrData( 5);                --flush memory to Zync
          reg_data( 0)( 7)            <=  localWrData( 7);                --freeze memory
          reg_data( 0)(10 downto  8)  <=  localWrData(10 downto  8);      --sel memory
        when 2 => --0x2
          reg_data( 2)(11 downto  0)  <=  localWrData(11 downto  0);      --wr_Address
          reg_data( 2)(27 downto 16)  <=  localWrData(27 downto 16);      --rd_Address
        when 4 => --0x4
          reg_data( 4)(31 downto  0)  <=  localWrData(31 downto  0);      --Write Data 0
        when 5 => --0x5
          reg_data( 5)( 9 downto  0)  <=  localWrData( 9 downto  0);      --Write Data 1

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;







  
end architecture behavioral;
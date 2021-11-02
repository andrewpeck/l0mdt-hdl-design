--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.MEM_INT_10A9D_Ctrl.all;
use work.MEM_INT_10A9D_Ctrl_DEF.all;
entity MEM_INT_10A9D_map is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    
    Mon              : in  MEM_INT_10A9D_Mon_t;
    Ctrl             : out MEM_INT_10A9D_Ctrl_t
        
    );
end entity MEM_INT_10A9D_map;
architecture behavioral of MEM_INT_10A9D_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 5);
  constant Default_reg_data : slv32_array_t(integer range 0 to 5) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  AXIRegBridge : entity work.axiLiteRegBlocking
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
        case to_integer(unsigned(localAddress(2 downto 0))) is
          
        when 1 => --0x1
          localRdData( 0)            <=  Mon.SIGNALS.rd_rdy;              --Read ready
        when 2 => --0x2
          localRdData( 9 downto  0)  <=  reg_data( 2)( 9 downto  0);      --wr_Address
          localRdData(25 downto 16)  <=  reg_data( 2)(25 downto 16);      --rd_Address
        when 3 => --0x3
          localRdData( 8 downto  0)  <=  reg_data( 3)( 8 downto  0);      --Write Data 0
        when 5 => --0x5
          localRdData( 8 downto  0)  <=  Mon.rd_data.rd_data_0;           --Read Data 0


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
  Ctrl.wr_addr            <=  reg_data( 2)( 9 downto  0);     
  Ctrl.rd_addr            <=  reg_data( 2)(25 downto 16);     
  Ctrl.wr_data.wr_data_0  <=  reg_data( 3)( 8 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 2)( 9 downto  0)  <= DEFAULT_MEM_INT_10A9D_CTRL_t.wr_addr;
      reg_data( 2)(25 downto 16)  <= DEFAULT_MEM_INT_10A9D_CTRL_t.rd_addr;
      reg_data( 3)( 8 downto  0)  <= DEFAULT_MEM_INT_10A9D_CTRL_t.wr_data.wr_data_0;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.SIGNALS.wr_req <= '0';
      Ctrl.SIGNALS.wr_ack <= '0';
      Ctrl.SIGNALS.rd_req <= '0';
      Ctrl.SIGNALS.rd_ack <= '0';
      Ctrl.SIGNALS.flush_req <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(2 downto 0))) is
        when 0 => --0x0
          Ctrl.SIGNALS.wr_req         <=  localWrData( 0);               
          Ctrl.SIGNALS.wr_ack         <=  localWrData( 1);               
          Ctrl.SIGNALS.rd_req         <=  localWrData( 2);               
          Ctrl.SIGNALS.rd_ack         <=  localWrData( 3);               
          Ctrl.SIGNALS.flush_req      <=  localWrData( 4);               
        when 2 => --0x2
          reg_data( 2)( 9 downto  0)  <=  localWrData( 9 downto  0);      --wr_Address
          reg_data( 2)(25 downto 16)  <=  localWrData(25 downto 16);      --rd_Address
        when 3 => --0x3
          reg_data( 3)( 8 downto  0)  <=  localWrData( 8 downto  0);      --Write Data 0

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;







  
end architecture behavioral;
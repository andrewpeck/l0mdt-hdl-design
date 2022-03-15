--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.FM_Ctrl.all;
use work.FM_Ctrl_DEF.all;
entity FM_map is
  generic (
    READ_TIMEOUT     : integer := 2048
    );
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    
    Ctrl             : out FM_Ctrl_t
        
    );
end entity FM_map;
architecture behavioral of FM_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 6);
  constant Default_reg_data : slv32_array_t(integer range 0 to 6) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
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
        case to_integer(unsigned(localAddress(2 downto 0))) is
          


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


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.SPY_CTRL.GLOBAL_FREEZE <= '0';
      Ctrl.SPY_CTRL.GLOBAL_PLAYBACK_MODE <= (others => '0');
      Ctrl.FREEZE_MASK_0 <= (others => '0');
      Ctrl.FREEZE_MASK_1 <= (others => '0');
      Ctrl.PLAYBACK_MASK_0 <= (others => '0');
      Ctrl.PLAYBACK_MASK_1 <= (others => '0');
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(2 downto 0))) is
        when 0 => --0x0
          Ctrl.SPY_CTRL.GLOBAL_FREEZE         <=  localWrData( 0);               
          Ctrl.SPY_CTRL.GLOBAL_PLAYBACK_MODE  <=  localWrData( 2 downto  1);     
        when 1 => --0x1
          Ctrl.FREEZE_MASK_0                  <=  localWrData(31 downto  0);     
        when 2 => --0x2
          Ctrl.FREEZE_MASK_1                  <=  localWrData(31 downto  0);     
        when 5 => --0x5
          Ctrl.PLAYBACK_MASK_0                <=  localWrData(31 downto  0);     
        when 6 => --0x6
          Ctrl.PLAYBACK_MASK_1                <=  localWrData(31 downto  0);     

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;







  
end architecture behavioral;
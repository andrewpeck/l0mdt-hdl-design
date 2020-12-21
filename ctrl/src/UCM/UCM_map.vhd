--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.UCM_Ctrl.all;
entity UCM_interface is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    Mon              : in  UCM_Mon_t;
    Ctrl             : out UCM_Ctrl_t
    );
end entity UCM_interface;
architecture behavioral of UCM_interface is
  signal localAddress       : slv_32_t;
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;


  signal reg_data :  slv32_array_t(integer range 0 to 32);
  constant Default_reg_data : slv32_array_t(integer range 0 to 32) := (others => x"00000000");
begin  -- architecture behavioral

  -------------------------------------------------------------------------------
  -- AXI 
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  AXIRegBridge : entity work.axiLiteReg
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

  latch_reads: process (clk_axi) is
  begin  -- process latch_reads
    if clk_axi'event and clk_axi = '1' then  -- rising clock edge
      if localRdReq = '1' then
        localRdData_latch <= localRdData;        
      end if;
    end if;
  end process latch_reads;
  reads: process (localRdReq,localAddress,reg_data) is
  begin  -- process reads
    localRdAck  <= '0';
    localRdData <= x"00000000";
    if localRdReq = '1' then
      localRdAck  <= '1';
      case to_integer(unsigned(localAddress(5 downto 0))) is

        when 32 => --0x20
          localRdData(15 downto  0)  <=  reg_data(32)(15 downto  0);      --Module 16 bit mode
        when 1 => --0x1
          localRdData( 3 downto  0)  <=  reg_data( 1)( 3 downto  0);      --
          localRdData( 3 downto  0)  <=  reg_data( 1)( 3 downto  0);      --
        when 16 => --0x10
          localRdData(31 downto  0)  <=  reg_data(16)(31 downto  0);      --Phi to Center of chamber
        when 17 => --0x11
          localRdData(31 downto  0)  <=  reg_data(17)(31 downto  0);      --Phi to Center of chamber
        when 18 => --0x12
          localRdData(31 downto  0)  <=  reg_data(18)(31 downto  0);      --Phi to Center of chamber
        when 19 => --0x13
          localRdData(31 downto  0)  <=  reg_data(19)(31 downto  0);      --Phi to Center of chamber
        when 20 => --0x14
          localRdData(31 downto  0)  <=  reg_data(20)(31 downto  0);      --Phi to Center of chamber
        when 21 => --0x15
          localRdData(31 downto  0)  <=  reg_data(21)(31 downto  0);      --Phi to Center of chamber
        when 22 => --0x16
          localRdData(31 downto  0)  <=  reg_data(22)(31 downto  0);      --Phi to Center of chamber
        when 23 => --0x17
          localRdData(31 downto  0)  <=  reg_data(23)(31 downto  0);      --Phi to Center of chamber


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.MODE            <=  reg_data(32)(15 downto  0);     
  Ctrl.STATUS.THREADS  <=  reg_data( 1)( 3 downto  0);     
  Ctrl.STATUS.THREADS  <=  reg_data( 1)( 3 downto  0);     
  Ctrl.PHICENTER0      <=  reg_data(16)(31 downto  0);     
  Ctrl.PHICENTER1      <=  reg_data(17)(31 downto  0);     
  Ctrl.PHICENTER2      <=  reg_data(18)(31 downto  0);     
  Ctrl.PHICENTER3      <=  reg_data(19)(31 downto  0);     
  Ctrl.PHICENTER4      <=  reg_data(20)(31 downto  0);     
  Ctrl.PHICENTER5      <=  reg_data(21)(31 downto  0);     
  Ctrl.PHICENTER6      <=  reg_data(22)(31 downto  0);     
  Ctrl.PHICENTER7      <=  reg_data(23)(31 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(32)(15 downto  0)  <= DEFAULT_UCM_CTRL_t.MODE;
      reg_data( 1)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.STATUS.THREADS;
      reg_data( 1)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.STATUS.THREADS;
      reg_data(16)(31 downto  0)  <= DEFAULT_UCM_CTRL_t.PHICENTER0;
      reg_data(17)(31 downto  0)  <= DEFAULT_UCM_CTRL_t.PHICENTER1;
      reg_data(18)(31 downto  0)  <= DEFAULT_UCM_CTRL_t.PHICENTER2;
      reg_data(19)(31 downto  0)  <= DEFAULT_UCM_CTRL_t.PHICENTER3;
      reg_data(20)(31 downto  0)  <= DEFAULT_UCM_CTRL_t.PHICENTER4;
      reg_data(21)(31 downto  0)  <= DEFAULT_UCM_CTRL_t.PHICENTER5;
      reg_data(22)(31 downto  0)  <= DEFAULT_UCM_CTRL_t.PHICENTER6;
      reg_data(23)(31 downto  0)  <= DEFAULT_UCM_CTRL_t.PHICENTER7;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.ACTIONS.RESET <= '0';
      Ctrl.ACTIONS.ENABLE <= '0';
      Ctrl.ACTIONS.DISABLE <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(5 downto 0))) is
        when 0 => --0x0
          Ctrl.ACTIONS.RESET          <=  localWrData( 0);               
          Ctrl.ACTIONS.ENABLE         <=  localWrData( 4);               
          Ctrl.ACTIONS.DISABLE        <=  localWrData( 5);               
        when 32 => --0x20
          reg_data(32)(15 downto  0)  <=  localWrData(15 downto  0);      --Module 16 bit mode
        when 1 => --0x1
          reg_data( 1)( 3 downto  0)  <=  localWrData( 3 downto  0);      --
          reg_data( 1)( 3 downto  0)  <=  localWrData( 3 downto  0);      --
        when 16 => --0x10
          reg_data(16)(31 downto  0)  <=  localWrData(31 downto  0);      --Phi to Center of chamber
        when 17 => --0x11
          reg_data(17)(31 downto  0)  <=  localWrData(31 downto  0);      --Phi to Center of chamber
        when 18 => --0x12
          reg_data(18)(31 downto  0)  <=  localWrData(31 downto  0);      --Phi to Center of chamber
        when 19 => --0x13
          reg_data(19)(31 downto  0)  <=  localWrData(31 downto  0);      --Phi to Center of chamber
        when 20 => --0x14
          reg_data(20)(31 downto  0)  <=  localWrData(31 downto  0);      --Phi to Center of chamber
        when 21 => --0x15
          reg_data(21)(31 downto  0)  <=  localWrData(31 downto  0);      --Phi to Center of chamber
        when 22 => --0x16
          reg_data(22)(31 downto  0)  <=  localWrData(31 downto  0);      --Phi to Center of chamber
        when 23 => --0x17
          reg_data(23)(31 downto  0)  <=  localWrData(31 downto  0);      --Phi to Center of chamber

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;
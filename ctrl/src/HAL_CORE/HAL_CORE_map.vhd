--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.HAL_CORE_Ctrl.all;
entity HAL_CORE_interface is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    Mon              : in  HAL_CORE_Mon_t;
    Ctrl             : out HAL_CORE_Ctrl_t
    );
end entity HAL_CORE_interface;
architecture behavioral of HAL_CORE_interface is
  signal localAddress       : slv_32_t;
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;


  signal reg_data :  slv32_array_t(integer range 0 to 1);
  constant Default_reg_data : slv32_array_t(integer range 0 to 1) := (others => x"00000000");
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
      case to_integer(unsigned(localAddress(0 downto 0))) is

        when 1 => --0x1
          localRdData( 0)  <=  Mon.CLOCKING.MMCM_LOCKED;              --
          localRdData( 1)  <=  reg_data( 1)( 1);                      --
          localRdData( 2)  <=  reg_data( 1)( 2);                      --
          localRdData( 3)  <=  Mon.CLOCKING.CLK_PHASE_OUTOFSYNC;      --
          localRdData( 4)  <=  reg_data( 1)( 4);                      --


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.CLOCKING.RESET_MMCM        <=  reg_data( 1)( 1);     
  Ctrl.CLOCKING.SELECT_FELIX_CLK  <=  reg_data( 1)( 2);     
  Ctrl.CLOCKING.RESYNC_CLK_PHASE  <=  reg_data( 1)( 4);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 1)( 1)  <= DEFAULT_HAL_CORE_CTRL_t.CLOCKING.RESET_MMCM;
      reg_data( 1)( 2)  <= DEFAULT_HAL_CORE_CTRL_t.CLOCKING.SELECT_FELIX_CLK;
      reg_data( 1)( 4)  <= DEFAULT_HAL_CORE_CTRL_t.CLOCKING.RESYNC_CLK_PHASE;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(0 downto 0))) is
        when 1 => --0x1
          reg_data( 1)( 1)  <=  localWrData( 1);      --
          reg_data( 1)( 2)  <=  localWrData( 2);      --
          reg_data( 1)( 4)  <=  localWrData( 4);      --

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;
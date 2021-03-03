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


  signal reg_data :  slv32_array_t(integer range 0 to 16647);
  constant Default_reg_data : slv32_array_t(integer range 0 to 16647) := (others => x"00000000");
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
      case to_integer(unsigned(localAddress(14 downto 0))) is

        when 4359 => --0x1107
          localRdData(31)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).RD;      --Read Value id position selected
        when 1 => --0x1
          localRdData( 3 downto  0)  <=  reg_data( 1)( 3 downto  0);               --
          localRdData( 4)            <=  reg_data( 1)( 4);                         --
          localRdData( 5)            <=  reg_data( 1)( 5);                         --
        when 259 => --0x103
          localRdData(31)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).RD;      --Read Value id position selected
        when 257 => --0x101
          localRdData(31)            <=  Mon.SECTOR_PHI.RD;                        --Read Value id position selected
        when 8451 => --0x2103
          localRdData(31)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).RD;      --Read Value id position selected
        when 8455 => --0x2107
          localRdData(31)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).RD;      --Read Value id position selected
        when 263 => --0x107
          localRdData(31)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).RD;      --Read Value id position selected
        when 16 => --0x10
          localRdData( 0)            <=  Mon.STATUS.MAIN_ENABLED;                  --
          localRdData( 1)            <=  Mon.STATUS.MAIN_READY;                    --
          localRdData( 2)            <=  Mon.STATUS.MAIN_ERROR;                    --
        when 16647 => --0x4107
          localRdData(31)            <=  Mon.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).RD;      --Read Value id position selected
        when 4355 => --0x1103
          localRdData(31)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).RD;      --Read Value id position selected
        when 16643 => --0x4103
          localRdData(31)            <=  Mon.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).RD;      --Read Value id position selected


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.CONFIGS.THREADS    <=  reg_data( 1)( 3 downto  0);     
  Ctrl.CONFIGS.INPUT_EN   <=  reg_data( 1)( 4);               
  Ctrl.CONFIGS.OUTPUT_EN  <=  reg_data( 1)( 5);               


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 1)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.CONFIGS.THREADS;
      reg_data( 1)( 4)  <= DEFAULT_UCM_CTRL_t.CONFIGS.INPUT_EN;
      reg_data( 1)( 5)  <= DEFAULT_UCM_CTRL_t.CONFIGS.OUTPUT_EN;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.ACTIONS.RESET <= '0';
      Ctrl.ACTIONS.ENABLE <= '0';
      Ctrl.ACTIONS.DISABLE <= '0';
      Ctrl.ACTIONS.FREEZE <= '0';
      Ctrl.SECTOR_PHI.WR <= (others => '0');
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).WR <= (others => '0');
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).WR <= (others => '0');
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).WR <= (others => '0');
      Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).WR <= (others => '0');
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).WR <= (others => '0');
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).WR <= (others => '0');
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).WR <= (others => '0');
      Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).WR <= (others => '0');
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(14 downto 0))) is
        when 0 => --0x0
          Ctrl.ACTIONS.RESET                    <=  localWrData( 0);               
          Ctrl.ACTIONS.ENABLE                   <=  localWrData( 1);               
          Ctrl.ACTIONS.DISABLE                  <=  localWrData( 2);               
          Ctrl.ACTIONS.FREEZE                   <=  localWrData( 3);               
        when 1 => --0x1
          reg_data( 1)( 3 downto  0)            <=  localWrData( 3 downto  0);      --
          reg_data( 1)( 4)                      <=  localWrData( 4);                --
          reg_data( 1)( 5)                      <=  localWrData( 5);                --
        when 258 => --0x102
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(0).WR  <=  localWrData(24 downto  0);     
        when 16642 => --0x4102
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(3).WR  <=  localWrData(24 downto  0);     
        when 4358 => --0x1106
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(1).WR  <=  localWrData(24 downto  0);     
        when 262 => --0x106
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(0).WR  <=  localWrData(24 downto  0);     
        when 4354 => --0x1102
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(1).WR  <=  localWrData(24 downto  0);     
        when 8450 => --0x2102
          Ctrl.CDE_CHAMB_Z0.CDE_CHAMB_Z0(2).WR  <=  localWrData(24 downto  0);     
        when 256 => --0x100
          Ctrl.SECTOR_PHI.WR                    <=  localWrData(24 downto 16);     
        when 8454 => --0x2106
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(2).WR  <=  localWrData(24 downto  0);     
        when 16646 => --0x4106
          Ctrl.CVP_CHAMB_Z0.CVP_CHAMB_Z0(3).WR  <=  localWrData(24 downto  0);     

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;
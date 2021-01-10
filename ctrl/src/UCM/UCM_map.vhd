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


  signal reg_data :  slv32_array_t(integer range 0 to 768);
  constant Default_reg_data : slv32_array_t(integer range 0 to 768) := (others => x"00000000");
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
      case to_integer(unsigned(localAddress(9 downto 0))) is

        when 16 => --0x10
          localRdData( 0)            <=  Mon.STATUS.MAIN_ENABLED;          --
          localRdData( 1)            <=  Mon.STATUS.MAIN_READY;            --
          localRdData( 2)            <=  Mon.STATUS.MAIN_ERROR;            --
        when 1 => --0x1
          localRdData( 3 downto  0)  <=  reg_data( 1)( 3 downto  0);       --
          localRdData( 4)            <=  reg_data( 1)( 4);                 --
          localRdData( 5)            <=  reg_data( 1)( 5);                 --
        when 256 => --0x100
          localRdData(15 downto  0)  <=  reg_data(256)(15 downto  0);      --Phi to Center of chamber
          localRdData(16)            <=  reg_data(256)(16);                --Phi to Center of chamber
        when 768 => --0x300
          localRdData(15 downto  0)  <=  Mon.IETA_CALC_RD.VALUE;           --Phi to Center of chamber
          localRdData(27)            <=  Mon.IETA_CALC_RD.RST_REQ;         --Phi to Center of chamber


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.CONFIGS.THREADS      <=  reg_data( 1)( 3 downto  0);      
  Ctrl.CONFIGS.INPUT_EN     <=  reg_data( 1)( 4);                
  Ctrl.CONFIGS.OUTPUT_EN    <=  reg_data( 1)( 5);                
  Ctrl.SECTOR_PHI.VALUE     <=  reg_data(256)(15 downto  0);     
  Ctrl.SECTOR_PHI.OVERRIDE  <=  reg_data(256)(16);               


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 1)( 3 downto  0)  <= DEFAULT_UCM_CTRL_t.CONFIGS.THREADS;
      reg_data( 1)( 4)  <= DEFAULT_UCM_CTRL_t.CONFIGS.INPUT_EN;
      reg_data( 1)( 5)  <= DEFAULT_UCM_CTRL_t.CONFIGS.OUTPUT_EN;
      reg_data(256)(15 downto  0)  <= DEFAULT_UCM_CTRL_t.SECTOR_PHI.VALUE;
      reg_data(256)(16)  <= DEFAULT_UCM_CTRL_t.SECTOR_PHI.OVERRIDE;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.ACTIONS.RESET <= '0';
      Ctrl.ACTIONS.ENABLE <= '0';
      Ctrl.ACTIONS.DISABLE <= '0';
      Ctrl.IETA_CALC_WR.VALUE <= (others => '0');
      Ctrl.IETA_CALC_WR.ADDR <= (others => '0');
      Ctrl.IETA_CALC_WR.WR_EN <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(9 downto 0))) is
        when 0 => --0x0
          Ctrl.ACTIONS.RESET           <=  localWrData( 0);               
          Ctrl.ACTIONS.ENABLE          <=  localWrData( 4);               
          Ctrl.ACTIONS.DISABLE         <=  localWrData( 5);               
        when 1 => --0x1
          reg_data( 1)( 3 downto  0)   <=  localWrData( 3 downto  0);      --
          reg_data( 1)( 4)             <=  localWrData( 4);                --
          reg_data( 1)( 5)             <=  localWrData( 5);                --
        when 256 => --0x100
          reg_data(256)(15 downto  0)  <=  localWrData(15 downto  0);      --Phi to Center of chamber
          reg_data(256)(16)            <=  localWrData(16);                --Phi to Center of chamber
        when 512 => --0x200
          Ctrl.IETA_CALC_WR.VALUE      <=  localWrData(15 downto  0);     
          Ctrl.IETA_CALC_WR.ADDR       <=  localWrData(23 downto 16);     
          Ctrl.IETA_CALC_WR.WR_EN      <=  localWrData(24);               

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;
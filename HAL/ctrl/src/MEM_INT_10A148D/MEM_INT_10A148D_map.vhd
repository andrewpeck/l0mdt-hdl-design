--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.MEM_INT_10A148D_Ctrl.all;
use work.MEM_INT_10A148D_Ctrl_DEF.all;
entity MEM_INT_10A148D_interface is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    Mon              : in  MEM_INT_10A148D_Mon_t;
    Ctrl             : out MEM_INT_10A148D_Ctrl_t
    );
end entity MEM_INT_10A148D_interface;
architecture behavioral of MEM_INT_10A148D_interface is
  signal localAddress       : slv_32_t;
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;


  signal reg_data :  slv32_array_t(integer range 0 to 36);
  constant Default_reg_data : slv32_array_t(integer range 0 to 36) := (others => x"00000000");
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
          localRdData(31 downto  0)  <=  Mon.rd_data.rd_data_0;           -- Read Data 0
        when 1 => --0x1
          localRdData( 0)            <=  Mon.rd_rdy;                      -- Read ready
        when 2 => --0x2
          localRdData( 9 downto  0)  <=  reg_data(2)( 9 downto  0);       -- wr_Address
          localRdData(25 downto 16)  <=  reg_data(2)(25 downto 16);       -- rd_Address
        when 35 => --0x23
          localRdData(31 downto  0)  <=  Mon.rd_data.rd_data_3;           -- Read Data 3
        when 36 => --0x24
          localRdData(19 downto  0)  <=  Mon.rd_data.rd_data_4;           -- Read Data 4
        when 33 => --0x21
          localRdData(31 downto  0)  <=  Mon.rd_data.rd_data_1;           -- Read Data 1
        when 34 => --0x22
          localRdData(31 downto  0)  <=  Mon.rd_data.rd_data_2;           -- Read Data 2
        when 16 => --0x10
          localRdData(31 downto  0)  <=  reg_data(16)(31 downto  0);      -- Write Data 0
        when 17 => --0x11
          localRdData(31 downto  0)  <=  reg_data(17)(31 downto  0);      -- Write Data 1
        when 18 => --0x12
          localRdData(31 downto  0)  <=  reg_data(18)(31 downto  0);      -- Write Data 2
        when 19 => --0x13
          localRdData(31 downto  0)  <=  reg_data(19)(31 downto  0);      -- Write Data 3
        when 20 => --0x14
          localRdData(19 downto  0)  <=  reg_data(20)(19 downto  0);      -- Write Data 4


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.wr_addr            <=  reg_data(2)( 9 downto  0);      
  Ctrl.rd_addr            <=  reg_data(2)(25 downto 16);      
  Ctrl.wr_data.wr_data_0  <=  reg_data(16)(31 downto  0);     
  Ctrl.wr_data.wr_data_4  <=  reg_data(20)(19 downto  0);     
  Ctrl.wr_data.wr_data_1  <=  reg_data(17)(31 downto  0);     
  Ctrl.wr_data.wr_data_2  <=  reg_data(18)(31 downto  0);     
  Ctrl.wr_data.wr_data_3  <=  reg_data(19)(31 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(2)( 9 downto  0)  <= DEFAULT_MEM_INT_10A148D_CTRL_t.wr_addr;
      reg_data(2)(25 downto 16)  <= DEFAULT_MEM_INT_10A148D_CTRL_t.rd_addr;
      reg_data(16)(31 downto  0)  <= DEFAULT_MEM_INT_10A148D_CTRL_t.wr_data.wr_data_0;
      reg_data(20)(19 downto  0)  <= DEFAULT_MEM_INT_10A148D_CTRL_t.wr_data.wr_data_4;
      reg_data(17)(31 downto  0)  <= DEFAULT_MEM_INT_10A148D_CTRL_t.wr_data.wr_data_1;
      reg_data(18)(31 downto  0)  <= DEFAULT_MEM_INT_10A148D_CTRL_t.wr_data.wr_data_2;
      reg_data(19)(31 downto  0)  <= DEFAULT_MEM_INT_10A148D_CTRL_t.wr_data.wr_data_3;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.wr_req <= '0';
      Ctrl.wr_ack <= '0';
      Ctrl.rd_req <= '0';
      Ctrl.rd_ack <= '0';
      Ctrl.flush_req <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(5 downto 0))) is
        when 0 => --0x0
          Ctrl.wr_req                 <=  localWrData( 0);               
          Ctrl.wr_ack                 <=  localWrData( 1);               
          Ctrl.rd_req                 <=  localWrData( 2);               
          Ctrl.rd_ack                 <=  localWrData( 3);               
          Ctrl.flush_req              <=  localWrData( 4);               
        when 2 => --0x2
          reg_data(2)( 9 downto  0)   <=  localWrData( 9 downto  0);      -- wr_Address
          reg_data(2)(25 downto 16)   <=  localWrData(25 downto 16);      -- rd_Address
        when 16 => --0x10
          reg_data(16)(31 downto  0)  <=  localWrData(31 downto  0);      -- Write Data 0
        when 17 => --0x11
          reg_data(17)(31 downto  0)  <=  localWrData(31 downto  0);      -- Write Data 1
        when 18 => --0x12
          reg_data(18)(31 downto  0)  <=  localWrData(31 downto  0);      -- Write Data 2
        when 19 => --0x13
          reg_data(19)(31 downto  0)  <=  localWrData(31 downto  0);      -- Write Data 3
        when 20 => --0x14
          reg_data(20)(19 downto  0)  <=  localWrData(19 downto  0);      -- Write Data 4

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;
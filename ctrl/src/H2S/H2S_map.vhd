--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.AXIRegPkg.all;
use work.types.all;
use work.H2S_Ctrl.all;
entity H2S_interface is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    Mon              : in  H2S_Mon_t;
    Ctrl             : out H2S_Ctrl_t
    );
end entity H2S_interface;
architecture behavioral of H2S_interface is
  signal localAddress       : slv_32_t;
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;


  signal reg_data :  slv32_array_t(integer range 0 to 16897);
  constant Default_reg_data : slv32_array_t(integer range 0 to 16897) := (others => x"00000000");
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

        when 1 => --0x1
          localRdData( 0)            <=  Mon.HPS(0).STATUS;                  --
          localRdData( 1)            <=  Mon.HPS(0).READY;                   --
        when 257 => --0x101
          localRdData( 0)            <=  Mon.HPS(0).LSF.STATUS;              --
          localRdData(13 downto  4)  <=  reg_data(257)(13 downto  4);        --add some description
        when 513 => --0x201
          localRdData( 0)            <=  Mon.HPS(0).CSF.STATUS;              --
          localRdData( 1)            <=  Mon.HPS(0).CSF.READY;               --
        when 4097 => --0x1001
          localRdData( 0)            <=  Mon.HPS(1).STATUS;                  --
          localRdData( 1)            <=  Mon.HPS(1).READY;                   --
        when 4353 => --0x1101
          localRdData( 0)            <=  Mon.HPS(1).LSF.STATUS;              --
          localRdData(13 downto  4)  <=  reg_data(4353)(13 downto  4);       --add some description
        when 4609 => --0x1201
          localRdData( 0)            <=  Mon.HPS(1).CSF.STATUS;              --
          localRdData( 1)            <=  Mon.HPS(1).CSF.READY;               --
        when 8193 => --0x2001
          localRdData( 0)            <=  Mon.HPS(2).STATUS;                  --
          localRdData( 1)            <=  Mon.HPS(2).READY;                   --
        when 8449 => --0x2101
          localRdData( 0)            <=  Mon.HPS(2).LSF.STATUS;              --
          localRdData(13 downto  4)  <=  reg_data(8449)(13 downto  4);       --add some description
        when 8705 => --0x2201
          localRdData( 0)            <=  Mon.HPS(2).CSF.STATUS;              --
          localRdData( 1)            <=  Mon.HPS(2).CSF.READY;               --
        when 16385 => --0x4001
          localRdData( 0)            <=  Mon.HPS(3).STATUS;                  --
          localRdData( 1)            <=  Mon.HPS(3).READY;                   --
        when 16641 => --0x4101
          localRdData( 0)            <=  Mon.HPS(3).LSF.STATUS;              --
          localRdData(13 downto  4)  <=  reg_data(16641)(13 downto  4);      --add some description
        when 16897 => --0x4201
          localRdData( 0)            <=  Mon.HPS(3).CSF.STATUS;              --
          localRdData( 1)            <=  Mon.HPS(3).CSF.READY;               --


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.HPS(0).LSF.HBA_MAX_CLOCKS  <=  reg_data(257)(13 downto  4);       
  Ctrl.HPS(1).LSF.HBA_MAX_CLOCKS  <=  reg_data(4353)(13 downto  4);      
  Ctrl.HPS(2).LSF.HBA_MAX_CLOCKS  <=  reg_data(8449)(13 downto  4);      
  Ctrl.HPS(3).LSF.HBA_MAX_CLOCKS  <=  reg_data(16641)(13 downto  4);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(257)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(0).LSF.HBA_MAX_CLOCKS;
      reg_data(4353)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(1).LSF.HBA_MAX_CLOCKS;
      reg_data(8449)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(2).LSF.HBA_MAX_CLOCKS;
      reg_data(16641)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(3).LSF.HBA_MAX_CLOCKS;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.HPS(0).RESET <= '0';
      Ctrl.HPS(0).LSF.RESET <= '0';
      Ctrl.HPS(0).CSF.RESET <= '0';
      Ctrl.HPS(1).RESET <= '0';
      Ctrl.HPS(1).LSF.RESET <= '0';
      Ctrl.HPS(1).CSF.RESET <= '0';
      Ctrl.HPS(2).RESET <= '0';
      Ctrl.HPS(2).LSF.RESET <= '0';
      Ctrl.HPS(2).CSF.RESET <= '0';
      Ctrl.HPS(3).RESET <= '0';
      Ctrl.HPS(3).LSF.RESET <= '0';
      Ctrl.HPS(3).CSF.RESET <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(14 downto 0))) is
        when 0 => --0x0
          Ctrl.HPS(0).RESET              <=  localWrData( 0);               
        when 256 => --0x100
          Ctrl.HPS(0).LSF.RESET          <=  localWrData( 0);               
        when 257 => --0x101
          reg_data(257)(13 downto  4)    <=  localWrData(13 downto  4);      --add some description
        when 512 => --0x200
          Ctrl.HPS(0).CSF.RESET          <=  localWrData( 0);               
        when 4096 => --0x1000
          Ctrl.HPS(1).RESET              <=  localWrData( 0);               
        when 4352 => --0x1100
          Ctrl.HPS(1).LSF.RESET          <=  localWrData( 0);               
        when 4353 => --0x1101
          reg_data(4353)(13 downto  4)   <=  localWrData(13 downto  4);      --add some description
        when 4608 => --0x1200
          Ctrl.HPS(1).CSF.RESET          <=  localWrData( 0);               
        when 8192 => --0x2000
          Ctrl.HPS(2).RESET              <=  localWrData( 0);               
        when 8448 => --0x2100
          Ctrl.HPS(2).LSF.RESET          <=  localWrData( 0);               
        when 8449 => --0x2101
          reg_data(8449)(13 downto  4)   <=  localWrData(13 downto  4);      --add some description
        when 8704 => --0x2200
          Ctrl.HPS(2).CSF.RESET          <=  localWrData( 0);               
        when 16384 => --0x4000
          Ctrl.HPS(3).RESET              <=  localWrData( 0);               
        when 16640 => --0x4100
          Ctrl.HPS(3).LSF.RESET          <=  localWrData( 0);               
        when 16641 => --0x4101
          reg_data(16641)(13 downto  4)  <=  localWrData(13 downto  4);      --add some description
        when 16896 => --0x4200
          Ctrl.HPS(3).CSF.RESET          <=  localWrData( 0);               

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;
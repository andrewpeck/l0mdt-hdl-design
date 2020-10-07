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


  signal reg_data :  slv32_array_t(integer range 0 to 16929);
  constant Default_reg_data : slv32_array_t(integer range 0 to 16929) := (others => x"00000000");
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

        when 257 => --0x101
          localRdData( 0)            <=  Mon.HPS(0).LSF.LSF(0).STATUS;                           --
        when 259 => --0x103
          localRdData( 0)            <=  reg_data(259)( 0);                                      --
        when 263 => --0x107
          localRdData( 8 downto  0)  <=  Mon.HPS(0).LSF.LSF(0).sb_lsf_mdt_hits_rdata_40_32;      --
        when 258 => --0x102
          localRdData(13 downto  4)  <=  reg_data(258)(13 downto  4);                            --add some description
        when 260 => --0x104
          localRdData(23 downto 16)  <=  reg_data(260)(23 downto 16);                            --
        when 262 => --0x106
          localRdData(31 downto  0)  <=  Mon.HPS(0).LSF.LSF(0).sb_lsf_mdt_hits_rdata_31_0;       --
        when 273 => --0x111
          localRdData( 0)            <=  Mon.HPS(0).LSF.LSF(1).STATUS;                           --
        when 275 => --0x113
          localRdData( 0)            <=  reg_data(275)( 0);                                      --
        when 279 => --0x117
          localRdData( 8 downto  0)  <=  Mon.HPS(0).LSF.LSF(1).sb_lsf_mdt_hits_rdata_40_32;      --
        when 274 => --0x112
          localRdData(13 downto  4)  <=  reg_data(274)(13 downto  4);                            --add some description
        when 276 => --0x114
          localRdData(23 downto 16)  <=  reg_data(276)(23 downto 16);                            --
        when 278 => --0x116
          localRdData(31 downto  0)  <=  Mon.HPS(0).LSF.LSF(1).sb_lsf_mdt_hits_rdata_31_0;       --
        when 289 => --0x121
          localRdData( 0)            <=  Mon.HPS(0).LSF.LSF(2).STATUS;                           --
        when 291 => --0x123
          localRdData( 0)            <=  reg_data(291)( 0);                                      --
        when 295 => --0x127
          localRdData( 8 downto  0)  <=  Mon.HPS(0).LSF.LSF(2).sb_lsf_mdt_hits_rdata_40_32;      --
        when 290 => --0x122
          localRdData(13 downto  4)  <=  reg_data(290)(13 downto  4);                            --add some description
        when 292 => --0x124
          localRdData(23 downto 16)  <=  reg_data(292)(23 downto 16);                            --
        when 294 => --0x126
          localRdData(31 downto  0)  <=  Mon.HPS(0).LSF.LSF(2).sb_lsf_mdt_hits_rdata_31_0;       --
        when 513 => --0x201
          localRdData( 0)            <=  Mon.HPS(0).CSF.CSF(0).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(0).CSF.CSF(0).READY;                            --
        when 529 => --0x211
          localRdData( 0)            <=  Mon.HPS(0).CSF.CSF(1).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(0).CSF.CSF(1).READY;                            --
        when 545 => --0x221
          localRdData( 0)            <=  Mon.HPS(0).CSF.CSF(2).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(0).CSF.CSF(2).READY;                            --
        when 1 => --0x1
          localRdData( 0)            <=  Mon.HPS(0).STATUS;                                      --
          localRdData( 1)            <=  Mon.HPS(0).READY;                                       --
        when 4353 => --0x1101
          localRdData( 0)            <=  Mon.HPS(1).LSF.LSF(0).STATUS;                           --
        when 4355 => --0x1103
          localRdData( 0)            <=  reg_data(4355)( 0);                                     --
        when 4359 => --0x1107
          localRdData( 8 downto  0)  <=  Mon.HPS(1).LSF.LSF(0).sb_lsf_mdt_hits_rdata_40_32;      --
        when 4354 => --0x1102
          localRdData(13 downto  4)  <=  reg_data(4354)(13 downto  4);                           --add some description
        when 4356 => --0x1104
          localRdData(23 downto 16)  <=  reg_data(4356)(23 downto 16);                           --
        when 4358 => --0x1106
          localRdData(31 downto  0)  <=  Mon.HPS(1).LSF.LSF(0).sb_lsf_mdt_hits_rdata_31_0;       --
        when 4369 => --0x1111
          localRdData( 0)            <=  Mon.HPS(1).LSF.LSF(1).STATUS;                           --
        when 4371 => --0x1113
          localRdData( 0)            <=  reg_data(4371)( 0);                                     --
        when 4375 => --0x1117
          localRdData( 8 downto  0)  <=  Mon.HPS(1).LSF.LSF(1).sb_lsf_mdt_hits_rdata_40_32;      --
        when 4370 => --0x1112
          localRdData(13 downto  4)  <=  reg_data(4370)(13 downto  4);                           --add some description
        when 4372 => --0x1114
          localRdData(23 downto 16)  <=  reg_data(4372)(23 downto 16);                           --
        when 4374 => --0x1116
          localRdData(31 downto  0)  <=  Mon.HPS(1).LSF.LSF(1).sb_lsf_mdt_hits_rdata_31_0;       --
        when 4385 => --0x1121
          localRdData( 0)            <=  Mon.HPS(1).LSF.LSF(2).STATUS;                           --
        when 4387 => --0x1123
          localRdData( 0)            <=  reg_data(4387)( 0);                                     --
        when 4391 => --0x1127
          localRdData( 8 downto  0)  <=  Mon.HPS(1).LSF.LSF(2).sb_lsf_mdt_hits_rdata_40_32;      --
        when 4386 => --0x1122
          localRdData(13 downto  4)  <=  reg_data(4386)(13 downto  4);                           --add some description
        when 4388 => --0x1124
          localRdData(23 downto 16)  <=  reg_data(4388)(23 downto 16);                           --
        when 4390 => --0x1126
          localRdData(31 downto  0)  <=  Mon.HPS(1).LSF.LSF(2).sb_lsf_mdt_hits_rdata_31_0;       --
        when 4609 => --0x1201
          localRdData( 0)            <=  Mon.HPS(1).CSF.CSF(0).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(1).CSF.CSF(0).READY;                            --
        when 4625 => --0x1211
          localRdData( 0)            <=  Mon.HPS(1).CSF.CSF(1).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(1).CSF.CSF(1).READY;                            --
        when 4641 => --0x1221
          localRdData( 0)            <=  Mon.HPS(1).CSF.CSF(2).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(1).CSF.CSF(2).READY;                            --
        when 4097 => --0x1001
          localRdData( 0)            <=  Mon.HPS(1).STATUS;                                      --
          localRdData( 1)            <=  Mon.HPS(1).READY;                                       --
        when 8449 => --0x2101
          localRdData( 0)            <=  Mon.HPS(2).LSF.LSF(0).STATUS;                           --
        when 8451 => --0x2103
          localRdData( 0)            <=  reg_data(8451)( 0);                                     --
        when 8455 => --0x2107
          localRdData( 8 downto  0)  <=  Mon.HPS(2).LSF.LSF(0).sb_lsf_mdt_hits_rdata_40_32;      --
        when 8450 => --0x2102
          localRdData(13 downto  4)  <=  reg_data(8450)(13 downto  4);                           --add some description
        when 8452 => --0x2104
          localRdData(23 downto 16)  <=  reg_data(8452)(23 downto 16);                           --
        when 8454 => --0x2106
          localRdData(31 downto  0)  <=  Mon.HPS(2).LSF.LSF(0).sb_lsf_mdt_hits_rdata_31_0;       --
        when 8465 => --0x2111
          localRdData( 0)            <=  Mon.HPS(2).LSF.LSF(1).STATUS;                           --
        when 8467 => --0x2113
          localRdData( 0)            <=  reg_data(8467)( 0);                                     --
        when 8471 => --0x2117
          localRdData( 8 downto  0)  <=  Mon.HPS(2).LSF.LSF(1).sb_lsf_mdt_hits_rdata_40_32;      --
        when 8466 => --0x2112
          localRdData(13 downto  4)  <=  reg_data(8466)(13 downto  4);                           --add some description
        when 8468 => --0x2114
          localRdData(23 downto 16)  <=  reg_data(8468)(23 downto 16);                           --
        when 8470 => --0x2116
          localRdData(31 downto  0)  <=  Mon.HPS(2).LSF.LSF(1).sb_lsf_mdt_hits_rdata_31_0;       --
        when 8481 => --0x2121
          localRdData( 0)            <=  Mon.HPS(2).LSF.LSF(2).STATUS;                           --
        when 8483 => --0x2123
          localRdData( 0)            <=  reg_data(8483)( 0);                                     --
        when 8487 => --0x2127
          localRdData( 8 downto  0)  <=  Mon.HPS(2).LSF.LSF(2).sb_lsf_mdt_hits_rdata_40_32;      --
        when 8482 => --0x2122
          localRdData(13 downto  4)  <=  reg_data(8482)(13 downto  4);                           --add some description
        when 8484 => --0x2124
          localRdData(23 downto 16)  <=  reg_data(8484)(23 downto 16);                           --
        when 8486 => --0x2126
          localRdData(31 downto  0)  <=  Mon.HPS(2).LSF.LSF(2).sb_lsf_mdt_hits_rdata_31_0;       --
        when 8705 => --0x2201
          localRdData( 0)            <=  Mon.HPS(2).CSF.CSF(0).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(2).CSF.CSF(0).READY;                            --
        when 8721 => --0x2211
          localRdData( 0)            <=  Mon.HPS(2).CSF.CSF(1).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(2).CSF.CSF(1).READY;                            --
        when 8737 => --0x2221
          localRdData( 0)            <=  Mon.HPS(2).CSF.CSF(2).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(2).CSF.CSF(2).READY;                            --
        when 8193 => --0x2001
          localRdData( 0)            <=  Mon.HPS(2).STATUS;                                      --
          localRdData( 1)            <=  Mon.HPS(2).READY;                                       --
        when 16641 => --0x4101
          localRdData( 0)            <=  Mon.HPS(3).LSF.LSF(0).STATUS;                           --
        when 16643 => --0x4103
          localRdData( 0)            <=  reg_data(16643)( 0);                                    --
        when 16647 => --0x4107
          localRdData( 8 downto  0)  <=  Mon.HPS(3).LSF.LSF(0).sb_lsf_mdt_hits_rdata_40_32;      --
        when 16642 => --0x4102
          localRdData(13 downto  4)  <=  reg_data(16642)(13 downto  4);                          --add some description
        when 16644 => --0x4104
          localRdData(23 downto 16)  <=  reg_data(16644)(23 downto 16);                          --
        when 16646 => --0x4106
          localRdData(31 downto  0)  <=  Mon.HPS(3).LSF.LSF(0).sb_lsf_mdt_hits_rdata_31_0;       --
        when 16657 => --0x4111
          localRdData( 0)            <=  Mon.HPS(3).LSF.LSF(1).STATUS;                           --
        when 16659 => --0x4113
          localRdData( 0)            <=  reg_data(16659)( 0);                                    --
        when 16663 => --0x4117
          localRdData( 8 downto  0)  <=  Mon.HPS(3).LSF.LSF(1).sb_lsf_mdt_hits_rdata_40_32;      --
        when 16658 => --0x4112
          localRdData(13 downto  4)  <=  reg_data(16658)(13 downto  4);                          --add some description
        when 16660 => --0x4114
          localRdData(23 downto 16)  <=  reg_data(16660)(23 downto 16);                          --
        when 16662 => --0x4116
          localRdData(31 downto  0)  <=  Mon.HPS(3).LSF.LSF(1).sb_lsf_mdt_hits_rdata_31_0;       --
        when 16673 => --0x4121
          localRdData( 0)            <=  Mon.HPS(3).LSF.LSF(2).STATUS;                           --
        when 16675 => --0x4123
          localRdData( 0)            <=  reg_data(16675)( 0);                                    --
        when 16679 => --0x4127
          localRdData( 8 downto  0)  <=  Mon.HPS(3).LSF.LSF(2).sb_lsf_mdt_hits_rdata_40_32;      --
        when 16674 => --0x4122
          localRdData(13 downto  4)  <=  reg_data(16674)(13 downto  4);                          --add some description
        when 16676 => --0x4124
          localRdData(23 downto 16)  <=  reg_data(16676)(23 downto 16);                          --
        when 16678 => --0x4126
          localRdData(31 downto  0)  <=  Mon.HPS(3).LSF.LSF(2).sb_lsf_mdt_hits_rdata_31_0;       --
        when 16897 => --0x4201
          localRdData( 0)            <=  Mon.HPS(3).CSF.CSF(0).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(3).CSF.CSF(0).READY;                            --
        when 16913 => --0x4211
          localRdData( 0)            <=  Mon.HPS(3).CSF.CSF(1).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(3).CSF.CSF(1).READY;                            --
        when 16929 => --0x4221
          localRdData( 0)            <=  Mon.HPS(3).CSF.CSF(2).STATUS;                           --
          localRdData( 1)            <=  Mon.HPS(3).CSF.CSF(2).READY;                            --
        when 16385 => --0x4001
          localRdData( 0)            <=  Mon.HPS(3).STATUS;                                      --
          localRdData( 1)            <=  Mon.HPS(3).READY;                                       --


        when others =>
          localRdData <= x"00000000";
      end case;
    end if;
  end process reads;




  -- Register mapping to ctrl structures
  Ctrl.HPS(0).LSF.LSF(0).sb_lsf_mdt_hits_freeze  <=  reg_data(259)( 0);                 
  Ctrl.HPS(0).LSF.LSF(0).HBA_MAX_CLOCKS          <=  reg_data(258)(13 downto  4);       
  Ctrl.HPS(0).LSF.LSF(0).sb_lsf_mdt_hits_raddr   <=  reg_data(260)(23 downto 16);       
  Ctrl.HPS(0).LSF.LSF(1).sb_lsf_mdt_hits_freeze  <=  reg_data(275)( 0);                 
  Ctrl.HPS(0).LSF.LSF(1).HBA_MAX_CLOCKS          <=  reg_data(274)(13 downto  4);       
  Ctrl.HPS(0).LSF.LSF(1).sb_lsf_mdt_hits_raddr   <=  reg_data(276)(23 downto 16);       
  Ctrl.HPS(0).LSF.LSF(2).sb_lsf_mdt_hits_freeze  <=  reg_data(291)( 0);                 
  Ctrl.HPS(0).LSF.LSF(2).HBA_MAX_CLOCKS          <=  reg_data(290)(13 downto  4);       
  Ctrl.HPS(0).LSF.LSF(2).sb_lsf_mdt_hits_raddr   <=  reg_data(292)(23 downto 16);       
  Ctrl.HPS(1).LSF.LSF(0).sb_lsf_mdt_hits_freeze  <=  reg_data(4355)( 0);                
  Ctrl.HPS(1).LSF.LSF(0).HBA_MAX_CLOCKS          <=  reg_data(4354)(13 downto  4);      
  Ctrl.HPS(1).LSF.LSF(0).sb_lsf_mdt_hits_raddr   <=  reg_data(4356)(23 downto 16);      
  Ctrl.HPS(1).LSF.LSF(1).sb_lsf_mdt_hits_freeze  <=  reg_data(4371)( 0);                
  Ctrl.HPS(1).LSF.LSF(1).HBA_MAX_CLOCKS          <=  reg_data(4370)(13 downto  4);      
  Ctrl.HPS(1).LSF.LSF(1).sb_lsf_mdt_hits_raddr   <=  reg_data(4372)(23 downto 16);      
  Ctrl.HPS(1).LSF.LSF(2).sb_lsf_mdt_hits_freeze  <=  reg_data(4387)( 0);                
  Ctrl.HPS(1).LSF.LSF(2).HBA_MAX_CLOCKS          <=  reg_data(4386)(13 downto  4);      
  Ctrl.HPS(1).LSF.LSF(2).sb_lsf_mdt_hits_raddr   <=  reg_data(4388)(23 downto 16);      
  Ctrl.HPS(2).LSF.LSF(0).sb_lsf_mdt_hits_freeze  <=  reg_data(8451)( 0);                
  Ctrl.HPS(2).LSF.LSF(0).HBA_MAX_CLOCKS          <=  reg_data(8450)(13 downto  4);      
  Ctrl.HPS(2).LSF.LSF(0).sb_lsf_mdt_hits_raddr   <=  reg_data(8452)(23 downto 16);      
  Ctrl.HPS(2).LSF.LSF(1).sb_lsf_mdt_hits_freeze  <=  reg_data(8467)( 0);                
  Ctrl.HPS(2).LSF.LSF(1).HBA_MAX_CLOCKS          <=  reg_data(8466)(13 downto  4);      
  Ctrl.HPS(2).LSF.LSF(1).sb_lsf_mdt_hits_raddr   <=  reg_data(8468)(23 downto 16);      
  Ctrl.HPS(2).LSF.LSF(2).sb_lsf_mdt_hits_freeze  <=  reg_data(8483)( 0);                
  Ctrl.HPS(2).LSF.LSF(2).HBA_MAX_CLOCKS          <=  reg_data(8482)(13 downto  4);      
  Ctrl.HPS(2).LSF.LSF(2).sb_lsf_mdt_hits_raddr   <=  reg_data(8484)(23 downto 16);      
  Ctrl.HPS(3).LSF.LSF(0).sb_lsf_mdt_hits_freeze  <=  reg_data(16643)( 0);               
  Ctrl.HPS(3).LSF.LSF(0).HBA_MAX_CLOCKS          <=  reg_data(16642)(13 downto  4);     
  Ctrl.HPS(3).LSF.LSF(0).sb_lsf_mdt_hits_raddr   <=  reg_data(16644)(23 downto 16);     
  Ctrl.HPS(3).LSF.LSF(1).sb_lsf_mdt_hits_freeze  <=  reg_data(16659)( 0);               
  Ctrl.HPS(3).LSF.LSF(1).HBA_MAX_CLOCKS          <=  reg_data(16658)(13 downto  4);     
  Ctrl.HPS(3).LSF.LSF(1).sb_lsf_mdt_hits_raddr   <=  reg_data(16660)(23 downto 16);     
  Ctrl.HPS(3).LSF.LSF(2).sb_lsf_mdt_hits_freeze  <=  reg_data(16675)( 0);               
  Ctrl.HPS(3).LSF.LSF(2).HBA_MAX_CLOCKS          <=  reg_data(16674)(13 downto  4);     
  Ctrl.HPS(3).LSF.LSF(2).sb_lsf_mdt_hits_raddr   <=  reg_data(16676)(23 downto 16);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data(259)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(0).LSF.LSF(0).sb_lsf_mdt_hits_freeze;
      reg_data(258)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(0).LSF.LSF(0).HBA_MAX_CLOCKS;
      reg_data(260)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(0).LSF.LSF(0).sb_lsf_mdt_hits_raddr;
      reg_data(275)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(0).LSF.LSF(1).sb_lsf_mdt_hits_freeze;
      reg_data(274)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(0).LSF.LSF(1).HBA_MAX_CLOCKS;
      reg_data(276)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(0).LSF.LSF(1).sb_lsf_mdt_hits_raddr;
      reg_data(291)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(0).LSF.LSF(2).sb_lsf_mdt_hits_freeze;
      reg_data(290)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(0).LSF.LSF(2).HBA_MAX_CLOCKS;
      reg_data(292)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(0).LSF.LSF(2).sb_lsf_mdt_hits_raddr;
      reg_data(4355)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(1).LSF.LSF(0).sb_lsf_mdt_hits_freeze;
      reg_data(4354)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(1).LSF.LSF(0).HBA_MAX_CLOCKS;
      reg_data(4356)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(1).LSF.LSF(0).sb_lsf_mdt_hits_raddr;
      reg_data(4371)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(1).LSF.LSF(1).sb_lsf_mdt_hits_freeze;
      reg_data(4370)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(1).LSF.LSF(1).HBA_MAX_CLOCKS;
      reg_data(4372)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(1).LSF.LSF(1).sb_lsf_mdt_hits_raddr;
      reg_data(4387)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(1).LSF.LSF(2).sb_lsf_mdt_hits_freeze;
      reg_data(4386)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(1).LSF.LSF(2).HBA_MAX_CLOCKS;
      reg_data(4388)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(1).LSF.LSF(2).sb_lsf_mdt_hits_raddr;
      reg_data(8451)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(2).LSF.LSF(0).sb_lsf_mdt_hits_freeze;
      reg_data(8450)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(2).LSF.LSF(0).HBA_MAX_CLOCKS;
      reg_data(8452)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(2).LSF.LSF(0).sb_lsf_mdt_hits_raddr;
      reg_data(8467)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(2).LSF.LSF(1).sb_lsf_mdt_hits_freeze;
      reg_data(8466)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(2).LSF.LSF(1).HBA_MAX_CLOCKS;
      reg_data(8468)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(2).LSF.LSF(1).sb_lsf_mdt_hits_raddr;
      reg_data(8483)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(2).LSF.LSF(2).sb_lsf_mdt_hits_freeze;
      reg_data(8482)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(2).LSF.LSF(2).HBA_MAX_CLOCKS;
      reg_data(8484)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(2).LSF.LSF(2).sb_lsf_mdt_hits_raddr;
      reg_data(16643)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(3).LSF.LSF(0).sb_lsf_mdt_hits_freeze;
      reg_data(16642)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(3).LSF.LSF(0).HBA_MAX_CLOCKS;
      reg_data(16644)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(3).LSF.LSF(0).sb_lsf_mdt_hits_raddr;
      reg_data(16659)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(3).LSF.LSF(1).sb_lsf_mdt_hits_freeze;
      reg_data(16658)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(3).LSF.LSF(1).HBA_MAX_CLOCKS;
      reg_data(16660)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(3).LSF.LSF(1).sb_lsf_mdt_hits_raddr;
      reg_data(16675)( 0)  <= DEFAULT_H2S_CTRL_t.HPS(3).LSF.LSF(2).sb_lsf_mdt_hits_freeze;
      reg_data(16674)(13 downto  4)  <= DEFAULT_H2S_CTRL_t.HPS(3).LSF.LSF(2).HBA_MAX_CLOCKS;
      reg_data(16676)(23 downto 16)  <= DEFAULT_H2S_CTRL_t.HPS(3).LSF.LSF(2).sb_lsf_mdt_hits_raddr;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.HPS(0).RESET <= '0';
      Ctrl.HPS(0).LSF.LSF(0).RESET <= '0';
      Ctrl.HPS(0).LSF.LSF(0).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(0).LSF.LSF(1).RESET <= '0';
      Ctrl.HPS(0).LSF.LSF(1).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(0).LSF.LSF(2).RESET <= '0';
      Ctrl.HPS(0).LSF.LSF(2).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(0).CSF.CSF(0).RESET <= '0';
      Ctrl.HPS(0).CSF.CSF(1).RESET <= '0';
      Ctrl.HPS(0).CSF.CSF(2).RESET <= '0';
      Ctrl.HPS(1).RESET <= '0';
      Ctrl.HPS(1).LSF.LSF(0).RESET <= '0';
      Ctrl.HPS(1).LSF.LSF(0).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(1).LSF.LSF(1).RESET <= '0';
      Ctrl.HPS(1).LSF.LSF(1).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(1).LSF.LSF(2).RESET <= '0';
      Ctrl.HPS(1).LSF.LSF(2).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(1).CSF.CSF(0).RESET <= '0';
      Ctrl.HPS(1).CSF.CSF(1).RESET <= '0';
      Ctrl.HPS(1).CSF.CSF(2).RESET <= '0';
      Ctrl.HPS(2).RESET <= '0';
      Ctrl.HPS(2).LSF.LSF(0).RESET <= '0';
      Ctrl.HPS(2).LSF.LSF(0).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(2).LSF.LSF(1).RESET <= '0';
      Ctrl.HPS(2).LSF.LSF(1).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(2).LSF.LSF(2).RESET <= '0';
      Ctrl.HPS(2).LSF.LSF(2).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(2).CSF.CSF(0).RESET <= '0';
      Ctrl.HPS(2).CSF.CSF(1).RESET <= '0';
      Ctrl.HPS(2).CSF.CSF(2).RESET <= '0';
      Ctrl.HPS(3).RESET <= '0';
      Ctrl.HPS(3).LSF.LSF(0).RESET <= '0';
      Ctrl.HPS(3).LSF.LSF(0).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(3).LSF.LSF(1).RESET <= '0';
      Ctrl.HPS(3).LSF.LSF(1).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(3).LSF.LSF(2).RESET <= '0';
      Ctrl.HPS(3).LSF.LSF(2).sb_lsf_mdt_hits_re <= '0';
      Ctrl.HPS(3).CSF.CSF(0).RESET <= '0';
      Ctrl.HPS(3).CSF.CSF(1).RESET <= '0';
      Ctrl.HPS(3).CSF.CSF(2).RESET <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(14 downto 0))) is
        when 0 => --0x0
          Ctrl.HPS(0).RESET                          <=  localWrData( 0);               
        when 256 => --0x100
          Ctrl.HPS(0).LSF.LSF(0).RESET               <=  localWrData( 0);               
        when 259 => --0x103
          reg_data(259)( 0)                          <=  localWrData( 0);                --
        when 261 => --0x105
          Ctrl.HPS(0).LSF.LSF(0).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 258 => --0x102
          reg_data(258)(13 downto  4)                <=  localWrData(13 downto  4);      --add some description
        when 260 => --0x104
          reg_data(260)(23 downto 16)                <=  localWrData(23 downto 16);      --
        when 272 => --0x110
          Ctrl.HPS(0).LSF.LSF(1).RESET               <=  localWrData( 0);               
        when 275 => --0x113
          reg_data(275)( 0)                          <=  localWrData( 0);                --
        when 277 => --0x115
          Ctrl.HPS(0).LSF.LSF(1).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 274 => --0x112
          reg_data(274)(13 downto  4)                <=  localWrData(13 downto  4);      --add some description
        when 276 => --0x114
          reg_data(276)(23 downto 16)                <=  localWrData(23 downto 16);      --
        when 288 => --0x120
          Ctrl.HPS(0).LSF.LSF(2).RESET               <=  localWrData( 0);               
        when 291 => --0x123
          reg_data(291)( 0)                          <=  localWrData( 0);                --
        when 293 => --0x125
          Ctrl.HPS(0).LSF.LSF(2).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 290 => --0x122
          reg_data(290)(13 downto  4)                <=  localWrData(13 downto  4);      --add some description
        when 292 => --0x124
          reg_data(292)(23 downto 16)                <=  localWrData(23 downto 16);      --
        when 512 => --0x200
          Ctrl.HPS(0).CSF.CSF(0).RESET               <=  localWrData( 0);               
        when 528 => --0x210
          Ctrl.HPS(0).CSF.CSF(1).RESET               <=  localWrData( 0);               
        when 544 => --0x220
          Ctrl.HPS(0).CSF.CSF(2).RESET               <=  localWrData( 0);               
        when 4096 => --0x1000
          Ctrl.HPS(1).RESET                          <=  localWrData( 0);               
        when 4352 => --0x1100
          Ctrl.HPS(1).LSF.LSF(0).RESET               <=  localWrData( 0);               
        when 4355 => --0x1103
          reg_data(4355)( 0)                         <=  localWrData( 0);                --
        when 4357 => --0x1105
          Ctrl.HPS(1).LSF.LSF(0).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 4354 => --0x1102
          reg_data(4354)(13 downto  4)               <=  localWrData(13 downto  4);      --add some description
        when 4356 => --0x1104
          reg_data(4356)(23 downto 16)               <=  localWrData(23 downto 16);      --
        when 4368 => --0x1110
          Ctrl.HPS(1).LSF.LSF(1).RESET               <=  localWrData( 0);               
        when 4371 => --0x1113
          reg_data(4371)( 0)                         <=  localWrData( 0);                --
        when 4373 => --0x1115
          Ctrl.HPS(1).LSF.LSF(1).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 4370 => --0x1112
          reg_data(4370)(13 downto  4)               <=  localWrData(13 downto  4);      --add some description
        when 4372 => --0x1114
          reg_data(4372)(23 downto 16)               <=  localWrData(23 downto 16);      --
        when 4384 => --0x1120
          Ctrl.HPS(1).LSF.LSF(2).RESET               <=  localWrData( 0);               
        when 4387 => --0x1123
          reg_data(4387)( 0)                         <=  localWrData( 0);                --
        when 4389 => --0x1125
          Ctrl.HPS(1).LSF.LSF(2).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 4386 => --0x1122
          reg_data(4386)(13 downto  4)               <=  localWrData(13 downto  4);      --add some description
        when 4388 => --0x1124
          reg_data(4388)(23 downto 16)               <=  localWrData(23 downto 16);      --
        when 4608 => --0x1200
          Ctrl.HPS(1).CSF.CSF(0).RESET               <=  localWrData( 0);               
        when 4624 => --0x1210
          Ctrl.HPS(1).CSF.CSF(1).RESET               <=  localWrData( 0);               
        when 4640 => --0x1220
          Ctrl.HPS(1).CSF.CSF(2).RESET               <=  localWrData( 0);               
        when 8192 => --0x2000
          Ctrl.HPS(2).RESET                          <=  localWrData( 0);               
        when 8448 => --0x2100
          Ctrl.HPS(2).LSF.LSF(0).RESET               <=  localWrData( 0);               
        when 8451 => --0x2103
          reg_data(8451)( 0)                         <=  localWrData( 0);                --
        when 8453 => --0x2105
          Ctrl.HPS(2).LSF.LSF(0).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 8450 => --0x2102
          reg_data(8450)(13 downto  4)               <=  localWrData(13 downto  4);      --add some description
        when 8452 => --0x2104
          reg_data(8452)(23 downto 16)               <=  localWrData(23 downto 16);      --
        when 8464 => --0x2110
          Ctrl.HPS(2).LSF.LSF(1).RESET               <=  localWrData( 0);               
        when 8467 => --0x2113
          reg_data(8467)( 0)                         <=  localWrData( 0);                --
        when 8469 => --0x2115
          Ctrl.HPS(2).LSF.LSF(1).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 8466 => --0x2112
          reg_data(8466)(13 downto  4)               <=  localWrData(13 downto  4);      --add some description
        when 8468 => --0x2114
          reg_data(8468)(23 downto 16)               <=  localWrData(23 downto 16);      --
        when 8480 => --0x2120
          Ctrl.HPS(2).LSF.LSF(2).RESET               <=  localWrData( 0);               
        when 8483 => --0x2123
          reg_data(8483)( 0)                         <=  localWrData( 0);                --
        when 8485 => --0x2125
          Ctrl.HPS(2).LSF.LSF(2).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 8482 => --0x2122
          reg_data(8482)(13 downto  4)               <=  localWrData(13 downto  4);      --add some description
        when 8484 => --0x2124
          reg_data(8484)(23 downto 16)               <=  localWrData(23 downto 16);      --
        when 8704 => --0x2200
          Ctrl.HPS(2).CSF.CSF(0).RESET               <=  localWrData( 0);               
        when 8720 => --0x2210
          Ctrl.HPS(2).CSF.CSF(1).RESET               <=  localWrData( 0);               
        when 8736 => --0x2220
          Ctrl.HPS(2).CSF.CSF(2).RESET               <=  localWrData( 0);               
        when 16384 => --0x4000
          Ctrl.HPS(3).RESET                          <=  localWrData( 0);               
        when 16640 => --0x4100
          Ctrl.HPS(3).LSF.LSF(0).RESET               <=  localWrData( 0);               
        when 16643 => --0x4103
          reg_data(16643)( 0)                        <=  localWrData( 0);                --
        when 16645 => --0x4105
          Ctrl.HPS(3).LSF.LSF(0).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 16642 => --0x4102
          reg_data(16642)(13 downto  4)              <=  localWrData(13 downto  4);      --add some description
        when 16644 => --0x4104
          reg_data(16644)(23 downto 16)              <=  localWrData(23 downto 16);      --
        when 16656 => --0x4110
          Ctrl.HPS(3).LSF.LSF(1).RESET               <=  localWrData( 0);               
        when 16659 => --0x4113
          reg_data(16659)( 0)                        <=  localWrData( 0);                --
        when 16661 => --0x4115
          Ctrl.HPS(3).LSF.LSF(1).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 16658 => --0x4112
          reg_data(16658)(13 downto  4)              <=  localWrData(13 downto  4);      --add some description
        when 16660 => --0x4114
          reg_data(16660)(23 downto 16)              <=  localWrData(23 downto 16);      --
        when 16672 => --0x4120
          Ctrl.HPS(3).LSF.LSF(2).RESET               <=  localWrData( 0);               
        when 16675 => --0x4123
          reg_data(16675)( 0)                        <=  localWrData( 0);                --
        when 16677 => --0x4125
          Ctrl.HPS(3).LSF.LSF(2).sb_lsf_mdt_hits_re  <=  localWrData( 0);               
        when 16674 => --0x4122
          reg_data(16674)(13 downto  4)              <=  localWrData(13 downto  4);      --add some description
        when 16676 => --0x4124
          reg_data(16676)(23 downto 16)              <=  localWrData(23 downto 16);      --
        when 16896 => --0x4200
          Ctrl.HPS(3).CSF.CSF(0).RESET               <=  localWrData( 0);               
        when 16912 => --0x4210
          Ctrl.HPS(3).CSF.CSF(1).RESET               <=  localWrData( 0);               
        when 16928 => --0x4220
          Ctrl.HPS(3).CSF.CSF(2).RESET               <=  localWrData( 0);               

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;


end architecture behavioral;
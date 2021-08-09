--This file was auto-generated.
--Modifications might be lost.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.AXIRegWidthPkg.all;
use work.AXIRegPkg.all;
use work.types.all;

use work.MPL_Ctrl.all;
use work.MPL_Ctrl_DEF.all;
entity MPL_map is
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    slave_readMOSI   : in  AXIReadMOSI;
    slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
    slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
    
    Mon              : in  MPL_Mon_t;
    Ctrl             : out MPL_Ctrl_t
        
    );
end entity MPL_map;
architecture behavioral of MPL_map is
  signal localAddress       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal localRdData        : slv_32_t;
  signal localRdData_latch  : slv_32_t;
  signal localWrData        : slv_32_t;
  signal localWrEn          : std_logic;
  signal localRdReq         : std_logic;
  signal localRdAck         : std_logic;
  signal regRdAck           : std_logic;

  
  
  signal reg_data :  slv32_array_t(integer range 0 to 332);
  constant Default_reg_data : slv32_array_t(integer range 0 to 332) := (others => x"00000000");
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
        case to_integer(unsigned(localAddress(8 downto 0))) is
          
        when 1 => --0x1
          localRdData( 3 downto  0)  <=  reg_data( 1)( 3 downto  0);                  --
          localRdData( 4)            <=  reg_data( 1)( 4);                            --
          localRdData( 5)            <=  reg_data( 1)( 5);                            --
          localRdData( 6)            <=  reg_data( 1)( 6);                            --
        when 2 => --0x2
          localRdData( 0)            <=  Mon.STATUS.ENABLED;                          --
          localRdData( 1)            <=  Mon.STATUS.READY;                            --
          localRdData( 2)            <=  Mon.STATUS.ERROR;                            --
        when 257 => --0x101
          localRdData( 0)            <=  Mon.PL_MEM.PL_MEM(0).rd_rdy;                 --Read ready
        when 258 => --0x102
          localRdData(11 downto  0)  <=  reg_data(258)(11 downto  0);                 --wr_Address
          localRdData(27 downto 16)  <=  reg_data(258)(27 downto 16);                 --rd_Address
        when 259 => --0x103
          localRdData(31 downto  0)  <=  reg_data(259)(31 downto  0);                 --Write Data 0
        when 260 => --0x104
          localRdData(31 downto  0)  <=  reg_data(260)(31 downto  0);                 --Write Data 1
        when 261 => --0x105
          localRdData(31 downto  0)  <=  reg_data(261)(31 downto  0);                 --Write Data 2
        when 262 => --0x106
          localRdData(31 downto  0)  <=  reg_data(262)(31 downto  0);                 --Write Data 3
        when 263 => --0x107
          localRdData(19 downto  0)  <=  reg_data(263)(19 downto  0);                 --Write Data 4
        when 264 => --0x108
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data.rd_data_0;      --Read Data 0
        when 265 => --0x109
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data.rd_data_1;      --Read Data 1
        when 266 => --0x10a
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data.rd_data_2;      --Read Data 2
        when 267 => --0x10b
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data.rd_data_3;      --Read Data 3
        when 268 => --0x10c
          localRdData(19 downto  0)  <=  Mon.PL_MEM.PL_MEM(0).rd_data.rd_data_4;      --Read Data 4
        when 273 => --0x111
          localRdData( 0)            <=  Mon.PL_MEM.PL_MEM(1).rd_rdy;                 --Read ready
        when 274 => --0x112
          localRdData(11 downto  0)  <=  reg_data(274)(11 downto  0);                 --wr_Address
          localRdData(27 downto 16)  <=  reg_data(274)(27 downto 16);                 --rd_Address
        when 275 => --0x113
          localRdData(31 downto  0)  <=  reg_data(275)(31 downto  0);                 --Write Data 0
        when 276 => --0x114
          localRdData(31 downto  0)  <=  reg_data(276)(31 downto  0);                 --Write Data 1
        when 277 => --0x115
          localRdData(31 downto  0)  <=  reg_data(277)(31 downto  0);                 --Write Data 2
        when 278 => --0x116
          localRdData(31 downto  0)  <=  reg_data(278)(31 downto  0);                 --Write Data 3
        when 279 => --0x117
          localRdData(19 downto  0)  <=  reg_data(279)(19 downto  0);                 --Write Data 4
        when 280 => --0x118
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data.rd_data_0;      --Read Data 0
        when 281 => --0x119
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data.rd_data_1;      --Read Data 1
        when 282 => --0x11a
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data.rd_data_2;      --Read Data 2
        when 283 => --0x11b
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data.rd_data_3;      --Read Data 3
        when 284 => --0x11c
          localRdData(19 downto  0)  <=  Mon.PL_MEM.PL_MEM(1).rd_data.rd_data_4;      --Read Data 4
        when 289 => --0x121
          localRdData( 0)            <=  Mon.PL_MEM.PL_MEM(2).rd_rdy;                 --Read ready
        when 290 => --0x122
          localRdData(11 downto  0)  <=  reg_data(290)(11 downto  0);                 --wr_Address
          localRdData(27 downto 16)  <=  reg_data(290)(27 downto 16);                 --rd_Address
        when 291 => --0x123
          localRdData(31 downto  0)  <=  reg_data(291)(31 downto  0);                 --Write Data 0
        when 292 => --0x124
          localRdData(31 downto  0)  <=  reg_data(292)(31 downto  0);                 --Write Data 1
        when 293 => --0x125
          localRdData(31 downto  0)  <=  reg_data(293)(31 downto  0);                 --Write Data 2
        when 294 => --0x126
          localRdData(31 downto  0)  <=  reg_data(294)(31 downto  0);                 --Write Data 3
        when 295 => --0x127
          localRdData(19 downto  0)  <=  reg_data(295)(19 downto  0);                 --Write Data 4
        when 296 => --0x128
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data.rd_data_0;      --Read Data 0
        when 297 => --0x129
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data.rd_data_1;      --Read Data 1
        when 298 => --0x12a
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data.rd_data_2;      --Read Data 2
        when 299 => --0x12b
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data.rd_data_3;      --Read Data 3
        when 300 => --0x12c
          localRdData(19 downto  0)  <=  Mon.PL_MEM.PL_MEM(2).rd_data.rd_data_4;      --Read Data 4
        when 305 => --0x131
          localRdData( 0)            <=  Mon.PL_MEM.PL_MEM(3).rd_rdy;                 --Read ready
        when 306 => --0x132
          localRdData(11 downto  0)  <=  reg_data(306)(11 downto  0);                 --wr_Address
          localRdData(27 downto 16)  <=  reg_data(306)(27 downto 16);                 --rd_Address
        when 307 => --0x133
          localRdData(31 downto  0)  <=  reg_data(307)(31 downto  0);                 --Write Data 0
        when 308 => --0x134
          localRdData(31 downto  0)  <=  reg_data(308)(31 downto  0);                 --Write Data 1
        when 309 => --0x135
          localRdData(31 downto  0)  <=  reg_data(309)(31 downto  0);                 --Write Data 2
        when 310 => --0x136
          localRdData(31 downto  0)  <=  reg_data(310)(31 downto  0);                 --Write Data 3
        when 311 => --0x137
          localRdData(19 downto  0)  <=  reg_data(311)(19 downto  0);                 --Write Data 4
        when 312 => --0x138
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data.rd_data_0;      --Read Data 0
        when 313 => --0x139
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data.rd_data_1;      --Read Data 1
        when 314 => --0x13a
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data.rd_data_2;      --Read Data 2
        when 315 => --0x13b
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data.rd_data_3;      --Read Data 3
        when 316 => --0x13c
          localRdData(19 downto  0)  <=  Mon.PL_MEM.PL_MEM(3).rd_data.rd_data_4;      --Read Data 4
        when 321 => --0x141
          localRdData( 0)            <=  Mon.PL_MEM.PL_MEM(4).rd_rdy;                 --Read ready
        when 322 => --0x142
          localRdData(11 downto  0)  <=  reg_data(322)(11 downto  0);                 --wr_Address
          localRdData(27 downto 16)  <=  reg_data(322)(27 downto 16);                 --rd_Address
        when 323 => --0x143
          localRdData(31 downto  0)  <=  reg_data(323)(31 downto  0);                 --Write Data 0
        when 324 => --0x144
          localRdData(31 downto  0)  <=  reg_data(324)(31 downto  0);                 --Write Data 1
        when 325 => --0x145
          localRdData(31 downto  0)  <=  reg_data(325)(31 downto  0);                 --Write Data 2
        when 326 => --0x146
          localRdData(31 downto  0)  <=  reg_data(326)(31 downto  0);                 --Write Data 3
        when 327 => --0x147
          localRdData(19 downto  0)  <=  reg_data(327)(19 downto  0);                 --Write Data 4
        when 328 => --0x148
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data.rd_data_0;      --Read Data 0
        when 329 => --0x149
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data.rd_data_1;      --Read Data 1
        when 330 => --0x14a
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data.rd_data_2;      --Read Data 2
        when 331 => --0x14b
          localRdData(31 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data.rd_data_3;      --Read Data 3
        when 332 => --0x14c
          localRdData(19 downto  0)  <=  Mon.PL_MEM.PL_MEM(4).rd_data.rd_data_4;      --Read Data 4


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
  Ctrl.CONFIGS.THREADS                     <=  reg_data( 1)( 3 downto  0);      
  Ctrl.CONFIGS.INPUT_EN                    <=  reg_data( 1)( 4);                
  Ctrl.CONFIGS.OUTPUT_EN                   <=  reg_data( 1)( 5);                
  Ctrl.CONFIGS.FLUSH_MEM_RESET             <=  reg_data( 1)( 6);                
  Ctrl.PL_MEM.PL_MEM(0).wr_addr            <=  reg_data(258)(11 downto  0);     
  Ctrl.PL_MEM.PL_MEM(0).rd_addr            <=  reg_data(258)(27 downto 16);     
  Ctrl.PL_MEM.PL_MEM(0).wr_data.wr_data_0  <=  reg_data(259)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(0).wr_data.wr_data_1  <=  reg_data(260)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(0).wr_data.wr_data_2  <=  reg_data(261)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(0).wr_data.wr_data_3  <=  reg_data(262)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(0).wr_data.wr_data_4  <=  reg_data(263)(19 downto  0);     
  Ctrl.PL_MEM.PL_MEM(1).wr_addr            <=  reg_data(274)(11 downto  0);     
  Ctrl.PL_MEM.PL_MEM(1).rd_addr            <=  reg_data(274)(27 downto 16);     
  Ctrl.PL_MEM.PL_MEM(1).wr_data.wr_data_0  <=  reg_data(275)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(1).wr_data.wr_data_1  <=  reg_data(276)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(1).wr_data.wr_data_2  <=  reg_data(277)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(1).wr_data.wr_data_3  <=  reg_data(278)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(1).wr_data.wr_data_4  <=  reg_data(279)(19 downto  0);     
  Ctrl.PL_MEM.PL_MEM(2).wr_addr            <=  reg_data(290)(11 downto  0);     
  Ctrl.PL_MEM.PL_MEM(2).rd_addr            <=  reg_data(290)(27 downto 16);     
  Ctrl.PL_MEM.PL_MEM(2).wr_data.wr_data_0  <=  reg_data(291)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(2).wr_data.wr_data_1  <=  reg_data(292)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(2).wr_data.wr_data_2  <=  reg_data(293)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(2).wr_data.wr_data_3  <=  reg_data(294)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(2).wr_data.wr_data_4  <=  reg_data(295)(19 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).wr_addr            <=  reg_data(306)(11 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).rd_addr            <=  reg_data(306)(27 downto 16);     
  Ctrl.PL_MEM.PL_MEM(3).wr_data.wr_data_0  <=  reg_data(307)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).wr_data.wr_data_1  <=  reg_data(308)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).wr_data.wr_data_2  <=  reg_data(309)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).wr_data.wr_data_3  <=  reg_data(310)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(3).wr_data.wr_data_4  <=  reg_data(311)(19 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_addr            <=  reg_data(322)(11 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).rd_addr            <=  reg_data(322)(27 downto 16);     
  Ctrl.PL_MEM.PL_MEM(4).wr_data.wr_data_0  <=  reg_data(323)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_data.wr_data_1  <=  reg_data(324)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_data.wr_data_2  <=  reg_data(325)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_data.wr_data_3  <=  reg_data(326)(31 downto  0);     
  Ctrl.PL_MEM.PL_MEM(4).wr_data.wr_data_4  <=  reg_data(327)(19 downto  0);     


  reg_writes: process (clk_axi, reset_axi_n) is
  begin  -- process reg_writes
    if reset_axi_n = '0' then                 -- asynchronous reset (active low)
      reg_data( 1)( 3 downto  0)  <= DEFAULT_MPL_CTRL_t.CONFIGS.THREADS;
      reg_data( 1)( 4)  <= DEFAULT_MPL_CTRL_t.CONFIGS.INPUT_EN;
      reg_data( 1)( 5)  <= DEFAULT_MPL_CTRL_t.CONFIGS.OUTPUT_EN;
      reg_data( 1)( 6)  <= DEFAULT_MPL_CTRL_t.CONFIGS.FLUSH_MEM_RESET;
      reg_data(258)(11 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_addr;
      reg_data(258)(27 downto 16)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).rd_addr;
      reg_data(259)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data.wr_data_0;
      reg_data(260)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data.wr_data_1;
      reg_data(261)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data.wr_data_2;
      reg_data(262)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data.wr_data_3;
      reg_data(263)(19 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(0).wr_data.wr_data_4;
      reg_data(274)(11 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_addr;
      reg_data(274)(27 downto 16)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).rd_addr;
      reg_data(275)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data.wr_data_0;
      reg_data(276)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data.wr_data_1;
      reg_data(277)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data.wr_data_2;
      reg_data(278)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data.wr_data_3;
      reg_data(279)(19 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(1).wr_data.wr_data_4;
      reg_data(290)(11 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_addr;
      reg_data(290)(27 downto 16)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).rd_addr;
      reg_data(291)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data.wr_data_0;
      reg_data(292)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data.wr_data_1;
      reg_data(293)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data.wr_data_2;
      reg_data(294)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data.wr_data_3;
      reg_data(295)(19 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(2).wr_data.wr_data_4;
      reg_data(306)(11 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_addr;
      reg_data(306)(27 downto 16)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).rd_addr;
      reg_data(307)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data.wr_data_0;
      reg_data(308)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data.wr_data_1;
      reg_data(309)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data.wr_data_2;
      reg_data(310)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data.wr_data_3;
      reg_data(311)(19 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(3).wr_data.wr_data_4;
      reg_data(322)(11 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_addr;
      reg_data(322)(27 downto 16)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).rd_addr;
      reg_data(323)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data.wr_data_0;
      reg_data(324)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data.wr_data_1;
      reg_data(325)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data.wr_data_2;
      reg_data(326)(31 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data.wr_data_3;
      reg_data(327)(19 downto  0)  <= DEFAULT_MPL_CTRL_t.PL_MEM.PL_MEM(4).wr_data.wr_data_4;

    elsif clk_axi'event and clk_axi = '1' then  -- rising clock edge
      Ctrl.ACTIONS.RESET <= '0';
      Ctrl.ACTIONS.ENABLE <= '0';
      Ctrl.ACTIONS.DISABLE <= '0';
      Ctrl.ACTIONS.FREEZE <= '0';
      Ctrl.PL_MEM.PL_MEM(0).wr_req <= '0';
      Ctrl.PL_MEM.PL_MEM(0).wr_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(0).rd_req <= '0';
      Ctrl.PL_MEM.PL_MEM(0).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(0).flush_req <= '0';
      Ctrl.PL_MEM.PL_MEM(1).wr_req <= '0';
      Ctrl.PL_MEM.PL_MEM(1).wr_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(1).rd_req <= '0';
      Ctrl.PL_MEM.PL_MEM(1).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(1).flush_req <= '0';
      Ctrl.PL_MEM.PL_MEM(2).wr_req <= '0';
      Ctrl.PL_MEM.PL_MEM(2).wr_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(2).rd_req <= '0';
      Ctrl.PL_MEM.PL_MEM(2).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(2).flush_req <= '0';
      Ctrl.PL_MEM.PL_MEM(3).wr_req <= '0';
      Ctrl.PL_MEM.PL_MEM(3).wr_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(3).rd_req <= '0';
      Ctrl.PL_MEM.PL_MEM(3).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(3).flush_req <= '0';
      Ctrl.PL_MEM.PL_MEM(4).wr_req <= '0';
      Ctrl.PL_MEM.PL_MEM(4).wr_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(4).rd_req <= '0';
      Ctrl.PL_MEM.PL_MEM(4).rd_ack <= '0';
      Ctrl.PL_MEM.PL_MEM(4).flush_req <= '0';
      

      
      if localWrEn = '1' then
        case to_integer(unsigned(localAddress(8 downto 0))) is
        when 0 => --0x0
          Ctrl.ACTIONS.RESET               <=  localWrData( 0);               
          Ctrl.ACTIONS.ENABLE              <=  localWrData( 1);               
          Ctrl.ACTIONS.DISABLE             <=  localWrData( 2);               
          Ctrl.ACTIONS.FREEZE              <=  localWrData( 3);               
        when 1 => --0x1
          reg_data( 1)( 3 downto  0)       <=  localWrData( 3 downto  0);      --
          reg_data( 1)( 4)                 <=  localWrData( 4);                --
          reg_data( 1)( 5)                 <=  localWrData( 5);                --
          reg_data( 1)( 6)                 <=  localWrData( 6);                --
        when 256 => --0x100
          Ctrl.PL_MEM.PL_MEM(0).wr_req     <=  localWrData( 0);               
          Ctrl.PL_MEM.PL_MEM(0).wr_ack     <=  localWrData( 1);               
          Ctrl.PL_MEM.PL_MEM(0).rd_req     <=  localWrData( 2);               
          Ctrl.PL_MEM.PL_MEM(0).rd_ack     <=  localWrData( 3);               
          Ctrl.PL_MEM.PL_MEM(0).flush_req  <=  localWrData( 4);               
        when 258 => --0x102
          reg_data(258)(11 downto  0)      <=  localWrData(11 downto  0);      --wr_Address
          reg_data(258)(27 downto 16)      <=  localWrData(27 downto 16);      --rd_Address
        when 259 => --0x103
          reg_data(259)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 0
        when 260 => --0x104
          reg_data(260)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 1
        when 261 => --0x105
          reg_data(261)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 2
        when 262 => --0x106
          reg_data(262)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 3
        when 263 => --0x107
          reg_data(263)(19 downto  0)      <=  localWrData(19 downto  0);      --Write Data 4
        when 272 => --0x110
          Ctrl.PL_MEM.PL_MEM(1).wr_req     <=  localWrData( 0);               
          Ctrl.PL_MEM.PL_MEM(1).wr_ack     <=  localWrData( 1);               
          Ctrl.PL_MEM.PL_MEM(1).rd_req     <=  localWrData( 2);               
          Ctrl.PL_MEM.PL_MEM(1).rd_ack     <=  localWrData( 3);               
          Ctrl.PL_MEM.PL_MEM(1).flush_req  <=  localWrData( 4);               
        when 274 => --0x112
          reg_data(274)(11 downto  0)      <=  localWrData(11 downto  0);      --wr_Address
          reg_data(274)(27 downto 16)      <=  localWrData(27 downto 16);      --rd_Address
        when 275 => --0x113
          reg_data(275)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 0
        when 276 => --0x114
          reg_data(276)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 1
        when 277 => --0x115
          reg_data(277)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 2
        when 278 => --0x116
          reg_data(278)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 3
        when 279 => --0x117
          reg_data(279)(19 downto  0)      <=  localWrData(19 downto  0);      --Write Data 4
        when 288 => --0x120
          Ctrl.PL_MEM.PL_MEM(2).wr_req     <=  localWrData( 0);               
          Ctrl.PL_MEM.PL_MEM(2).wr_ack     <=  localWrData( 1);               
          Ctrl.PL_MEM.PL_MEM(2).rd_req     <=  localWrData( 2);               
          Ctrl.PL_MEM.PL_MEM(2).rd_ack     <=  localWrData( 3);               
          Ctrl.PL_MEM.PL_MEM(2).flush_req  <=  localWrData( 4);               
        when 290 => --0x122
          reg_data(290)(11 downto  0)      <=  localWrData(11 downto  0);      --wr_Address
          reg_data(290)(27 downto 16)      <=  localWrData(27 downto 16);      --rd_Address
        when 291 => --0x123
          reg_data(291)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 0
        when 292 => --0x124
          reg_data(292)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 1
        when 293 => --0x125
          reg_data(293)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 2
        when 294 => --0x126
          reg_data(294)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 3
        when 295 => --0x127
          reg_data(295)(19 downto  0)      <=  localWrData(19 downto  0);      --Write Data 4
        when 304 => --0x130
          Ctrl.PL_MEM.PL_MEM(3).wr_req     <=  localWrData( 0);               
          Ctrl.PL_MEM.PL_MEM(3).wr_ack     <=  localWrData( 1);               
          Ctrl.PL_MEM.PL_MEM(3).rd_req     <=  localWrData( 2);               
          Ctrl.PL_MEM.PL_MEM(3).rd_ack     <=  localWrData( 3);               
          Ctrl.PL_MEM.PL_MEM(3).flush_req  <=  localWrData( 4);               
        when 306 => --0x132
          reg_data(306)(11 downto  0)      <=  localWrData(11 downto  0);      --wr_Address
          reg_data(306)(27 downto 16)      <=  localWrData(27 downto 16);      --rd_Address
        when 307 => --0x133
          reg_data(307)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 0
        when 308 => --0x134
          reg_data(308)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 1
        when 309 => --0x135
          reg_data(309)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 2
        when 310 => --0x136
          reg_data(310)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 3
        when 311 => --0x137
          reg_data(311)(19 downto  0)      <=  localWrData(19 downto  0);      --Write Data 4
        when 320 => --0x140
          Ctrl.PL_MEM.PL_MEM(4).wr_req     <=  localWrData( 0);               
          Ctrl.PL_MEM.PL_MEM(4).wr_ack     <=  localWrData( 1);               
          Ctrl.PL_MEM.PL_MEM(4).rd_req     <=  localWrData( 2);               
          Ctrl.PL_MEM.PL_MEM(4).rd_ack     <=  localWrData( 3);               
          Ctrl.PL_MEM.PL_MEM(4).flush_req  <=  localWrData( 4);               
        when 322 => --0x142
          reg_data(322)(11 downto  0)      <=  localWrData(11 downto  0);      --wr_Address
          reg_data(322)(27 downto 16)      <=  localWrData(27 downto 16);      --rd_Address
        when 323 => --0x143
          reg_data(323)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 0
        when 324 => --0x144
          reg_data(324)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 1
        when 325 => --0x145
          reg_data(325)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 2
        when 326 => --0x146
          reg_data(326)(31 downto  0)      <=  localWrData(31 downto  0);      --Write Data 3
        when 327 => --0x147
          reg_data(327)(19 downto  0)      <=  localWrData(19 downto  0);      --Write Data 4

          when others => null;
        end case;
      end if;
    end if;
  end process reg_writes;







  
end architecture behavioral;
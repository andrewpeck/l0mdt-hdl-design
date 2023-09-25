library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
library ctrl_lib;
use ctrl_lib.AXIRegWidthPkg.all;
use ctrl_lib.AXIRegPkg.all;
use ctrl_lib.types.all;
use ctrl_lib.BRAMPortPkg.all;
use ctrl_lib.FM_CTRL.all;
use ctrl_lib.FM_CTRL_DEF.all;

library ult_lib;
use ult_lib.all;

library shared_lib;
use shared_lib.common_types_pkg.all;

library fm_lib;
use fm_lib.fm_types.all;

library xil_defaultlib;
use xil_defaultlib.AXISlaveAddrPkg.all;

entity FM_map_vhdl_wrapper is
  generic (
    READ_TIMEOUT     : integer := 2048
    );
  port (
    clk_axi          : in  std_logic;
    reset_axi_n      : in  std_logic;
    clk_hs          : in  std_logic;
    reset_hs      : in  std_logic;

    --slave_readMOSI   : in  AXIReadMOSI;
   slave_readMOSI_address : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0); -- ARADDR
   slave_readMOSI_address_ID : in std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --ARID
   slave_readMOSI_protection_type : in slv_3_t; -- ARPROT
   slave_readMOSI_address_valid : in std_logic; -- ARVALID
   slave_readMOSI_burst_length : in slv_8_t; -- ARLEN
   slave_readMOSI_burst_size : in slv_3_t; -- ARSIZE
   slave_readMOSI_burst_type : in slv_2_t; -- ARBURST
   slave_readMOSI_lock_type : in std_logic; -- ARLOCK
   slave_readMOSI_cache_type : in slv_4_t; -- ARCACHE
   slave_readMOSI_qos : in slv_4_t; -- ARQOS
   slave_readMOSI_region : in slv_4_t; -- ARREGION
   slave_readMOSI_address_user : in slv_4_t; -- ARUSER		
   slave_readMOSI_ready_for_data : in std_logic; -- RREADY



    -- slave_readMISO   : out AXIReadMISO  := DefaultAXIReadMISO;
   slave_readMISO_ready_for_address : out std_logic; -- ARREADY
   slave_readMISO_data_ID : out std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --RID
   slave_readMISO_data : out slv_32_t; -- RDATA
   slave_readMISO_data_valid : out std_logic; -- RVALID
   slave_readMISO_response : out slv_2_t; -- RRESP
   slave_readMISO_last : out std_logic; -- RLAST
   slave_readMISO_data_user: out slv_4_t; -- RUSER


   
    -- slave_writeMOSI  : in  AXIWriteMOSI;
   slave_writeMOSI_address : in std_logic_vector(AXI_ADDR_WIDTH-1 downto 0); -- AWADDR
   slave_writeMOSI_address_ID : in std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --AWID
   slave_writeMOSI_protection_type : in slv_3_t; -- AWPROT
   slave_writeMOSI_address_valid : in std_logic; -- AWVALID
   slave_writeMOSI_burst_length : in slv_8_t; -- AWLEN
   slave_writeMOSI_burst_size : in slv_3_t; -- AWSIZE
   slave_writeMOSI_burst_type : in slv_2_t; -- AWBURST
   slave_writeMOSI_lock_type : in std_logic; -- AWLOCK
   slave_writeMOSI_cache_type : in slv_4_t; -- AWCACHE
   slave_writeMOSI_qos : in slv_4_t; -- AWQOS
   slave_writeMOSI_region : in slv_4_t; -- AWREGION
   slave_writeMOSI_address_user : in slv_4_t; -- AWUSER
   slave_writeMOSI_write_ID : in std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --WID
   slave_writeMOSI_data : in slv_32_t; -- WDATA
   slave_writeMOSI_data_valid : in std_logic; -- WVALID
   slave_writeMOSI_data_write_strobe : in slv_4_t; -- WSTRB
   slave_writeMOSI_last : in std_logic; -- WLAST
   slave_writeMOSI_data_user : in slv_4_t; -- WUSER
   slave_writeMOSI_ready_for_response  : in std_logic; -- BREADY

   
   -- slave_writeMISO  : out AXIWriteMISO := DefaultAXIWriteMISO;
   slave_writeMISO_ready_for_address : out std_logic; -- AWREADY
   slave_writeMISO_ready_for_data : out std_logic; -- WREADY
 
   --write response
   slave_writeMISO_response_ID : out std_logic_vector(AXI_ID_BIT_COUNT-1 downto 0); --BID
   slave_writeMISO_response_valid : out std_logic; -- BVALID
   slave_writeMISO_response : out slv_2_t; -- BRESP
   slave_writeMISO_response_user  : out slv_4_t -- BUSER

   
           
    );
end entity FM_map_vhdl_wrapper;

architecture behavioral of FM_map_vhdl_wrapper is
  signal  slave_readMOSI : AXIReadMOSI   ;
  signal  slave_readMISO  : AXIReadMISO  ;   
  signal  slave_writeMOSI : AXIWriteMOSI ;
  signal  slave_writeMISO : AXIWriteMISO ;

  signal fm_mon : FM_MON_t;
  signal fm_ctrl: FM_CTRL_t:= DEFAULT_FM_CTRL_t;
  signal fm_mon_v  : std_logic_vector(width(fm_mon) -1 downto 0);    
  signal fm_ctrl_v : std_logic_vector(width(fm_ctrl) -1 downto 0);
  signal clock_and_control : l0mdt_control_rt;
  signal ttc_commands      : l0mdt_ttc_rt;
  signal h2s_fm_data       : fm_hps_mon; --fm_rt_array(0  to total_l0mdt_sb -1);
  signal ucm_fm_mon      : fm_ucm_mon_data;   
begin  -- architecture behavioral

  --fm_mon.SB0.SB_MEM.rd_data       <= x"00000000";
  --fm_mon.SB0.SB_MEM.rd_data_valid <= fm_ctrl.SB0.SB_MEM.enable;

  --fm_mon.SB1.SB_MEM.rd_data       <= x"00000000";
  --fm_mon.SB1.SB_MEM.rd_data_valid <= fm_ctrl.SB1.SB_MEM.enable;
  clock_and_control.clk           <= clk_hs;
  clock_and_control.rst           <= reset_hs;
  fm_mon                          <= convert(fm_mon_v, fm_mon);
  fm_ctrl_v                       <= convert(fm_ctrl, fm_ctrl_v);
  
    --slave_readMOSI   : in  AXIReadMOSI;
    slave_readMOSI.address        <= slave_readMOSI_address; 
    slave_readMOSI.address_ID     <= slave_readMOSI_address_ID;
    slave_readMOSI.protection_type<= slave_readMOSI_protection_type; 
    slave_readMOSI.address_valid  <= slave_readMOSI_address_valid; 
    slave_readMOSI.burst_length   <= slave_readMOSI_burst_length; 
    slave_readMOSI.burst_size     <= slave_readMOSI_burst_size;
    slave_readMOSI.burst_type     <= slave_readMOSI_burst_type; 
    slave_readMOSI.lock_type      <= slave_readMOSI_lock_type; 
    slave_readMOSI.cache_type     <= slave_readMOSI_cache_type; 
    slave_readMOSI.qos            <= slave_readMOSI_qos; 
    slave_readMOSI.region         <= slave_readMOSI_region;
    slave_readMOSI.address_user   <= slave_readMOSI_address_user; 
    slave_readMOSI.ready_for_data <= slave_readMOSI_ready_for_data;


    --slave_readMISO   : out AXIReadMISO
    slave_readMISO_ready_for_address     <= slave_readMISO.ready_for_address   ;
    slave_readMISO_data_ID               <= slave_readMISO.data_ID             ; 
    slave_readMISO_data                  <= slave_readMISO.data                ; 
    slave_readMISO_data_valid            <= slave_readMISO.data_valid          ;
    slave_readMISO_response              <= slave_readMISO.response            ; 
    slave_readMISO_last                  <= slave_readMISO.last                ;
    slave_readMISO_data_user             <= slave_readMISO.data_user           ; 
    
    
    --slave_writeMOSI  : in  AXIWriteMOSI;
    slave_writeMOSI.address           <= slave_writeMOSI_address                 ;
    slave_writeMOSI.address_ID        <= slave_writeMOSI_address_ID              ;
    slave_writeMOSI.protection_type   <= slave_writeMOSI_protection_type         ; 
    slave_writeMOSI.address_valid     <= slave_writeMOSI_address_valid           ;
    slave_writeMOSI.burst_length      <= slave_writeMOSI_burst_length            ; 
    slave_writeMOSI.burst_size        <= slave_writeMOSI_burst_size              ;
    slave_writeMOSI.burst_type        <= slave_writeMOSI_burst_type              ; 
    slave_writeMOSI.lock_type         <= slave_writeMOSI_lock_type               ;
    slave_writeMOSI.cache_type        <= slave_writeMOSI_cache_type              ; 
    slave_writeMOSI.qos               <= slave_writeMOSI_qos                     ; 
    slave_writeMOSI.region            <= slave_writeMOSI_region                  ;
    slave_writeMOSI.address_user      <= slave_writeMOSI_address_user            ; 	
    slave_writeMOSI.write_ID             <= slave_writeMOSI_write_ID             ;
    slave_writeMOSI.data                 <= slave_writeMOSI_data                 ;
    slave_writeMOSI.data_valid           <= slave_writeMOSI_data_valid           ; 
    slave_writeMOSI.data_write_strobe    <= slave_writeMOSI_data_write_strobe    ;
    slave_writeMOSI.last                 <= slave_writeMOSI_last                 ;
    slave_writeMOSI.data_user            <= slave_writeMOSI_data_user            ; 
    slave_writeMOSI.ready_for_response   <= slave_writeMOSI_ready_for_response   ;
    
    
    --slave_writeMISO  : out AXIWriteMISO 
    slave_writeMISO_ready_for_address  <= slave_writeMISO.ready_for_address       ;  	
    slave_writeMISO_ready_for_data     <= slave_writeMISO.ready_for_data          ;
    slave_writeMISO_response_ID        <= slave_writeMISO.response_ID             ;
    slave_writeMISO_response_valid     <= slave_writeMISO.response_valid          ; 
    slave_writeMISO_response           <= slave_writeMISO.response                ; 
    slave_writeMISO_response_user      <= slave_writeMISO.response_user           ;
    
    fm_map_inst : entity ctrl_lib.FM_map
       generic map(
        ALLOCATED_MEMORY_RANGE => to_integer(AXI_RANGE_FM)
        )
      port map (
        clk_axi         => clk_axi,
        reset_axi_n     => reset_axi_n,
        slave_readmosi  => slave_readmosi,
        slave_readmiso  => slave_readmiso,
        slave_writemosi => slave_writemosi,
        slave_writemiso => slave_writemiso,

        -- monitor signals in
        mon  => fm_mon,
        -- control signals out
        Ctrl => fm_ctrl
        );


    ULT_FM : entity ult_lib.ult_fm
      port map (
        -- clock, control, and monitoring
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,
        ctrl_v            => fm_ctrl_v,
        mon_v             => fm_mon_v,
        axi_reset_n       => reset_axi_n,
        --  inputs
        h2s_fm_mon   => h2s_fm_data,
        ucm_fm_mon          => ucm_fm_mon  
--        ult_fm_data      => ult_fm_data
      );

end architecture behavioral;          

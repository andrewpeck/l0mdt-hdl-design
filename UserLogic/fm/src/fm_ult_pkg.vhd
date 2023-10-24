library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
library shared_lib;
use shared_lib.config_pkg.all;

library fm_lib;
use fm_lib.fm_common_types.all;

package fm_ult_pkg is

  --constant mon_dw_max     : integer := 256;

  --constant stations_n         : integer := 3; --DEBUG c_MAX_NUM_ST; --c_MAX_NUM_HPS; -- INN, MID, OUT
  --constant threads_n          : integer := c_NUM_THREADS;
  --constant primary_sl_n     : integer := 3;
  --constant FM_INN              : integer := 0;
  --constant FM_MID              : integer := 1;
  --constant FM_OUT             : integer := 2;
  --constant FM_EXT              : integer := 3;

  --SpyBuffers for HPS
  --constant sf_sb_n                              : integer := 3;
  --constant sf_sb_single_station_n     : integer := sf_sb_n * threads_n;
  --constant h2s_sb_single_station_n  : integer := sf_sb_single_station_n;
  --constant h2s_sb_all_station_n        : integer := h2s_sb_single_station_n * stations_n;
 

  --SpyBuffers for UCM
  --Adding SB in UCM to monitor
  --   1. Three  Candidates from primary SL (slc_rx_avt),
  --   2. Three Output SLC to inner chamber (ucm2hps)
  --   3. Three Output SLC to middle chamber (ucm2hps)
  --   4. Three Output SLC to outer chamber (ucm2hps)
  ---  5. Three UCM2PL Ouput to pipeline
  -- constant ucm_sb_n                           : integer := primary_sl_n + stations_n*threads_n + c_MAX_NUM_SL;

  --SpyBuffers for MTC
  --Adding SB in MTC to monitor
  --  1. 3 ptcalc2mtc
  --  2. 3 pl2mtc
  --  3. 3 mtc2sl
  --constant mtc_sb_n                            : integer := 3;
  
 
    
  --type fm_rt_array   is array (integer range<>) of fm_rt;
  --type fm_rt_array_v is array (integer range<>) of std_logic_vector;
  --type fm_data_avt   is array(integer range<>) of std_logic_vector(mon_dw_max+1 -1 downto 0);

  ----SF SpyBuffers
  --signal sf_mon_data :  fm_art (0 to sf_sb_n-1); --array (0 to sf_sb_n-1) of fm_rt;
  --type h2s_mon_per_station is array (0 to threads_n-1) of sf_mon_data;
  --type h2s_mon_data is array( 0 to stations_n-1) of h2s_mon_per_station;
  

  ----UCM SpyBuffers
  --type fm_ucm_slc_rx_mon is fm_rt(primary_sl_n); --array(0 to primary_sl_n-1) of fm_rt;
  --type fm_ucm2hps_station_mon  is fm_art(threads_n); --array (0 to threads_n-1) of fm_rt;
  --type fm_ucm2hps_station_a  is array (0 to stations_n-1) of fm_ucm2hps_station_mon;
  --type fm_ucm2pl_mon is fm_rt(c_MAX_NUM_SL); --array (0 to c_MAX_NUM_SL-1) of fm_rt;
  
  --type ucm_fm_mon_data is record
  --  fm_ucm_slc_rx_mon       : fm_ucm_slc_rx_mon;
  --  fm_ucm2hps_station_a  : fm_ucm2hps_station_a;
  --  fm_ucm2pl_mon             : fm_ucm2pl_mon;
  --end record ucm_fm_mon_data;

  
  --type fm_mon_data is record
  --  h2s_fm_mon_data  : h2s_mon_data; --fm_rt_array(0 to h2s_sb_all_station_n-1);
  --  ucm_fm_mon_data : ucm_fm_mon_data;   
  --end record fm_mon_data;

  
  --constant ucm_slc_rx_start : integer := h2s_sb_all_station_n;
  --constant ucm2hps_start    : integer := h2s_sb_all_station_n + primary_sl_n;
  --constant ucm2pl_start       : integer := h2s_sb_all_station_n + primary_sl_n + (stations_n * threads_n);
  --constant total_l0mdt_sb    : integer := h2s_sb_all_station_n + ucm_sb_n ;
end package fm_ult_pkg;



  

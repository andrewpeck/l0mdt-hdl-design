library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;


library project_lib;
use project_lib.prj_cfg.all;



library ctrl_lib;
use ctrl_lib.FM_CTRL.all;

library fm_lib;
use fm_lib.fm_types.all;


entity ult_fm is
  port(
   clock_and_control : in  l0mdt_control_rt;
   ttc_commands       : in  l0mdt_ttc_rt;
   axi_reset_n        : in std_logic;
   ctrl_v                      : in std_logic_vector; --FM_CTRL_t;
   mon_v                    : out std_logic_vector; --FM_MON_t;
   fm_mon                 : in fm_mon;
   fm_ucm_slc_rx_pb           : out slc_rx_avt(2 downto 0)
  
    );
  end entity ult_fm;

  architecture beh of ult_fm is



    signal ult_fm_data_avt : fm_avt;
    signal ult_fm_data        : fm_art(0  to total_l0mdt_sb-1);
    
   
    signal sf_fm_inn                 : fm_hps_sf_mon; --fm_art(0  to sf_sb_single_station_n-1);
    signal sf_fm_mid                 : fm_hps_sf_mon; --fm_art(0  to sf_sb_single_station_n-1);
    signal sf_fm_out                 : fm_hps_sf_mon; --fm_art(0  to sf_sb_single_station_n-1);
    signal sf_fm                          : fm_art(0  to h2s_sb_all_station_n-1);
    signal slc_rx_fm_data          : fm_art(0  to primary_sl_n  -1);
    signal ucm2hps_fm_data    : fm_art(0  to stations_n * threads_n -1);
    signal ucm2pl_fm_data       : fm_art(0  to c_MAX_NUM_SL -1);
   
  


    signal  fm_pb_v       : fm_pb;
    
    component fm is
      generic(
        total_l0mdt_sb : integer := total_l0mdt_sb
        );
      port(
      clk_hs : in std_logic;
      rst_hs : in std_logic;
      axi_reset_n : in std_logic;
      fm_ctrl_v     :in std_logic_vector; --FM_CTRL_t;
      fm_mon_v      : out std_logic_vector; --FM_MON_t;
      ult_fm_data_v : in fm_avt; -- fm_rt_array ( 0 to total_l0mdt_sb-1)
      fm_pb_v              : out fm_pb
        );
      end component;
    begin

     
                                                         
            FM_H2S_THREADS: for j in 0 to threads_n-1 generate
              sf_fm_inn(j)  <=  fm_mon.fm_hps_mon.fm_hps_mon_inn(j);
              sf_fm_mid(j) <=  fm_mon.fm_hps_mon.fm_hps_mon_mid(j);
              sf_fm_out(j)  <=  fm_mon.fm_hps_mon.fm_hps_mon_out(j);           
           -- FM_SF_INN_BLOCK   : for k in 0 to sf_sb_n -1 generate  
          --    sf_fm_inn(sf_sb_n *j + k) <=  fm_mon.fm_hps_mon.fm_hps_mon_inn(j*sf_sb_n + k);           
        --    end generate;
          end generate;

           FM_H2S_FLATTEN: for j in 0 to threads_n-1 generate
             FM_SF_BLOCK   : for k in 0 to sf_sb_n -1 generate
               sf_fm (j * sf_sb_n + k)                                               <= sf_fm_inn(j)(k);
               sf_fm (sf_sb_single_station_n + j * sf_sb_n + k)      <= sf_fm_mid(j)(k);
               sf_fm (sf_sb_single_station_n * 2 + j * sf_sb_n + k) <= sf_fm_out(j)(k);       
               end generate;
             end generate;
   
            FM_UCM_SLC_RX:for I in 0 to primary_sl_n -1 generate
              slc_rx_fm_data(I)  <= fm_mon.fm_ucm_mon.fm_ucm_slc_rx_mon(I);             
            end generate;

            FM_UCM2HPS_STATION:for I in 0 to  stations_n-1 generate        
              ucm2hps_fm_data(threads_n*I + 0) <= fm_mon.fm_ucm_mon.fm_ucm2hps.fm_ucm2hps_inn(0);
              ucm2hps_fm_data(threads_n*I + 1) <= fm_mon.fm_ucm_mon.fm_ucm2hps.fm_ucm2hps_mid(1);
              ucm2hps_fm_data(threads_n*I + 2) <= fm_mon.fm_ucm_mon.fm_ucm2hps.fm_ucm2hps_out(2);    
            end generate;
   

            FM_UCM2PL: for I in 0 to c_MAX_NUM_SL-1 generate
              ucm2pl_fm_data(I)  <= fm_mon.fm_ucm_mon.fm_ucm2pl_mon(I);
            end generate;

            ult_fm_data <=  sf_fm &
                         slc_rx_fm_data &
                         ucm2hps_fm_data &
                         ucm2pl_fm_data;
            --FM_PROC : process (clock_and_control.clk, clock_and_control.rst) is
            --begin
            --  if(clock_and_control.rst) then
            --    ult_fm_data <= zero(ult_fm_data);
            --  elsif (rising_edge(clock_and_control.clk)) then  -- rising clock edge
            --    ult_fm_data <= sf_fm_inn & sf_fm_mid & sf_fm_out & slc_rx_fm_data & ucm2hps_fm_data & ucm2pl_fm_data;
            --  end if;
            --end process;
          
            FM_PB_UCM_SLC_RX:for I in 0 to primary_sl_n -1 generate
              fm_ucm_slc_rx_pb(I)  <= fm_pb_v(h2s_sb_all_station_n + I)(width(fm_ucm_slc_rx_pb(I)) - 1 downto 0);             
            end generate;
 


     ult_fm_data_flatten: for sb_i in 0 to total_l0mdt_sb-1 generate     
        ult_fm_data_avt(sb_i) <= convert (ult_fm_data(sb_i), ult_fm_data_avt(sb_i));           
     end generate ult_fm_data_flatten;
     
     fm_inst : component fm
       generic map(
         total_l0mdt_sb => total_l0mdt_sb
         )
     port map (
       fm_ctrl_v       => ctrl_v,
       clk_hs          => clock_and_control.clk,
       rst_hs          => clock_and_control.rst,
       axi_reset_n     => axi_reset_n,
       fm_mon_v        => mon_v,
       ult_fm_data_v   => ult_fm_data_avt,
       fm_pb_v            => fm_pb_v
       );

    end architecture beh;

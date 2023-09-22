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
use fm_lib.fm_common_types.all;


entity ult_fm is
  port(
   clock_and_control : in  l0mdt_control_rt;
   ttc_commands       : in  l0mdt_ttc_rt;
   axi_reset_n        : in std_logic;
   ctrl_v                      : in std_logic_vector; --FM_CTRL_t;
   mon_v                    : out std_logic_vector; --FM_MON_t;
   --ult_fm_mon_data_v  : in std_logic_vector --fm_mon_data
   ucm_fm_mon        : in fm_ucm_fm_mon_data;
   ucm2hps_fm_mon: in fm_ucm2hps_station_mon( 0 to stations_n-1);
   h2s_fm_mon         : in h2s_mon_data( 0 to stations_n-1)
  
    );
  end entity ult_fm;

  architecture beh of ult_fm is
    --signal ult_fm_mon_data: fm_mon_data;
    --signal h2s_fm_mon        : h2s_mon_data;
    --signal ucm_fm_mon       : fm_ucm_fm_mon_data;
    signal ult_fm_data_avt : fm_avt(0 to total_l0mdt_sb-1);
    signal ult_fm_data        : fm_art(0  to total_l0mdt_sb-1);
    
    signal sf_fm_data                 : fm_art(0  to h2s_sb_all_station_n-1);
    signal slc_rx_fm_data          : fm_art(0  to primary_sl_n  -1);
    signal ucm2hps_fm_data    : fm_art(0  to stations_n * threads_n -1);
    signal ucm2pl_fm_data       : fm_art(0  to c_MAX_NUM_SL -1);
   
    signal sf_mon_data :  fm_art (0 to sf_sb_n-1); --array (0 to sf_sb_n-1) of fm_rt;       

    
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
      ult_fm_data_v : in fm_avt(0 to total_l0mdt_sb-1) -- fm_rt_array ( 0 to total_l0mdt_sb-1)
        );
      end component;
    begin

      FM_H2S_STATION : for I in 0 to stations_n-1 generate
          FM_H2S_THREAD: for j in 0 to threads_n-1 generate        
            FM_SF_BLOCK   : for k in 0 to sf_sb_n -1 generate  
              sf_fm_data(threads_n * sf_sb_n * I + sf_sb_n *j + k) <=  h2s_fm_mon(I)(j)(k);           
            end generate;
          end generate;
        end generate;
    
        FM_UCM_SLC_RX:for I in 0 to primary_sl_n -1 generate
               slc_rx_fm_data(I)  <= ucm_fm_mon.fm_ucm_slc_rx_mon(I);            
       end generate;

      FM_UCM2HPS_STATION:for I in 0 to  stations_n-1 generate
        FM_UCM2HPS_THREAD:for J in 0 to  threads_n-1 generate         
            ucm2hps_fm_data(threads_n*I + J) <= ucm2hps_fm_mon(I)(J);
        end generate;
      end generate;
   

        FM_UCM2PL: for I in 0 to c_MAX_NUM_SL-1 generate
          ucm2pl_fm_data(I)  <= ucm_fm_mon.fm_ucm2pl_mon(I);
        end generate;

    ult_fm_data <= sf_fm_data & slc_rx_fm_data & ucm2hps_fm_data & ucm2pl_fm_data;

                  
  --  FM_PROC : process (clock_and_control.clk) is
  --      begin
         

  --        if (rising_edge(clock_and_control.clk)) then  -- rising clock edge
  --          if index < h2s_sb_all_station_n then
  --              H2S_STATION : for I in 0 to stations_n-1 loop              
  --                H2S_THREAD: for j in 0 to threads_n-1 loop              
  --                  SF_BLOCK   : for k in 0 to sf_sb_n -1 loop            
  --                    ult_fm_data(index).fm_data <=  ult_fm_mon_data.h2s_fm_mon_data(I)(j)(k).fm_data;
  --                    ult_fm_data(index).fm_vld   <=   ult_fm_mon_data.h2s_fm_mon_data(I)(j)(k).fm_vld;
  --                    index                                     <= index+1;
  --                  end loop;
  --                end loop;
  --              end loop;
  --          else if index <  h2s_sb_all_station_n + primary_sl_n then
  --                 UCM_SLC_RX:for I in 0 to primary_sl_n -1 loop
  --                   ult_fm_data(index).fm_data  <= ult_fm_mon_data.ucm_fm_mon_data.fm_ucm_slc_rx_mon(I).fm_data;
  --                   ult_fm_data(index).fm_vld    <= ult_fm_mon_data.ucm_fm_mon_data.fm_ucm_slc_rx_mon(I).fm_vld;
  --                  end loop;
  --                 index                                     <= index + 1;
  --        end if;
  --      end if;
  --  end if; -- if (rising_edge(clock_and_control.clk))
  --end process;

    -- ult_fm_mon_data <= convert(ult_fm_mon_data_v, ult_fm_mon_data);
    
     ult_fm_data_flatten: for sb_i in 0 to total_l0mdt_sb-1 generate
      --  ult_fm_data_avt(sb_i) <= vectorify(ult_fm_data(sb_i));
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
       ult_fm_data_v   => ult_fm_data_avt
       );

    end architecture beh;

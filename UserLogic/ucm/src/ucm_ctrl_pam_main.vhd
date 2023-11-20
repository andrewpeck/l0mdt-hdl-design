--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_ctrl_pam_main.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_ctrl_pam_main.vhd
-- -----
-- File Created: Thursday, 16th November 2023 8:39:22 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Monday, 20th November 2023 9:38:08 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;

library ucm_lib;
use ucm_lib.ucm_pkg.all;

library  vamc_lib;

entity ucm_ctrl_pam_main is
  generic(
    g_PAM_CTRL_PL : integer := 2;
    g_PAM_INFO_PL : integer := 2;
    g_CVP_PL      : integer := 2
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    --
    i_num_cand          : in unsigned(3 downto 0);
    i_pam_update        : in std_logic;
    i_pam_ctrl_av       : in ucm_data2pamctrl_avt(c_NUM_ACCEPTS -1 downto 0);
    --
    o_pam_ctrl          : out ucm_pam_control_art(c_NUM_ACCEPTS -1 downto 0);
    o_pam_ctrl_dv       : out std_logic;
    -- o_proc_info_ar         : out ucm_proc_info_art(c_NUM_ACCEPTS -1 downto 0);
    o_proc_info_av      : out ucm_proc_info_avt(c_MAX_NUM_SL -1 downto 0);
    
    --
    o_cvp_rst           : out std_logic_vector(c_NUM_ACCEPTS -1 downto 0);
    o_cvp_ctrl          : out std_logic_vector(c_NUM_ACCEPTS -1 downto 0)
  );
end entity ucm_ctrl_pam_main;

architecture beh of ucm_ctrl_pam_main is

  signal int_pam_ctrl_ar    : ucm_pam_control_art(c_NUM_ACCEPTS -1 downto 0);
  signal int_proc_info_ar   : ucm_proc_info_art(c_NUM_ACCEPTS -1 downto 0);

  signal int_pam_ctrl_av  , o_pam_ctrl_av   : ucm_pam_control_avt(c_NUM_ACCEPTS -1 downto 0);
  signal int_proc_info_av : ucm_proc_info_avt(c_NUM_ACCEPTS -1 downto 0);

  signal int_cvp_rst_v           : std_logic_vector(c_NUM_ACCEPTS -1 downto 0);
  signal int_cvp_ctrl_v          : std_logic_vector(c_NUM_ACCEPTS -1 downto 0);
  
  signal ch_busy  : std_logic_vector(c_NUM_ACCEPTS -1 downto 0);

  constant proc_info_init  : ucm_proc_info_rt := ( ch => (others => '0') ,
                                                      processed => '0',
                                                      dv => '0');
  signal proc_info_ar    : ucm_proc_info_art(c_NUM_ACCEPTS -1 downto 0) := (others =>proc_info_init  );
  signal o_proc_info_ar  : ucm_proc_info_art(c_NUM_ACCEPTS -1 downto 0);
  
  type ch_count_avt is array(integer range <>) of std_logic_vector(11 downto 0);
  signal ch_count_av     : ch_count_avt(c_NUM_ACCEPTS -1 downto 0);

  signal processing   : integer;
  signal processed_s : integer;

  signal buff_pam_ctrl_ar : ucm_pam_control_art(c_NUM_ACCEPTS -1 downto 0);

begin

  -- for heg_i in c_NUM_ACCEPTS -1 downto 0 generate
  --   -- o_pam2heg.data_present(heg_i) <= 
  --   -- o_pam2heg.addr_
  -- end generate;
  int_proc_info_ar <= proc_info_ar;
  
  PAM_logic : process(rst,clk) 
    variable processed : integer := 0;
    variable busy  : integer := 0;
    begin
    if rising_edge(clk) then
      if(rst= '1') then
        int_cvp_ctrl_v <= (others => '0');
        int_cvp_rst_v <= (others => '0');

        ch_busy <= (others => '0');
        ch_count_av <= (others => (others => '0'));
        int_pam_ctrl_ar <= zero(int_pam_ctrl_ar);-- ((others => '0'),(others => (others => '0')));
        buff_pam_ctrl_ar <= zero(buff_pam_ctrl_ar);
        -- o_pam2heg <= (others =>( (others => '0') , '0') );
        proc_info_ar <= zero(proc_info_ar);-- (others =>( (others => '0') , '0') );
      else
        int_pam_ctrl_ar <= buff_pam_ctrl_ar;
        processed := 0;
        busy := 0;
        for ch_i in c_NUM_ACCEPTS -1 downto 0 loop
          proc_info_ar(ch_i).dv <= '0';
        end loop;
        for ch_i in c_NUM_ACCEPTS -1 downto 0 loop
          if ch_busy(ch_i) = '1' then
            -- proc_info_ar(c_NUM_ACCEPTS -1 - busy).ch <= (others => '0');
            -- proc_info_ar(c_NUM_ACCEPTS -1 - busy).processed <= '1';
            -- int_cvp_ctrl_v(ch_i) <= '0';
            -- processed := processed + 1;
            busy := busy + 1;
          
            if ch_count_av(ch_i) < c_HEG_PROC_TIME then -- c_MPL_PL_A_LATENCY
              ch_count_av(ch_i) <= ch_count_av(ch_i) + '1';
              buff_pam_ctrl_ar(ch_i).data_present <= '0';
              buff_pam_ctrl_ar(ch_i).addr_dest <= (others => '0');
              -- busy := busy + 1;

              -- if ch_count_av(ch_i) < (UCM_LATENCY_HPS_CH - 12)then
              if ch_count_av(ch_i) < (c_HEG_PROC_TIME - c_UCM_2HPS_LATENCY)then
                int_cvp_rst_v(ch_i) <= '0';
              else
                int_cvp_rst_v(ch_i) <= '1';
              end if;

              if ch_count_av(ch_i) < 3 then
                int_cvp_ctrl_v(ch_i) <= '1';
              else
                int_cvp_ctrl_v(ch_i) <= '0';
              end if;

            else

              ch_busy(ch_i) <= '0';
              ch_count_av(ch_i) <= (others => '0');
              -- processed := processed - 1;
            end if;
            
          else

            proc_info_ar(ch_i).processed <= '0';


            -- for uc_i in c_NUM_ACCEPTS loop
              
            -- end loop;
            
            if i_pam_update = '1' then
              
              if processed < to_integer(i_num_cand) and processed < (c_NUM_ACCEPTS - busy) then
                int_cvp_ctrl_v(ch_i) <= '1';
                buff_pam_ctrl_ar(ch_i).data_present <= '1';
                buff_pam_ctrl_ar(ch_i).addr_dest <= std_logic_vector(to_unsigned(c_NUM_ACCEPTS -1 - processed,4));
                proc_info_ar(c_NUM_ACCEPTS -1 - processed).ch <= std_logic_vector(to_unsigned(ch_i,4));
                proc_info_ar(c_NUM_ACCEPTS -1 - processed).processed <= '1';
                proc_info_ar(c_NUM_ACCEPTS -1 - processed).dv <= '1';
                ch_busy(ch_i) <= '1';
                processed := processed + 1;
              else
                -- proc_info_ar(c_NUM_ACCEPTS -1 - processed).dv <= '0';
              end if;
            else
              -- proc_info_ar(c_NUM_ACCEPTS -1 - processed).ch <= (others => '0');
              -- proc_info_ar(c_NUM_ACCEPTS -1 - processed).processed <= '0';
            end if;
          end if;
        end loop;
        processing <= processed + busy;
        processed_s <= processed ;
      end if;
    end if;
  end process;

  -- out pl

  PL_CVP_RST : entity vamc_lib.vamc_spl
      generic map(
        g_DELAY_CYCLES  => g_CVP_PL,
        g_PIPELINE_WIDTH    => int_cvp_rst_v'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        --
        i_data      => int_cvp_rst_v,
        o_data      => o_cvp_rst
    );

    PL_CVP_CTRL : entity vamc_lib.vamc_spl
      generic map(
        g_DELAY_CYCLES  => g_CVP_PL,
        g_PIPELINE_WIDTH    => int_cvp_ctrl_v'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        --
        i_data      => int_cvp_ctrl_v,
        o_data      => o_cvp_ctrl
    );

  TH_GEN: for th_i in c_NUM_ACCEPTS -1 downto 0 generate

    int_proc_info_av(th_i) <= convert(int_proc_info_ar(th_i),int_proc_info_av(th_i));
    PL_PROC_INFO : entity vamc_lib.vamc_spl
      generic map(
        g_DELAY_CYCLES  => g_PAM_INFO_PL,
        g_PIPELINE_WIDTH    => int_proc_info_av(th_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        --
        i_data      => int_proc_info_av(th_i),
        o_data      => o_proc_info_av(th_i)
    );
    o_proc_info_ar(th_i) <= convert(o_proc_info_av(th_i),o_proc_info_ar(th_i));
  
    int_pam_ctrl_av(th_i) <= convert(int_pam_ctrl_ar(th_i),int_pam_ctrl_av(th_i));
    PL_PAM_CTRL : entity vamc_lib.vamc_spl
      generic map(
        g_DELAY_CYCLES  => g_PAM_CTRL_PL,
        g_PIPELINE_WIDTH    => int_pam_ctrl_av(th_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        --
        i_data      => int_pam_ctrl_av(th_i),
        o_data      => o_pam_ctrl_av(th_i)
    );
    o_pam_ctrl(th_i) <= convert(o_pam_ctrl_av(th_i),o_pam_ctrl(th_i));

  end generate TH_GEN;

    -- o_proc_info_av <= convert(o_proc_info_ar,o_proc_info_av)
  
end architecture beh;

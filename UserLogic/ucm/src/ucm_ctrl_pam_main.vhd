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

library ieee;
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

-- use shared_lib.detector_param_pkg.all;
-- use shared_lib.detector_time_param_pkg.all;
-- use shared_lib.barrel_eta2chamber_pkg.all;

library dp_repo_lib;
use dp_repo_lib.barrel_eta2chamber_pkg.all;

library ucm_lib;
use ucm_lib.ucm_pkg.all;
use ucm_lib.ucm_vhdl_pkg.all;

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
    -- o_pam_ctrl          : out ucm_pam_control_art(c_NUM_ACCEPTS -1 downto 0);
    -- o_pam_ctrl_dv       : out std_logic;
    -- o_proc_info_ar         : out ucm_proc_info_art(c_NUM_ACCEPTS -1 downto 0);
    o_pam2tar_av      : out ucm_pam2tar_avt(c_NUM_ACCEPTS -1 downto 0);
    o_pam2cpl_av      : out ucm_proc_info_avt(c_NUM_ACCEPTS -1 downto 0);
    
    --
    o_cvp_rst           : out std_logic_vector(c_NUM_ACCEPTS -1 downto 0);
    o_cvp_ctrl          : out std_logic_vector(c_NUM_ACCEPTS -1 downto 0)
  );
end entity ucm_ctrl_pam_main;

architecture beh of ucm_ctrl_pam_main is

  constant eta_lower_lim : ucm_eta_lim_aait(0 to 3) := f_get_eta_lim_i('1');
  constant eta_upper_lim : ucm_eta_lim_aait(0 to 3) := f_get_eta_lim_i('0');

  signal num_cand : unsigned(3 downto 0);
  signal nc_dv : std_logic;

  signal i_pam_ctrl_ar       : ucm_data2pamctrl_art(c_NUM_ACCEPTS -1 downto 0);

  type b4_aut is array (integer range<>) of unsigned(3 downto 0);
  type b4_avt is array (integer range<>) of std_logic_vector(3 downto 0);
  signal max_num : b4_aut(c_NUM_ACCEPTS -1 downto 0);
  type b4_aaut is array (integer range<>) of b4_aut(c_MAX_NUM_HPS -1 downto 0);
  signal ch_l_lim_aau : b4_aaut(c_NUM_ACCEPTS -1 downto 0);
  signal ch_u_lim_aau : b4_aaut(c_NUM_ACCEPTS -1 downto 0);
  signal ch_num_aau : b4_aaut(c_NUM_ACCEPTS -1 downto 0);
  type ch_num_dvt is array (natural range<>) of std_logic_vector(c_MAX_NUM_HPS -1 downto 0);
  signal ch_lim_adv : ch_num_dvt(c_NUM_ACCEPTS -1 downto 0);
  type ch_map_avt is array (natural range<>) of std_logic_vector(c_TOTAL_MAX_NUM_HP -1 downto 0);
  type ch_map_aavt is array (natural range<>) of ch_map_avt(c_MAX_NUM_HPS -1 downto 0);
  signal ch_map_av : ch_map_aavt(c_NUM_ACCEPTS -1 downto 0);

  signal th_busy  : std_logic_vector(c_NUM_THREADS -1 downto 0);
  signal th_load  : std_logic_vector(c_NUM_THREADS -1 downto 0);
  signal th_free : integer;
  signal th_next : integer;

  signal pl0_sl_th_au : b4_aut(c_NUM_ACCEPTS -1 downto 0);
  signal pl0_sl_th_av : b4_avt(c_NUM_ACCEPTS -1 downto 0);
  signal pl0_odv : std_logic_vector(c_NUM_ACCEPTS -1 downto 0);

  signal main_count : integer;
  signal pam2tar_av : ucm_pam2tar_avt(c_NUM_ACCEPTS -1 downto 0);
  signal pam2tar_ar : ucm_pam2tar_art(c_NUM_ACCEPTS -1 downto 0);
  signal pam2cpl_ar : ucm_proc_info_art(c_NUM_ACCEPTS -1 downto 0);
  
begin

  ACCEPT_FOR_GEN: for sl_i in 0 to c_NUM_ACCEPTS - 1 generate
    signal ch_l_lim_au : b4_aut(c_MAX_NUM_HPS -1 downto 0);
    signal ch_u_lim_au : b4_aut(c_MAX_NUM_HPS -1 downto 0);
    signal ch_num_au : b4_aut(c_MAX_NUM_HPS -1 downto 0);
    signal ch_lim_dv : std_logic_vector(c_MAX_NUM_HPS -1 downto 0);
  begin
    i_pam_ctrl_ar(sl_i)<= convert(i_pam_ctrl_av(sl_i),i_pam_ctrl_ar(sl_i));
    ETA2CH_FOR_GEN : for st_i in c_MAX_NUM_HPS -1 downto 0 generate
      ST_IF_GEN : if c_ENABLED_ST(st_i) = '1' generate
        ETA2CH_ENT : entity ucm_lib.ucm_ctrl_pam_subth
          generic map(
            g_LOWER_LIM => eta_lower_lim(st_i),
            g_UPPER_LIM => eta_upper_lim(st_i)
          )
          port map(
            clk         => clk,
            rst         => rst,
            ena         => ena,
            --
            i_poseta    => i_pam_ctrl_ar(sl_i).poseta,
            i_dv        => i_pam_ctrl_ar(sl_i).data_valid,
            --
            o_num_ch    => ch_num_aau(sl_i)(st_i),
            o_min_ch    => ch_l_lim_aau(sl_i)(st_i),
            o_max_ch    => ch_u_lim_aau(sl_i)(st_i),
            o_ch_map    => ch_map_av(sl_i)(st_i),
            o_dv        => ch_lim_dv(st_i)
          );
      end generate;
    end generate;

      ch_lim_adv(sl_i)<= ch_lim_dv;

    GET_MAX_PROC : process (clk)
      variable max_num_vu : unsigned(3 downto 0);
    begin
      if rising_edge(clk) then
        if rst ='1' then
          max_num(sl_i) <= (others => '0'); 
        else
          if or_reduce(ch_lim_dv) = '1' then
            max_num_vu := x"0";
            for st_i in c_MAX_NUM_HPS -1 downto 0 loop
              if ch_num_au(st_i) > max_num_vu then
                max_num_vu := ch_num_au(st_i);
              end if;
            end loop;
            max_num(sl_i) <= max_num_vu;
          end if;
        end if;
      end if;
    end process;

  end generate;

  TH_ASS_PROC : process (clk)
    variable v_th_next : integer;
    variable v_th_free : integer;
    begin
      if rising_edge(clk) then
        if rst = '1' then
          num_cand <= x"0";
          th_free <= c_NUM_THREADS;
          th_next <= 0;
          th_load <= (others => '0');
          o_cvp_ctrl <= (others => '0');
          o_cvp_rst <= (others => '0');
          for slc_i in c_NUM_ACCEPTS - 1 downto 0 loop
            pam2cpl_ar(slc_i).dv <= '0';
            pam2cpl_ar(slc_i).th <= (others => '0') ;
            pam2cpl_ar(slc_i).processed <= '0';
          end loop;
        else
          nc_dv <= i_pam_update;
          if i_pam_update = '1' then
            num_cand <= i_num_cand;
          end if;
          for th_i in c_NUM_THREADS -1 downto 0 loop
            if th_busy(th_i) = '1' then
              th_load(th_i) <= '0';
            end if;
          end loop;
          for slc_i in c_NUM_ACCEPTS - 1 downto 0 loop -- loop possible slc
            o_cvp_ctrl(slc_i) <= '0';
            pam2cpl_ar(slc_i).dv <= '0';
          end loop;
          if nc_dv = '1' then
            if and_reduce(th_busy) = '0' then
              v_th_next := th_next;
              for slc_i in c_NUM_ACCEPTS - 1 downto 0 loop -- loop possible slc
                if th_busy(v_th_next) = '0' then
                  if c_NUM_ACCEPTS - 1 - slc_i < to_integer(num_cand) then
                    th_load(v_th_next) <= '1';
                    o_cvp_ctrl(slc_i) <= '1';
                    pl0_sl_th_au(slc_i)<= to_unsigned(v_th_next,4);
                    pam2cpl_ar(slc_i).dv <= '1';
                    pam2cpl_ar(slc_i).th <= std_logic_vector(to_unsigned(v_th_next,4));
                    pam2cpl_ar(slc_i).processed <= '1';
                    if v_th_next = c_NUM_THREADS -1 then
                      v_th_next := 0;
                    else
                      v_th_next := v_th_next + 1;
                    end if;
                  end if;
                end if;
              end loop;
              th_next <= v_th_next;
            end if;
          end if;
        end if;
      end if;
    end process;

  process (clk)
    begin
      if rising_edge(clk) then
        if rst='1' then
          main_count <= c_TOTAL_THREAD_USAGE_LATENCY;
        else
          if main_count = 0 then
            main_count <= c_TOTAL_THREAD_USAGE_LATENCY;
          else
            main_count <= main_count - 1;
          end if;
        end if;
      end if;
    end process;

  TH_CTRL_FOR_GEN : for th_i in c_NUM_THREADS -1 downto 0 generate
    TH_CTRL : entity ucm_lib.ucm_ctrl_pam_m_th
      port map(
        clk                 => clk,
        rst                 => rst,
        ena                 => ena,
        --
        i_main_count_i      => main_count,
        i_load              => th_load(th_i),
        -- i_slc               => th_cvp(th_i),
        --
        o_busy          => th_busy(th_i) 
      );  
  end generate;
  
  PL_TH : for sl_i in c_NUM_ACCEPTS - 1 downto 0 generate
    PL_slope : entity vamc_lib.vamc_spl
      generic map(
        g_DELAY_CYCLES    => 4,
        g_PIPELINE_WIDTH  => pl0_sl_th_au(sl_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        --
        i_data      => std_logic_vector(pl0_sl_th_au(sl_i)),
        i_dv        => o_cvp_ctrl(sl_i),
        o_data      => pl0_sl_th_av(sl_i),
        o_dv        => pl0_odv(sl_i)
      );
  end generate;

  PAM_OUT_PROC : process (clk)
  begin
    if rising_edge(clk) then
      if rst='1' then
        for sl_i in  c_NUM_ACCEPTS - 1 downto 0  loop
          pam2tar_ar(sl_i).ch_map <= (others => (others => '0'));
          pam2tar_ar(sl_i).th <= (others => '0') ;
          pam2tar_ar(sl_i).action <= (others => '0') ;
          pam2tar_ar(sl_i).dv <= '0';
        end loop;
      else
        for sl_i in  c_NUM_ACCEPTS - 1 downto 0  loop
          if or_reduce(ch_lim_adv(sl_i)) = '1' then
            for st_i in  c_MAX_POSSIBLE_HPS - 1 downto 0  loop
              pam2tar_ar(sl_i).th <= unsigned(pl0_sl_th_av(sl_i));
              pam2tar_ar(sl_i).action <= x"1";
              pam2tar_ar(sl_i).dv <= '1';
              
              if c_ENABLED_ST(st_i) = '1'then
                pam2tar_ar(sl_i).ch_map(st_i) <= ch_map_av(sl_i)(st_i);
              else
                pam2tar_ar(sl_i).ch_map(st_i) <= (others => '0');
              end if;
            end loop;
          else
            pam2tar_ar(sl_i).dv <= '0';
            -- pam2tar_ar(sl_i).th <= (others => '0') ;
            -- pam2tar_ar(sl_i).action <= (others => '0') ;
          end if;
        end loop;
      end if;
    end if;
  end process;



  OUT2TAR_GEN : for sl_i in c_NUM_ACCEPTS - 1 downto 0 generate
    o_pam2tar_av(sl_i) <= convert(pam2tar_ar(sl_i),o_pam2tar_av(sl_i));
    o_pam2cpl_av(sl_i) <= convert(pam2cpl_ar(sl_i),o_pam2cpl_av(sl_i));
  end generate;
    
  
end architecture;
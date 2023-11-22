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

  constant eta_lower_lim : ucm_eta_lim_aait(0 to 3) := f_get_eta_lim_i('1');
  constant eta_upper_lim : ucm_eta_lim_aait(0 to 3) := f_get_eta_lim_i('0');

  signal num_cand : unsigned(3 downto 0);
  signal nc_dv : std_logic;

  signal i_pam_ctrl_ar       : ucm_data2pamctrl_art(c_NUM_ACCEPTS -1 downto 0);
  type ch_lim_aut is array (integer range<>) of unsigned(3 downto 0);
  signal max_num : ch_lim_aut(c_NUM_ACCEPTS -1 downto 0);
  -- signal ch_l_lim_au : ch_lim_aut(5 downto 0);
  -- signal ch_u_lim_au : ch_lim_aut(5 downto 0);
  -- signal ch_lim_dv : std_logic_vector(5 downto 0);
  signal th_busy  : std_logic_vector(c_NUM_THREADS -1 downto 0);
  signal th_load  : std_logic_vector(c_NUM_THREADS -1 downto 0);
  signal th_free : integer;
  signal th_next : integer;
  type th_time_org_ait is array (c_NUM_THREADS -1 downto 0) of integer;
  signal th_time_org_ai : th_time_org_ait;

  signal sth_busy  : std_logic_vector(c_NUM_SUBTHREADS -1 downto 0);

  signal main_count : integer;

---------------------------------------
  
  signal int_pam_ctrl_ar    : ucm_pam_control_art(c_NUM_ACCEPTS -1 downto 0);
  signal int_proc_info_ar   : ucm_proc_info_art(c_NUM_ACCEPTS -1 downto 0);

  signal int_pam_ctrl_av  , o_pam_ctrl_av   : ucm_pam_control_avt(c_NUM_ACCEPTS -1 downto 0);
  signal int_proc_info_av : ucm_proc_info_avt(c_NUM_ACCEPTS -1 downto 0);

  signal int_cvp_rst_v           : std_logic_vector(c_NUM_ACCEPTS -1 downto 0);
  signal int_cvp_ctrl_v          : std_logic_vector(c_NUM_ACCEPTS -1 downto 0);
  
  -- signal ch_busy  : std_logic_vector(c_NUM_ACCEPTS -1 downto 0);

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

  ACCEPT_FOR_GEN: for sl_i in 0 to c_NUM_ACCEPTS - 1 generate
    signal ch_l_lim_au : ch_lim_aut(5 downto 0);
    signal ch_u_lim_au : ch_lim_aut(5 downto 0);
    signal ch_num_au : ch_lim_aut(5 downto 0);
    signal ch_lim_dv : std_logic_vector(5 downto 0);
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
            o_num_ch    => ch_num_au(st_i),
            o_min_ch    => ch_l_lim_au(st_i),
            o_max_ch    => ch_u_lim_au(st_i),
            o_dv        => ch_lim_dv(st_i)
          );
      end generate;
    end generate;

    GET_MAX_PROC : process (clk)
      variable max_num_vu : unsigned(3 downto 0);
    begin
      if rising_edge(clk) then
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
          for slc_i in 0 to c_NUM_ACCEPTS - 1 loop -- loop possible slc
            o_cvp_ctrl(slc_i) <= '0';
          end loop;
          if nc_dv = '1' then
            if and_reduce(th_busy) = '0' then
              v_th_next := th_next;
              v_th_free := th_free;
              for slc_i in 0 to c_NUM_ACCEPTS - 1 loop -- loop possible slc
                -- if v_th_free > 0 then
                if th_busy(v_th_next) = '0' then
                  if slc_i < to_integer(num_cand) then
                    th_load(v_th_next) <= '1';
                    o_cvp_ctrl(slc_i) <= '1';
                    v_th_free := v_th_free - 1;
                    if v_th_next = c_NUM_THREADS -1 then
                      v_th_next := 0;
                    else
                      v_th_next := v_th_next + 1;
                    end if;
                  end if;
                end if;
              end loop;
              th_next <= v_th_next;
              th_free <= v_th_free;
            end if;
          end if;
          -- if and_reduce(th_busy) = '0' then -- not all busy
          --   -- for th_i in c_NUM_THREADS -1 downto 0 loop
          --   --   if th_load(th_i) = '1' then
          --   --     th_load(th_i) <= '0';
          --   --   end if;
          --   -- end loop;
          --   -- for slc_i in 0 to c_NUM_ACCEPTS - 1 loop -- loop possible slc
          --   --   if slc_i < to_integer(num_cand) then
          --   --     for th_i in c_NUM_THREADS -1 downto 0 loop
          --   --       if th_busy(th_i) = '0' then
                    
          --   --       end if;
          --   --     end loop;
          --   --   end if;
          --   -- end loop;
          -- end if;
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
    process (clk)
    begin
      if rising_edge(clk) then
        if rst='1' then
          th_busy(th_i) <= '0';
          th_time_org_ai(th_i) <= 0;
        else
          if th_busy(th_i) = '1' then
          else
            if th_load(th_i) = '1' then 
              th_busy(th_i) <= '1';
              th_time_org_ai(th_i) <= main_count;
            end if;
          end if;
       
          
        end if;
      end if;
    end process;
  end generate;
    

  











  --   -- o_proc_info_av <= convert(o_proc_info_ar,o_proc_info_av)

  -- -- for heg_i in c_NUM_ACCEPTS -1 downto 0 generate
  -- --   -- o_pam2heg.data_present(heg_i) <= 
  -- --   -- o_pam2heg.addr_
  -- -- end generate;
  -- int_proc_info_ar <= proc_info_ar;
  
  -- PAM_logic : process(rst,clk) 
  --   variable processed : integer := 0;
  --   variable busy  : integer := 0;
  --   begin
  --   if rising_edge(clk) then
  --     if(rst= '1') then
  --       int_cvp_ctrl_v <= (others => '0');
  --       int_cvp_rst_v <= (others => '0');

  --       ch_busy <= (others => '0');
  --       ch_count_av <= (others => (others => '0'));
  --       int_pam_ctrl_ar <= zero(int_pam_ctrl_ar);-- ((others => '0'),(others => (others => '0')));
  --       buff_pam_ctrl_ar <= zero(buff_pam_ctrl_ar);
  --       -- o_pam2heg <= (others =>( (others => '0') , '0') );
  --       proc_info_ar <= zero(proc_info_ar);-- (others =>( (others => '0') , '0') );
  --     else
  --       int_pam_ctrl_ar <= buff_pam_ctrl_ar;
  --       processed := 0;
  --       busy := 0;
  --       for ch_i in c_NUM_ACCEPTS -1 downto 0 loop
  --         proc_info_ar(ch_i).dv <= '0';
  --       end loop;
  --       for ch_i in c_NUM_ACCEPTS -1 downto 0 loop
  --         if ch_busy(ch_i) = '1' then
  --           -- proc_info_ar(c_NUM_ACCEPTS -1 - busy).ch <= (others => '0');
  --           -- proc_info_ar(c_NUM_ACCEPTS -1 - busy).processed <= '1';
  --           -- int_cvp_ctrl_v(ch_i) <= '0';
  --           -- processed := processed + 1;
  --           busy := busy + 1;
          
  --           if ch_count_av(ch_i) < c_HEG_PROC_TIME then -- c_MPL_PL_A_LATENCY
  --             ch_count_av(ch_i) <= ch_count_av(ch_i) + '1';
  --             buff_pam_ctrl_ar(ch_i).data_present <= '0';
  --             buff_pam_ctrl_ar(ch_i).addr_dest <= (others => '0');
  --             -- busy := busy + 1;

  --             -- if ch_count_av(ch_i) < (UCM_LATENCY_HPS_CH - 12)then
  --             if ch_count_av(ch_i) < (c_HEG_PROC_TIME - c_UCM_2HPS_LATENCY)then
  --               int_cvp_rst_v(ch_i) <= '0';
  --             else
  --               int_cvp_rst_v(ch_i) <= '1';
  --             end if;

  --             if ch_count_av(ch_i) < 3 then
  --               int_cvp_ctrl_v(ch_i) <= '1';
  --             else
  --               int_cvp_ctrl_v(ch_i) <= '0';
  --             end if;

  --           else

  --             ch_busy(ch_i) <= '0';
  --             ch_count_av(ch_i) <= (others => '0');
  --             -- processed := processed - 1;
  --           end if;
            
  --         else

  --           proc_info_ar(ch_i).processed <= '0';


  --           -- for uc_i in c_NUM_ACCEPTS loop
              
  --           -- end loop;
            
  --           if i_pam_update = '1' then
              
  --             if processed < to_integer(i_num_cand) and processed < (c_NUM_ACCEPTS - busy) then
  --               int_cvp_ctrl_v(ch_i) <= '1';
  --               buff_pam_ctrl_ar(ch_i).data_present <= '1';
  --               buff_pam_ctrl_ar(ch_i).addr_dest <= std_logic_vector(to_unsigned(c_NUM_ACCEPTS -1 - processed,4));
  --               proc_info_ar(c_NUM_ACCEPTS -1 - processed).ch <= std_logic_vector(to_unsigned(ch_i,4));
  --               proc_info_ar(c_NUM_ACCEPTS -1 - processed).processed <= '1';
  --               proc_info_ar(c_NUM_ACCEPTS -1 - processed).dv <= '1';
  --               ch_busy(ch_i) <= '1';
  --               processed := processed + 1;
  --             else
  --               -- proc_info_ar(c_NUM_ACCEPTS -1 - processed).dv <= '0';
  --             end if;
  --           else
  --             -- proc_info_ar(c_NUM_ACCEPTS -1 - processed).ch <= (others => '0');
  --             -- proc_info_ar(c_NUM_ACCEPTS -1 - processed).processed <= '0';
  --           end if;
  --         end if;
  --       end loop;
  --       processing <= processed + busy;
  --       processed_s <= processed ;
  --     end if;
  --   end if;
  -- end process;

  -- -- out pl

  -- PL_CVP_RST : entity vamc_lib.vamc_spl
  --     generic map(
  --       g_DELAY_CYCLES  => g_CVP_PL,
  --       g_PIPELINE_WIDTH    => int_cvp_rst_v'length
  --     )
  --     port map(
  --       clk         => clk,
  --       rst         => rst,
  --       ena         => ena,
  --       --
  --       i_data      => int_cvp_rst_v,
  --       o_data      => o_cvp_rst
  --   );

  --   PL_CVP_CTRL : entity vamc_lib.vamc_spl
  --     generic map(
  --       g_DELAY_CYCLES  => g_CVP_PL,
  --       g_PIPELINE_WIDTH    => int_cvp_ctrl_v'length
  --     )
  --     port map(
  --       clk         => clk,
  --       rst         => rst,
  --       ena         => ena,
  --       --
  --       i_data      => int_cvp_ctrl_v,
  --       o_data      => o_cvp_ctrl
  --   );

  -- TH_GEN: for th_i in c_NUM_ACCEPTS -1 downto 0 generate

  --   int_proc_info_av(th_i) <= convert(int_proc_info_ar(th_i),int_proc_info_av(th_i));
  --   PL_PROC_INFO : entity vamc_lib.vamc_spl
  --     generic map(
  --       g_DELAY_CYCLES  => g_PAM_INFO_PL,
  --       g_PIPELINE_WIDTH    => int_proc_info_av(th_i)'length
  --     )
  --     port map(
  --       clk         => clk,
  --       rst         => rst,
  --       ena         => ena,
  --       --
  --       i_data      => int_proc_info_av(th_i),
  --       o_data      => o_proc_info_av(th_i)
  --   );
  --   o_proc_info_ar(th_i) <= convert(o_proc_info_av(th_i),o_proc_info_ar(th_i));
  
  --   int_pam_ctrl_av(th_i) <= convert(int_pam_ctrl_ar(th_i),int_pam_ctrl_av(th_i));
  --   PL_PAM_CTRL : entity vamc_lib.vamc_spl
  --     generic map(
  --       g_DELAY_CYCLES  => g_PAM_CTRL_PL,
  --       g_PIPELINE_WIDTH    => int_pam_ctrl_av(th_i)'length
  --     )
  --     port map(
  --       clk         => clk,
  --       rst         => rst,
  --       ena         => ena,
  --       --
  --       i_data      => int_pam_ctrl_av(th_i),
  --       o_data      => o_pam_ctrl_av(th_i)
  --   );
  --   o_pam_ctrl(th_i) <= convert(o_pam_ctrl_av(th_i),o_pam_ctrl(th_i));

  -- end generate TH_GEN;

  --   -- o_proc_info_av <= convert(o_proc_info_ar,o_proc_info_av)
  
end architecture beh;

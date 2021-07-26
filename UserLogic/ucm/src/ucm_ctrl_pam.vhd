--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: PAM control
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
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

entity ucm_ctrl_pam is
  generic(
    g_PAM_CTRL_PL : integer := 2;
    g_PAM_INFO_PL : integer := 2;
    g_CVP_PL      : integer := 2
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena             : in std_logic;
    --
    i_num_cand          : in unsigned(3 downto 0);
    i_pam_update        : in std_logic;
    --
    o_pam_ctrl          : out ucm_pam_control_at(c_NUM_THREADS -1 downto 0);
    o_proc_info         : out ucm_proc_info_at(c_NUM_THREADS -1 downto 0);
    --
    o_cvp_rst           : out std_logic_vector(c_NUM_THREADS -1 downto 0);
    o_cvp_ctrl          : out std_logic_vector(c_NUM_THREADS -1 downto 0)
  );
end entity ucm_ctrl_pam;

architecture beh of ucm_ctrl_pam is

  signal int_pam_ctrl_r    : ucm_pam_control_at(c_NUM_THREADS -1 downto 0);
  signal int_proc_info_r   : ucm_proc_info_at(c_NUM_THREADS -1 downto 0);

  signal int_pam_ctrl_v  , o_pam_ctrl_v   : ucm_pam_control_avt(c_NUM_THREADS -1 downto 0);
  signal int_proc_info_v , o_proc_info_v  : ucm_proc_info_avt(c_NUM_THREADS -1 downto 0);

  signal int_cvp_rst           : std_logic_vector(c_NUM_THREADS -1 downto 0);
  signal int_cvp_ctrl          : std_logic_vector(c_NUM_THREADS -1 downto 0);
  
  signal ch_busy  : std_logic_vector(c_NUM_THREADS -1 downto 0);

  signal proc_info  : ucm_proc_info_at(c_NUM_THREADS -1 downto 0) := (others =>( (others => '0') , '0') );
  
  type ch_count_avt is array(integer range <>) of std_logic_vector(11 downto 0);
  signal ch_count     : ch_count_avt(c_NUM_THREADS -1 downto 0);

  signal processing   : integer;
  signal processed_s : integer;

  signal buff_pam_ctrl : ucm_pam_control_at(c_NUM_THREADS -1 downto 0);

begin

  -- for heg_i in c_NUM_THREADS -1 downto 0 generate
  --   -- o_pam2heg.data_present(heg_i) <= 
  --   -- o_pam2heg.addr_
  -- end generate;
  int_proc_info_r <= proc_info;
  
  PAM_logic : process(rst,clk) 
    variable processed : integer := 0;
    variable busy  : integer := 0;
    begin

    if rising_edge(clk) then
      if(rst= '1') then
        int_cvp_ctrl <= (others => '0');
        int_cvp_rst <= (others => '0');

        ch_busy <= (others => '0');
        ch_count <= (others => (others => '0'));
        int_pam_ctrl_r <= nullify(int_pam_ctrl_r);-- ((others => '0'),(others => (others => '0')));
        buff_pam_ctrl <= nullify(buff_pam_ctrl);
        -- o_pam2heg <= (others =>( (others => '0') , '0') );
        proc_info <= nullify(proc_info);-- (others =>( (others => '0') , '0') );
        
      else

        int_pam_ctrl_r <= buff_pam_ctrl;

        processed := 0;
        busy := 0;

        for ch_i in c_NUM_THREADS -1 downto 0 loop
          if ch_busy(ch_i) = '1' then
            -- proc_info(c_NUM_THREADS -1 - busy).ch <= (others => '0');
            -- proc_info(c_NUM_THREADS -1 - busy).processed <= '1';
            -- int_cvp_ctrl(ch_i) <= '0';
            -- processed := processed + 1;
            busy := busy + 1;
          
            if ch_count(ch_i) < c_HEG_PROC_TIME then -- c_MPL_PL_A_LATENCY
              ch_count(ch_i) <= ch_count(ch_i) + '1';
              buff_pam_ctrl(ch_i).data_present <= '0';
              buff_pam_ctrl(ch_i).addr_orig <= (others => '0');
              -- busy := busy + 1;

              -- if ch_count(ch_i) < (UCM_LATENCY_HPS_CH - 12)then
              if ch_count(ch_i) < (c_HEG_PROC_TIME - c_UCM_2HPS_LATENCY)then
                int_cvp_rst(ch_i) <= '0';
              else
                int_cvp_rst(ch_i) <= '1';
              end if;

              if ch_count(ch_i) < 3 then
                int_cvp_ctrl(ch_i) <= '1';
              else
                int_cvp_ctrl(ch_i) <= '0';
              end if;

            else

              ch_busy(ch_i) <= '0';
              ch_count(ch_i) <= (others => '0');
              -- processed := processed - 1;
            end if;
            
          else

            -- for uc_i in c_NUM_THREADS loop
              
            -- end loop;
            
            if i_pam_update = '1' then
              
              if processed < to_integer(i_num_cand) and processed < (c_NUM_THREADS - busy) then
                int_cvp_ctrl(ch_i) <= '1';
                buff_pam_ctrl(ch_i).data_present <= '1';
                buff_pam_ctrl(ch_i).addr_orig <= std_logic_vector(to_unsigned(c_NUM_THREADS -1 - processed,4));
                proc_info(c_NUM_THREADS -1 - processed).ch <= std_logic_vector(to_unsigned(ch_i,4));
                proc_info(c_NUM_THREADS -1 - processed).processed <= '1';
                ch_busy(ch_i) <= '1';
                processed := processed + 1;
              else
              end if;
            else
              -- proc_info(c_NUM_THREADS -1 - processed).ch <= (others => '0');
              -- proc_info(c_NUM_THREADS -1 - processed).processed <= '0';
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
        g_PIPELINE_WIDTH    => int_cvp_rst'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        --
        i_data      => int_cvp_rst,
        o_data      => o_cvp_rst
    );

    PL_CVP_CTRL : entity vamc_lib.vamc_spl
      generic map(
        g_DELAY_CYCLES  => g_CVP_PL,
        g_PIPELINE_WIDTH    => int_cvp_ctrl'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        --
        i_data      => int_cvp_ctrl,
        o_data      => o_cvp_ctrl
    );

  TH_GEN: for th_i in c_NUM_THREADS -1 downto 0 generate

    int_proc_info_v(th_i) <= vectorify(int_proc_info_r(th_i));
    PL_PROC_INFO : entity vamc_lib.vamc_spl
      generic map(
        g_DELAY_CYCLES  => g_PAM_INFO_PL,
        g_PIPELINE_WIDTH    => int_proc_info_v(th_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        --
        i_data      => int_proc_info_v(th_i),
        o_data      => o_proc_info_v(th_i)
    );
    o_proc_info(th_i) <= structify(o_proc_info_v(th_i));
  
    int_pam_ctrl_v(th_i) <= vectorify(int_pam_ctrl_r)(th_i);
    PL_PAM_CTRL : entity vamc_lib.vamc_spl
      generic map(
        g_DELAY_CYCLES  => g_PAM_CTRL_PL,
        g_PIPELINE_WIDTH    => int_pam_ctrl_v(th_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        --
        i_data      => int_pam_ctrl_v(th_i),
        o_data      => o_pam_ctrl_v(th_i)
    );
    o_pam_ctrl(th_i) <= structify(o_pam_ctrl_v(th_i));

  end generate TH_GEN;
  
end architecture beh;

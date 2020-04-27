--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc Control Sorting algorithm + PAM
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
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_ctrl is
  -- generic(
  --   num_delays          : integer; 
  --   num_bits            : integer
  -- );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    --
    i_data              : in ucm_prepro_avt(MAX_NUM_SL -1 downto 0);
    --
    o_csw_ctrl          : out ucm_csw_control_rt;
    o_pam_ctrl          : out ucm_pam_control_rt;
    o_proc_info         : out ucm_proc_info_art(MAX_NUM_HEG -1 downto 0);
    o_cvp_ctrl          : out std_logic_vector(MAX_NUM_HEG -1 downto 0);
    o_pam2heg           : out ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0)    
  );
end entity ucm_ctrl;

architecture beh of ucm_ctrl is

  type alg_status_t is (
		ALG_IDLE, ALG_RUN, ALG_SET
  );
  signal alg_status   : alg_status_t;

  signal data_ar      : ucm_prepro_art(MAX_NUM_SL -1 downto 0);

  signal input_valids : std_logic_vector(MAX_NUM_SL -1 downto 0);

  signal num_cand     : unsigned(3 downto 0);
  signal pam_update   : std_logic;

  signal ch_busy      : std_logic_vector(MAX_NUM_HEG -1 downto 0);
  signal ch_count     : ch_count_avt(MAX_NUM_HEG -1 downto 0);

begin

  pre_op: for sl_i in MAX_NUM_SL -1 downto 0 generate
    data_ar(sl_i) <= recordify(i_data(sl_i));
    input_Valids(sl_i) <= data_ar(sl_i).data_valid;
  end generate;

  Ctrl_logic : process(Reset_b,clk) 
    variable sl_i : integer := 0;
    variable pl_o : integer := 0;
    -- variable order : integer(MAX_NUM_SL -1 downto 0);
  begin

    if Reset_b = '0' then
      alg_Status <= ALG_IDLE;
      o_csw_ctrl <= ((others => '0'), (others => ( others => '0')));
      pam_update <= '0';
    elsif rising_edge(clk) then
      
      case alg_status is
        when ALG_IDLE =>
          if or_reduce(input_Valids) = '1' then
            -- here goes the algorithm
            o_csw_ctrl <= ((others => '0'), (others => ( others => '0')));
            pl_o := 0;
            pam_update <= '0';
            alg_Status <= ALG_RUN;
          end if;
        when ALG_RUN =>
          
          if  ENABLE_NEIGHTBORS = '1' then -- with neigbors
            if (ST_nBARREL_ENDCAP and ENDCAP_nSMALL_LARGE) = '0' then -- 3+1+1
              -- barrel or small endcap
              if data_ar(MAX_NUM_SL - 2 - pl_o).data_valid = '1' then -- x1xxx
                o_csw_ctrl.data_present(MAX_NUM_SL - 1 - pl_o) <= '1';
                o_csw_ctrl.addr_orig(MAX_NUM_SL - 1 - pl_o) <= std_logic_vector(to_unsigned(MAX_NUM_SL - 2 - pl_o,4));
                pl_o := pl_o + 1;
              end if;
              if data_ar(MAX_NUM_SL - 2 - pl_o).data_valid = '1' then -- xx1xx
                o_csw_ctrl.data_present(MAX_NUM_SL - 1 - pl_o) <= '1';
                o_csw_ctrl.addr_orig(MAX_NUM_SL - 1 - pl_o) <= std_logic_vector(to_unsigned(MAX_NUM_SL - 2 - pl_o,4));
                pl_o := pl_o + 1;
              end if;
              if data_ar(MAX_NUM_SL - 2 - pl_o).data_valid = '1' then -- xxx1x
                o_csw_ctrl.data_present(MAX_NUM_SL - 1 - pl_o) <= '1';
                o_csw_ctrl.addr_orig(MAX_NUM_SL - 1 - pl_o) <= std_logic_vector(to_unsigned(MAX_NUM_SL - 2 - pl_o,4));
                pl_o := pl_o + 1;
              end if;
            else 
              -- large endcap
            end if;
            if data_ar(MAX_NUM_SL - 1).data_valid = '1' then -- xxx1x
              o_csw_ctrl.data_present(MAX_NUM_SL - 1 - pl_o) <= '1';
              o_csw_ctrl.addr_orig(MAX_NUM_SL - 1 - pl_o) <= std_logic_vector(to_unsigned(MAX_NUM_SL - 1,4));
              pl_o := pl_o + 1;
            end if;
            if data_ar(0).data_valid = '1' then -- xxx1x
              o_csw_ctrl.data_present(MAX_NUM_SL - 1 - pl_o) <= '1';
              o_csw_ctrl.addr_orig(MAX_NUM_SL - 1 - pl_o) <= std_logic_vector(to_unsigned(0,4));
              pl_o := pl_o + 1;
            end if;
            
          
          else -- without neighbors  
          end if;
          num_cand <= to_unsigned(pl_o,4);
          if pl_o > 0 then 
            pam_update <= '1';
          end if;
          alg_Status <= ALG_SET;
        when ALG_SET =>

          alg_Status <= ALG_IDLE;
      end case;
      
    end if;

  end process;
  -- ---------------------
  --  PAM
  -- ---------------------
  PAM_logic : process(Reset_b,clk) 
    variable processed : integer := 0;
  begin

    if(Reset_b = '0') then
      ch_busy <= (others => '0');
      ch_count <= (others => (others => '0'));
      o_pam_ctrl <= ((others => '0'),(others => (others => '0')));
      o_pam2heg <= (others =>( (others => '0') , '0') );
      o_proc_info <= (others =>( (others => '0') , '0') );
    elsif rising_edge(clk) then
      
      for ch_i in MAX_NUM_HEG -1 downto 0 loop
        if ch_busy(ch_i) = '1' then
          if ch_count(ch_i) < LATENCY_HPS_CH then
            ch_count(ch_i) <= ch_count(ch_i) + '1';
            o_pam_ctrl.data_present(ch_i) <= '0';
          else
            ch_count(ch_i) <= (others => '0');
            ch_busy(ch_i) <= '0';
          end if;
          
        else
          if pam_update = '1' then
            if processed < to_integer(num_cand) then
              o_pam_ctrl.data_present(ch_i) <= '1';
              o_pam_ctrl.addr_orig(ch_i) <= std_logic_vector(to_unsigned(MAX_NUM_HEG -1 - processed,4));
              o_proc_info(MAX_NUM_HEG -1 - processed).ch <= std_logic_vector(to_unsigned(ch_i,4));
              o_proc_info(MAX_NUM_HEG -1 - processed).processed <= '1';
              ch_busy(ch_i) <= '1';
            end if;
          end if;
        end if;
        processed := processed + 1;
      end loop;

    end if;

  end process;

end beh;
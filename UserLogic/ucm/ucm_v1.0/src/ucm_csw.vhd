--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc data Cross switch
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_csw is
  -- generic(
  --   g_DELAY_CYCLES          : integer; 
  --   num_bits            : integer
  -- );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_control_av        : in ucm_csw_control_avt(c_MAX_NUM_SL -1 downto 0);
    --
    i_data_av           : in slc_rx_avt(c_MAX_NUM_SL -1 downto 0);
    i_dv                : in std_logic;
    o_data_av           : out slc_rx_avt(c_MAX_NUM_SL -1 downto 0);
    o_dv                : out std_logic
  );
end entity ucm_csw;

architecture beh of ucm_csw is
  signal control_ar : ucm_csw_control_art(c_MAX_NUM_SL -1 downto 0);
  
  -- signal o_data_ar : slc_rx_art(c_MAX_NUM_SL -1 downto 0);
  -- signal i_data_ar : slc_rx_art(c_MAX_NUM_SL -1 downto 0);

begin
  
  -- control_ar <= convert(i_control_av,control_ar);

  SL_LOOP: for sli in c_MAX_NUM_SL -1 downto 0 generate

    control_ar(sli) <= convert(i_control_av(sli),control_ar(sli));


    -- i_data_ar(sli) <= convert(i_data_av(sli),i_data_ar(sli));
    -- o_data_av(sli) <= convert(o_data_ar(sli),o_data_av(sli));

  end generate;
  -- SL_LOOP2: for sli in c_MAX_NUM_SL -1 downto 0 generate

    UCM_MAIN_CSW : process(rst,clk) begin
      if rising_edge(clk) then
        if(rst= '1') then
          o_data_av <= (others => (others => '0'));
          -- o_data_ar(sli).data_valid <= '0';-- (others => '0');
          -- o_data_av  <= zero(o_data_ar);
          o_dv <= '0';
        else
          if i_dv = '1' then
            for sli in c_MAX_NUM_SL -1 downto 0 loop
              if control_ar(sli).data_present = '1' then
                o_data_av(to_integer(unsigned(control_ar(sli).addr_dest))) <= i_data_av(sli);
                -- o_data_ar(sli) <= i_data_ar(to_integer(unsigned(control_ar(sli).addr_dest)));
              -- else
              --   o_data_ar(sli).data_valid <= '0';-- (others => '0');
                -- o_data_ar(sli) <= zero(o_data_ar(sli));
                -- o_data_av <= (others => (others => '0'));
              end if;
            end loop;
            o_dv <= '1';
          else
            o_data_av <= (others => (others => '0'));
            o_dv <= '0';

            -- o_data_ar  <= zero(o_data_ar);
            -- for csw_i in c_MAX_NUM_SL -1 downto 0 loop
            --     o_data_ar(to_integer(unsigned(control_ar(sli).addr_dest))) <= (others => '0');
            -- end loop;
          end if;
        end if;
      end if;
    end process;




  -- end generate ;

  -- UCM_MAIN_CSW : process(rst,clk) begin
  --   if rising_edge(clk) then
  --     if(rst= '1') then
  --       -- o_data_av <= (others => (others => '0'));
        
  --     else
  --       for csw_i in c_MAX_NUM_SL -1 downto 0 loop
  --         if control_ar(csw_i).data_present = '1' then
  --           o_data_ar(csw_i) <= i_data_av_integer(unsigned(control_ar(csw_i).addr_dest)));
  --         else
  --           o_data_ar(csw_i) <= (others => '0');
  --         end if;
  --       end loop;
  --     end if;
  --   end if;
  -- end process;
end beh;
























--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: heg_bm_ctrl.vhd
-- Module: <<moduleName>>
-- File PATH: /heg_bm_ctrl.vhd
-- -----
-- File Created: Friday, 28th October 2022 10:43:40 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Friday, 28th October 2022 10:51:45 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
-- use shared_lib.detector_param_pkg.all;

library vamc_lib;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
use heg_lib.heg_custom_pkg.all;

entity heg_bm_ctrl is
  generic(
    g_NUM_CH    : integer := 6
   );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;

    i_fifo_empty        : in std_logic_vector(g_NUM_CH-1 downto 0);
    i_fifo_used         : in fifo_used_ait(g_HPS_NUM_MDT_CH -1 downto 0);
    o_fifo_rd           : out std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
    
  );
end entity heg_bm_ctrl;

architecture beh of heg_bm_ctrl is

  signal fifo_rd    : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);

  type read_index_a is array (5 downto 0) of integer;
  signal next_read : read_index_a := (5,4,3,2,1,0);

  signal nexthit  : integer := 0; --std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal lasthit  : integer := 0;
  signal readhit  : std_logic;
  signal last_read : integer;

begin

  o_fifo_rd <= fifo_rd;

  BM_proc : process(rst,clk) 
    variable index_offset_v   : integer := 0;
    variable new_index_v      : integer := 0;
    variable loop_done_v      : integer := 0;
    variable nexthit_v        : integer := 0;
    variable last_read_v      : integer := 0;

    variable done_v           : std_logic := '0';
    variable rd_done_v        : std_logic := '0';
  begin
    
    if rising_edge(clk) then
      if(rst= '1') then
        -- o_mdt_hits <= (others => '0');
        buff_mdt_hit_v <= zero(buff_mdt_hit_v);
        -- new_index_v := 0;
        nexthit <= 0;
        lasthit <= 0;
        readhit <= '0';

        loop_done_v := 0;

        next_read <= (5,4,3,2,1,0);

        fifo_rd <= (others => '0');

        buff_mdt_dv <= '0';

        nexthit_v := 0;
        last_read_v := 0;

      else

        fifo_rd <= (others => '0');
        -- dynamic 

        done_v := '0';

        for hp_i in g_HPS_NUM_MDT_CH - 1 downto 0 loop

          if done_v = '0' then
            if fifo_empty(next_read(hp_i)) = '0' then
              done_v := '1';
              if lasthit = next_read(hp_i) then
                if fifo_used(next_read(hp_i)) > 1 then
                  fifo_rd(next_read(hp_i)) <= '1';
                  lasthit <= next_read(hp_i);
                  last_read_v := hp_i;
                else
                  fifo_rd(next_read(hp_i)) <= '0';
                end if;
              else
                fifo_rd(next_read(hp_i)) <= '1';
                lasthit <= next_read(hp_i);
                last_read_v := hp_i;
              end if;
            else
              if hp_i = 0 then
                fifo_rd <= (others => '0');
                lasthit <= 10;
                last_read_v := 0;
              end if;
            end if;
          end if;
        end loop;

        last_read <= last_read_v;

        for index_i in g_HPS_NUM_MDT_CH - 1 downto 0 loop
          if next_read(index_i) + last_read_v < g_HPS_NUM_MDT_CH then
            next_read(index_i) <= next_read(index_i) + last_read_v;
          else
            next_read(index_i) <= next_read(index_i) + last_read_v - g_HPS_NUM_MDT_CH ;
          end if;
        end loop;

        rd_done_v := '0';
        for hp_i in g_HPS_NUM_MDT_CH - 1 downto 0 loop
          if rd_done_v = '0' then
            if fifo_rd(hp_i) = '1' then
              rd_done_v := '1';
              buff_mdt_hit_v <= ff_o_mdt_hit_av(hp_i);
              buff_mdt_dv <= '1';
            else
              if hp_i = 0 then
                buff_mdt_hit_v <= (others => '0');
                buff_mdt_dv <= '0';
              end if;
            end if;
          end if;
        end loop;

        -- static

          -- fifo_rd <= (others => '0');

          -- if fifo_empty(next_read(5)) = '0' then
          --   if lasthit = next_read(5) then
          --     if fifo_used(next_read(5)) > 1 then
          --       fifo_rd(next_read(5)) <= '1';
          --       lasthit <= next_read(5);
          --       last_read_v := 5;
          --     else
          --       fifo_rd(next_read(5)) <= '0';
          --     end if;
          --   else
          --     fifo_rd(next_read(5)) <= '1';
          --     lasthit <= next_read(5);
          --     last_read_v := 5;
          --   end if;

          -- elsif fifo_empty(next_read(4)) = '0' then
          --   if lasthit = next_read(4) then
          --     if fifo_used(next_read(4)) > 1 then
          --       fifo_rd(next_read(4)) <= '1';
          --       lasthit <= next_read(4);
          --       last_read_v := 4;
          --     else
          --       fifo_rd(next_read(4)) <= '0';
          --     end if;
          --   else
          --     fifo_rd(next_read(4)) <= '1';
          --     lasthit <= next_read(4);
          --     last_read_v := 4;
          --   end if;

          -- elsif fifo_empty(next_read(3)) = '0' then
          --   if lasthit = next_read(3) then
          --     if fifo_used(next_read(3)) > 1 then
          --       fifo_rd(next_read(3)) <= '1';
          --       lasthit <= next_read(3);
          --       last_read_v := 3;
          --     else
          --       fifo_rd(next_read(3)) <= '0';
          --     end if;
          --   else
          --     fifo_rd(next_read(3)) <= '1';
          --     lasthit <= next_read(3);
          --     last_read_v := 3;
          --   end if;

          -- elsif fifo_empty(next_read(2)) = '0' then
          --   if lasthit = next_read(2) then
          --     if fifo_used(next_read(2)) > 1 then
          --       fifo_rd(next_read(2)) <= '1';
          --       lasthit <= next_read(2);
          --       last_read_v := 2;
          --     else
          --       fifo_rd(next_read(2)) <= '0';
          --     end if;
          --   else
          --     fifo_rd(next_read(2)) <= '1';
          --     lasthit <= next_read(2);
          --     last_read_v := 2;
          --   end if;

          -- elsif fifo_empty(next_read(1)) = '0' then
          --   if lasthit = next_read(1) then
          --     if fifo_used(next_read(1)) > 1 then
          --       fifo_rd(next_read(1)) <= '1';
          --       lasthit <= next_read(1);
          --       last_read_v := 1;
          --     else
          --       fifo_rd(next_read(1)) <= '0';
          --     end if;
          --   else
          --     fifo_rd(next_read(1)) <= '1';
          --     lasthit <= next_read(1);
          --     last_read_v := 1;
          --   end if;

          -- elsif fifo_empty(next_read(0)) = '0' then

          --   if lasthit = next_read(0) then
          --     if fifo_used(next_read(0)) > 1 then
          --       fifo_rd(next_read(0)) <= '1';
          --       lasthit <= next_read(0);
          --       last_read_v := 0;
          --     else
          --       fifo_rd(next_read(0)) <= '0';
          --       -- last_read_v := 7;
          --     end if;
          --   else
          --     fifo_rd(next_read(0)) <= '1';
          --     lasthit <= next_read(0);
          --     last_read_v := 0;
          --   end if;

          --   -- fifo_rd(next_read(0)) <= '1';
          --   -- lasthit <= next_read(0);
          --   -- last_read_v := 7;
          -- else
          --   fifo_rd <= (others => '0');
          --   lasthit <= 10;
          --   last_read_v := 0;
          -- end if;

          -- last_read <= last_read_v;

          -- for index_i in 5 downto 0 loop
          --   if next_read(index_i) + last_read_v < 6 then
          --     next_read(index_i) <= next_read(index_i) + last_read_v;
          --   else
          --     next_read(index_i) <= next_read(index_i) + last_read_v - 6 ;
          --   end if;
          -- end loop;


          -- if fifo_rd(5) = '1' then
          --   buff_mdt_hit_v <= ff_o_mdt_hit_av(5);
          --   buff_mdt_dv <= '1';
          -- elsif fifo_rd(4) = '1' then
          --   buff_mdt_hit_v <= ff_o_mdt_hit_av(4);
          -- elsif fifo_rd(3) = '1' then
          --   buff_mdt_hit_v <= ff_o_mdt_hit_av(3);
          --   buff_mdt_dv <= '1';
          -- elsif fifo_rd(2) = '1' then
          --   buff_mdt_hit_v <= ff_o_mdt_hit_av(2);
          --   buff_mdt_dv <= '1';
          -- elsif fifo_rd(1) = '1' then
          --   buff_mdt_hit_v <= ff_o_mdt_hit_av(1);
          --   buff_mdt_dv <= '1';
          -- elsif fifo_rd(0) = '1' then
          --   buff_mdt_hit_v <= ff_o_mdt_hit_av(0);
          --   buff_mdt_dv <= '1';
          -- else
          --   buff_mdt_hit_v <= (others => '0');
          --   buff_mdt_dv <= '0';
          -- end if;

      end if;
    end if;
  end process;


end beh;




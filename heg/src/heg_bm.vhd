--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: hit extractor group, buffer mux
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
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
use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;

entity heg_buffermux is
  generic(
    g_HPS_NUM_MDT_CH    : integer := 6
   );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    i_control           : in heg_ctrl2hp_bus_at(g_HPS_NUM_MDT_CH -1 downto 0);
    -- MDT in
    i_mdt_hits_av       : in heg_hp2bm_bus_avt(g_HPS_NUM_MDT_CH-1 downto 0);
    -- MDT out
    o_mdt_hits_v        : out heg2sfhit_rvt
    
  );
end entity heg_buffermux;

architecture beh of heg_buffermux is

  component heg_buffermux_infifo is
    generic( 
      BM_FIFO_DEPTH : integer := 4;
      BM_FIFO_WIDTH : integer := 4
    );
    port (
      clk                 : in std_logic;

      rst                 : in std_logic;
      glob_en             : in std_logic;
      -- in
      i_mdt_hit           : in std_logic_vector(BM_FIFO_WIDTH -1 downto 0);
      i_wr                : in std_logic;
      i_rd                : in std_logic;
      -- out
      o_used              : out unsigned(integer(log2(real(BM_FIFO_DEPTH))) -1 downto 0);
      o_empty             : out std_logic;
      o_mdt_hit           : out std_logic_vector(BM_FIFO_WIDTH -1 downto 0)
  
    );
  end component heg_buffermux_infifo;

  -- TEMP ---------------------------------
  constant gc_HPS_NUM_MDT_CH    : integer := 6;
  ---------------------------------------------


  constant BM_FIFO_DEPTH : integer := 32;
  
  signal i_mdt_hits_ar : heg_hp2bm_bus_at(g_HPS_NUM_MDT_CH-1 downto 0);

  signal fifo_wr    : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_rd    : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);

  signal o_mdt_hits_r : heg2sfhit_rt; 

  signal ff_i_mdt_hit_av : heg_hp2bm_bus_avt(g_HPS_NUM_MDT_CH-1 downto 0);
  signal ff_i_mdt_hit_ar : heg_hp2bm_bus_at(g_HPS_NUM_MDT_CH-1 downto 0);

  signal ff_o_mdt_hit_av : heg_hp2bm_data_bus_avt(g_HPS_NUM_MDT_CH-1 downto 0);
  signal ff_o_mdt_hit_ar  : heg_hp2bm_data_bus_at(g_HPS_NUM_MDT_CH-1 downto 0);

  signal buff_mdt_hit_v : hp_hp2sf_data_rvt;
  signal buff_mdt_hit_r : hp_hp2sf_data_rt;
  signal buff_mdt_dv    : std_logic;
  
  type fifo_used_at is array (g_HPS_NUM_MDT_CH -1 downto 0) of unsigned(integer(log2(real(BM_FIFO_DEPTH))) -1 downto 0);
  signal fifo_used        : fifo_used_at;
  signal fifo_empty       : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal fifo_empty_next  : std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);

  type read_index_a is array (5 downto 0) of integer;
  signal next_read : read_index_a := (5,4,3,2,1,0);

  signal nexthit  : integer := 0; --std_logic_vector(g_HPS_NUM_MDT_CH-1 downto 0);
  signal lasthit  : integer := 0;
  signal readhit  : std_logic;
begin

  o_mdt_hits_v <= vectorify(o_mdt_hits_r);
  buff_mdt_hit_r <= structify(buff_mdt_hit_v);

  o_mdt_hits_r.localx <= buff_mdt_hit_r.local_x;
  o_mdt_hits_r.localy <= buff_mdt_hit_r.local_y;
  o_mdt_hits_r.radius <= buff_mdt_hit_r.radius;
  o_mdt_hits_r.mlayer <= buff_mdt_hit_r.mlayer;
  o_mdt_hits_r.data_valid <= buff_mdt_dv;

  FIFOS: for hp_i in g_HPS_NUM_MDT_CH-1 downto 0 generate
    -- input extraction
    
    i_mdt_hits_ar(hp_i) <= structify(i_mdt_hits_av(hp_i));

    fifo_wr(hp_i) <= i_mdt_hits_ar(hp_i).mdt_valid and i_mdt_hits_ar(hp_i).data_valid;

    BM_IN_FIFO : heg_buffermux_infifo
    generic map(
      BM_FIFO_DEPTH   => BM_FIFO_DEPTH,
      BM_FIFO_WIDTH   => HP_HP2SF_DATA_LEN
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => i_control(hp_i).enable,
      --
      i_mdt_hit           => vectorify(i_mdt_hits_ar(hp_i).data),
      i_wr                => fifo_wr(hp_i),
      i_rd                => fifo_rd(hp_i),
      --
      o_used              => fifo_used(hp_i),
      o_empty             => fifo_empty(hp_i),
      o_mdt_hit           => ff_o_mdt_hit_av(hp_i)
    );
  end generate;

  BM_proc : process(rst,clk) 
    variable index_offset_v   : integer := 0;
    variable new_index_v      : integer := 0;
    variable loop_done_v      : integer := 0;
    variable nexthit_v        : integer := 0;
    variable last_read_v      : integer := 0;
  begin
    
    if rising_edge(clk) then
      if(rst= '1') then
        -- o_mdt_hits <= (others => '0');
        buff_mdt_hit_v <= nullify(buff_mdt_hit_v);
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

        -- fifo_empty_next <= fifo_empty;
        fifo_rd <= (others => '0');
        -- loop_done_v := 0;

        -- for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 loop
        --   -- loop until read
        --   if loop_done_v = 0 then
        --     -- something to read
        --     if fifo_empty(next_read(hp_i)) = '0' then
        --       -- same fifo check real hit waiting
        --       if lasthit = next_read(hp_i) then
        --         if fifo_used(hp_i) > 1 then
        --           fifo_rd(next_read(hp_i)) <= '1';
        --           lasthit <= next_read(hp_i);
        --           last_read_v := hp_i;
        --         else
        --           fifo_rd(next_read(hp_i)) <= '0';
        --         end if;
        --       -- first time this fifo
        --       else
        --         fifo_rd(next_read(hp_i)) <= '1';
        --         lasthit <= next_read(hp_i);
        --         last_read_v := hp_i;
        --       end if;
            
        --     else

        --     end if;
        --     loop_done_v := 1;
        --   else
        --     -- HIT readed, nothing to do
        --   end if;


        -- end loop;

        -- if loop_done_v = 0 then
        --   fifo_rd <= (others => '0');
        --   lasthit <= 10;
        --   last_read_v := 0;
        -- end if;

        -- if g_HPS_NUM_MDT_CH < 5 then

        if fifo_empty(next_read(5)) = '0' then
          if lasthit = next_read(5) then
            if fifo_used(5) > 1 then
              fifo_rd(next_read(5)) <= '1';
              lasthit <= next_read(5);
              last_read_v := 5;
            else
              fifo_rd(next_read(5)) <= '0';
            end if;
          else
            fifo_rd(next_read(5)) <= '1';
            lasthit <= next_read(5);
            last_read_v := 5;
          end if;

        elsif fifo_empty(next_read(4)) = '0' then
          if lasthit = next_read(4) then
            if fifo_used(4) > 1 then
              fifo_rd(next_read(4)) <= '1';
              lasthit <= next_read(4);
              last_read_v := 4;
            else
              fifo_rd(next_read(4)) <= '0';
            end if;
          else
            fifo_rd(next_read(4)) <= '1';
            lasthit <= next_read(4);
            last_read_v := 4;
          end if;

        elsif fifo_empty(next_read(3)) = '0' then
          if lasthit = next_read(3) then
            if fifo_used(3) > 1 then
              fifo_rd(next_read(3)) <= '1';
              lasthit <= next_read(3);
              last_read_v := 3;
            else
              fifo_rd(next_read(3)) <= '0';
            end if;
          else
            fifo_rd(next_read(3)) <= '1';
            lasthit <= next_read(3);
            last_read_v := 3;
          end if;

        elsif fifo_empty(next_read(2)) = '0' then
          if lasthit = next_read(2) then
            if fifo_used(2) > 1 then
              fifo_rd(next_read(2)) <= '1';
              lasthit <= next_read(2);
              last_read_v := 2;
            else
              fifo_rd(next_read(2)) <= '0';
            end if;
          else
            fifo_rd(next_read(2)) <= '1';
            lasthit <= next_read(2);
            last_read_v := 2;
          end if;

        elsif fifo_empty(next_read(1)) = '0' then
          if lasthit = next_read(1) then
            if fifo_used(1) > 1 then
              fifo_rd(next_read(1)) <= '1';
              lasthit <= next_read(1);
              last_read_v := 1;
            else
              fifo_rd(next_read(1)) <= '0';
            end if;
          else
            fifo_rd(next_read(1)) <= '1';
            lasthit <= next_read(1);
            last_read_v := 1;
          end if;

        elsif fifo_empty(next_read(0)) = '0' then

          if lasthit = next_read(0) then
            if fifo_used(0) > 1 then
              fifo_rd(next_read(0)) <= '1';
              lasthit <= next_read(0);
              last_read_v := 0;
            else
              fifo_rd(next_read(0)) <= '0';
            end if;
          else
            fifo_rd(next_read(0)) <= '1';
            lasthit <= next_read(0);
            last_read_v := 0;
          end if;

          -- fifo_rd(next_read(0)) <= '1';
          -- lasthit <= next_read(0);
          -- last_read_v := 0;
        else
          fifo_rd <= (others => '0');
          lasthit <= 10;
          last_read_v := 0;
        end if;

        for index_i in 5 downto 0 loop
          if next_read(index_i) + last_read_v < 6 then
            next_read(index_i) <= next_read(index_i) + last_read_v;
          else
            next_read(index_i) <= next_read(index_i) + last_read_v - 6 ;
          end if;
        end loop;


        if fifo_rd(5) = '1' then
          buff_mdt_hit_v <= ff_o_mdt_hit_av(5);
          buff_mdt_dv <= '1';
        elsif fifo_rd(4) = '1' then
          buff_mdt_hit_v <= ff_o_mdt_hit_av(4);
        elsif fifo_rd(3) = '1' then
          buff_mdt_hit_v <= ff_o_mdt_hit_av(3);
          buff_mdt_dv <= '1';
        elsif fifo_rd(2) = '1' then
          buff_mdt_hit_v <= ff_o_mdt_hit_av(2);
          buff_mdt_dv <= '1';
        elsif fifo_rd(1) = '1' then
          buff_mdt_hit_v <= ff_o_mdt_hit_av(1);
          buff_mdt_dv <= '1';
        elsif fifo_rd(0) = '1' then
          buff_mdt_hit_v <= ff_o_mdt_hit_av(0);
          buff_mdt_dv <= '1';
        else
          buff_mdt_hit_v <= (others => '0');
          buff_mdt_dv <= '0';
        end if;

      end if;
    end if;
  end process;


end beh;
/* OLD
        -- check for next hit to read
        if and_reduce(fifo_empty) = '0' then
          -- there are hits
          index_offset_v := lasthit + 1;
          loop_done_v := 0;
          new_index_v := index_offset_v;
          loop_a : for ti in 1 to (g_HPS_NUM_MDT_CH-1) loop
            

            if loop_done_v = 0 then
              -- moving index
              if new_index_v < g_HPS_NUM_MDT_CH then
                new_index_v := ti + index_offset_v;
              else
                new_index_v := ti + index_offset_v - g_HPS_NUM_MDT_CH;
              end if;

              -- checking fifo
              if fifo_empty(new_index_v) = '0' then
                -- next hit found
                nexthit_v := new_index_v;
                loop_done_v := 1;
              else
                -- loop_done_v := 0;
              end if;
            else

            end if;


          end loop;

          -- nexthit <= nexthit_v;
          readhit <= '1';
        else
          readhit <= '0';
        end if;

        -- read hit
        if readhit = '1' then
          
          fifo_rd(nexthit) <= '1';
          buff_mdt_hit_v <= ff_o_mdt_hit_av(nexthit);
          buff_mdt_dv <= '1';
          lasthit <= nexthit;
        else 
          buff_mdt_dv <= '0';
        end if;
/*        */
/*

        --   tdc_in_loop : for ti in (g_HPS_NUM_MDT_CH-1) downto 0 loop
        --     new_index_v := index_offset_v + ti;
        --     if new_index_v < (g_HPS_NUM_MDT_CH-1)  then
        --       if (not fifo_empty(new_index_v)) then
        --         o_mdt_hits.sf_data <= ff_o_mdt_hit_av(new_index_v).sf_data;
        --         index_offset_v := new_index_v - 1;
        --         exit;
        --       else

        --       end if;
        --     else
        --       if (not fifo_empty(new_index_v - MAX_NUM_HP)) then
        --         o_mdt_hits <= ff_o_mdt_hit_av(new_index_v - MAX_NUM_HP);
        --         index_offset_v := new_index_v - 1;
        --         exit;
        --       else

        --       end if;    
        --     end if;
        -- end loop tdc_in_loop;
*/
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: buffer mux input fifo
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- library shared_lib;
-- use shared_lib.config_pkg.all;
-- use shared_lib.common_types_pkg.all;
-- use shared_lib.common_constants_pkg.all;

-- library hp_lib;
-- use hp_lib.hp_pkg.all;
-- library heg_lib;
-- use heg_lib.heg_pkg.all;

entity heg_buffermux_infifo is
  generic( 
    BM_FIFO_DEPTH : integer := 4;
    BM_FIFO_WIDTH : integer := 4
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- in
    i_mdt_hit           : in std_logic_vector(BM_FIFO_WIDTH -1 downto 0);
    i_wr                : in std_logic;
    i_rd                : in std_logic;
    -- out
    o_used              : out unsigned(integer(log2(real(BM_FIFO_DEPTH))) -1 downto 0);
    o_empty             : out std_logic;
    o_mdt_hit           : out std_logic_vector(BM_FIFO_WIDTH -1 downto 0)

  );
end entity heg_buffermux_infifo;

architecture beh of heg_buffermux_infifo is

  type fifo_data_at is array ( BM_FIFO_DEPTH -1 downto 0) of std_logic_vector(BM_FIFO_WIDTH -1 downto 0);
  signal fifo_data : fifo_data_at;

  signal wr_index : integer range 0 to BM_FIFO_DEPTH -1 := 0;

  signal case_options : std_logic_vector(1 downto 0);

begin

  o_used <= to_unsigned(wr_index,integer(log2(real(BM_FIFO_DEPTH))));

  o_mdt_hit <= fifo_data(0);

  case_options <= i_wr & i_rd;

  SLc_reg : process(rst,clk) begin
    if rising_edge(clk) then
      if(rst= '1' and glob_en = '0' ) then
        fifo_data <= (others=>(others=>'0'));
        wr_index <= 0;
        o_empty <= '1';
      else
        if(wr_index < BM_FIFO_DEPTH) then
          case case_options is
            when b"00" => -- idle

            when b"10" => -- write
              fifo_data(wr_index) <= i_mdt_hit;
              wr_index <= wr_index +1;
              o_empty <= '0';

            when b"01" => -- read
              -- o_mdt_hit <= fifo_data(0);
              for ird in 0 to BM_FIFO_DEPTH - 2 loop
                fifo_data(ird) <= fifo_data(ird + 1);
              end loop;
              if wr_index = 1 then
                o_empty <= '1';
              else
                o_empty <= '0';
              end if;
              if wr_index > 0 then 
                wr_index <= wr_index -1;
              end if;
              
            when b"11" => -- read & write 
              -- o_mdt_hit <= fifo_data(0);
              for ird in 0 to BM_FIFO_DEPTH - 2 loop
                fifo_data(ird) <= fifo_data(ird + 1);
              end loop;
              fifo_data(wr_index) <= i_mdt_hit;
            when others =>
            
          end case;
        else
          -- fifo full
        end if;
      end if;

    end if;
  end process;


end beh;








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

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;

entity heg_buffermux is
  -- generic( );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    i_control           : in heg_ctrl2hp_rt;
    -- MDT in
    i_mdt_hits_av       : in heg_hp2bm_avt(MAX_NUM_HP -1 downto 0);
    -- MDT out
    o_mdt_hits_v        : out heg_bm2sf_rvt
    
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

      Reset_b             : in std_logic;
      glob_en             : in std_logic;
      -- in
      i_mdt_hit           : in std_logic_vector(BM_FIFO_WIDTH -1 downto 0);
      i_wr                : in std_logic;
      i_rd                : in std_logic;
      -- out
      o_empty             : out std_logic;
      o_mdt_hit           : out std_logic_vector(BM_FIFO_WIDTH -1 downto 0)
  
    );
  end component heg_buffermux_infifo;

  signal fifo_wr    : std_logic_vector(MAX_NUM_HP -1 downto 0);
  signal fifo_rd    : std_logic_vector(MAX_NUM_HP -1 downto 0);

  signal o_mdt_hits_r : heg_bm2sf_rt; 

  signal mdt_hit    :  heg_hp2bm_avt(MAX_NUM_HP -1 downto 0);
  signal fifo_empty : std_logic_vector(MAX_NUM_HP -1 downto 0);

  
begin

  o_mdt_hits_v <= vectorify(o_mdt_hits_r);

  FIFOS: for hp_i in MAX_NUM_HP -1 downto 0 generate

    fifo_wr(hp_i) <= i_mdt_hits_av(hp_i)(0) and i_mdt_hits_av(hp_i)(1);

    BM_IN_FIFO : heg_buffermux_infifo
    generic map(
      BM_FIFO_DEPTH   => 4,
      BM_FIFO_WIDTH   => HP_HP2BM_LEN
    )
    port map(
      clk                 => clk,
      Reset_b             => Reset_b,
      glob_en             => i_control.enable(hp_i),
      --
      i_mdt_hit           => i_mdt_hits_av(hp_i),
      i_wr                => fifo_wr(hp_i),
      i_rd                => fifo_rd(hp_i),
      --
      o_empty             => fifo_empty(hp_i),
      o_mdt_hit           => mdt_hit(hp_i)
    );
  end generate;

  BM_proc : process(Reset_b,clk) 
    variable index_offset_v   : integer;
    variable new_index_v      : integer;
  begin
    
    if rising_edge(clk) then
      if(Reset_b = '0') then
        -- o_mdt_hits <= (others => '0');
        o_mdt_hits_r <= nullify(o_mdt_hits_r);
        new_index_v := 0;
      else
        --   tdc_in_loop : for ti in (MAX_NUM_HP -1) downto 0 loop
        --     new_index_v := index_offset_v + ti;
        --     if new_index_v < (MAX_NUM_HP -1)  then
        --       if (not fifo_empty(new_index_v)) then
        --         o_mdt_hits.sf_data <= mdt_hit(new_index_v).sf_data;
        --         index_offset_v := new_index_v - 1;
        --         exit;
        --       else

        --       end if;
        --     else
        --       if (not fifo_empty(new_index_v - MAX_NUM_HP)) then
        --         o_mdt_hits <= mdt_hit(new_index_v - MAX_NUM_HP);
        --         index_offset_v := new_index_v - 1;
        --         exit;
        --       else

        --       end if;    
        --     end if;
        -- end loop tdc_in_loop;
      end if;



    end if;
  end process;


end beh;

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

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;

entity heg_buffermux_infifo is
  generic( 
    BM_FIFO_DEPTH : integer := 4;
    BM_FIFO_WIDTH : integer := 4
  );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- in
    i_mdt_hit           : in std_logic_vector(BM_FIFO_WIDTH -1 downto 0);
    i_wr                : in std_logic;
    i_rd                : in std_logic;
    -- out
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

  o_mdt_hit <= fifo_data(0);

  case_options <= i_wr & i_rd;

  SLc_reg : process(Reset_b,clk) begin
    if rising_edge(clk) then
      if(Reset_b = '0' and glob_en = '0' ) then
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
              wr_index <= wr_index -1;
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








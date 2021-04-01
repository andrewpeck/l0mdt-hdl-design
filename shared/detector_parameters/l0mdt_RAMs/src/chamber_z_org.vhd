--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: phimod calculator
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;

 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity chamber_z_org is
  generic(
    g_STATION           : integer := 0;
    g_INPUTWIDTH        : integer := 32;
    g_OUTPUTWIDTH       : integer := 32;
    g_RESOLUTION_SCALE  : real := 1.0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    --
    -- CHAMBER_Z0_CALC_WR  : in UCM_CHAMBER_Z0_CALC_WR_CTRL_t;
    -- CHAMBER_Z0_CALC_RD  : out UCM_CHAMBER_Z0_CALC_RD_MON_t;
    --
    i_z                 : in unsigned (g_INPUTWIDTH -1 downto 0);
    i_z_dv              : in std_logic;
    --
    o_chamber_z0        : out unsigned(g_OUPUTWIDTH-1 downto 0);
    o_chamber_z0_dv     : out std_logic

  );
end entity ucm_CHAMBER_Z0_calc;

architecture beh of chamber_z_org is

  signal chamber_z_org_a : b_chamber_z_origin_ait := get_b_chamber_origin_z_i(c_SECTOR_ID,g_STATION,g_RESOLUTION_SCALE);

  signal ctrl_wr_req       : std_logic := '0'; -- in pipeline mode behaves as i_wr_data data valid
  signal ctrl_rd_en        : std_logic := '0'; -- in pipeline mode behaves as i_wr_data data valid
  signal ctrl_addr         : std_logic_vector(integer(log2(real(VEC_MDTID_CHAMBER_CHAMBER_Z0_LEN))) -1 downto 0);
  signal ctrl_data_in      : std_logic_vector(integer(i_z'range) - 1 downto 0);
  signal ctrl_data_out     : std_logic_vector(integer(i_z'range)  - 1 downto 0);
  
begin

  PL : entity shared_lib.vhdl_ram_memory
  generic map(
    g_MEMORY_TYPE       => "auto",
    g_PIPELINE_LATENCY  => 0,
    g_RAM_WIDTH         => i_z'length,
    g_RAM_DEPTH         => o_chamber_z0'length
  )
  port map(
    clk         => clk,
    rst         => rst,
    -- SC ports
    i_ctrl_wr_req   => ctrl_wr_req  ,
    i_ctrl_rd_en    => ctrl_rd_en   ,
    i_ctrl_addr     => ctrl_addr    ,
    i_ctrl_data_in  => ctrl_data_in ,
    o_ctrl_data_out => ctrl_data_out,
    -- fw ports
    i_rd_en         => '1',
    i_rd_addr       => i_z ,
    o_rd_data       => CHAMBER_Z0_limit
  );

  WRITE_MEM: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        CHAMBER_Z0_CALC_RD.RST_NEEDED <= '0';
      else

        if CHAMBER_Z0_CALC_WR.ADDR = x"00" then
          i_ctrl_rd_en <= '0';
          i_ctrl_wr_req <= '0';
        else
          i_ctrl_rd_en <= '1';
          i_ctrl_addr <= CHAMBER_Z0_CALC_WR.ADDR;
          CHAMBER_Z0_CALC_RD.VALUE <= ctrl_data_out;
          if CHAMBER_Z0_CALC_WR.WR_EN = '1' then
            CHAMBER_Z0_CALC_RD.RST_NEEDED <= '1';
            i_ctrl_wr_req <= '1';
            i_ctrl_data_in <= CHAMBER_Z0_CALC_WR.VALUE;
          end if;
        end if;
        
      end if;
    end if;
  end process;

  -- READ_MEM: process(clk)
  -- begin
  --   if rising_edge(clk) then
  --     if rst = '1' then

  --     else
  --       if i_z_dv = '1' then
  --         CHAMBER_Z0_limit
  --       else

  --       end if;
        
  --     end if;
  --   end if;
  -- end process;
  
  

  
end architecture beh;
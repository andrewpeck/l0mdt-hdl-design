--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--
--  Module: Dual Port memory
--  Description: URAM wrapper using template from vivado 2019.2.1
--  Template name: 288K-bit High-Density Base Memory Building Block (URAM288_BASE)
--------------------------------------------------------------------------------
--  Revisions:
--
--------------------------------------------------------------------------------

-- URAM288_BASE : In order to incorporate this function into the design,
--     VHDL     : the following instance declaration needs to be placed
--   instance   : in the body of the design code.  The instance name
-- declaration  : (URAM288_BASE_inst) and/or the port declarations after the
--     code     : "=>" declaration maybe changed to properly reference and
--              : connect this function to the design.  All inputs and outputs
--              : must be connected.

--   Library    : In addition to adding the instance declaration, a use
-- declaration  : statement for the UNISIM.vcomponents library needs to be
--     for      : added before the entity declaration.  This library
--    Xilinx    : contains the component declarations for all Xilinx
--  primitives  : primitives and points to the models that will be used
--              : for simulation.

--  Copy the following two statements and paste them before the
--  Entity declaration, unless they already exist.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

Library UNISIM;
use UNISIM.vcomponents.all;

entity uram_template is
  generic(
    g_MEMORY_TYPE         : string := "auto";
    g_ENABLE_SECOND_PORT  : std_logic := '0';
    g_RAM_WIDTH           : integer := 8;
    g_ADD_WIDTH           : integer := 8
  );
  port (
    clk : in std_logic;
    rst : in std_logic;
    ena : in std_logic;
    -- Port A
    i_addr_a    : in std_logic_vector(g_ADD_WIDTH-1 downto 0);
    i_din_a     : in std_logic_vector(g_RAM_WIDTH-1 downto 0);
    i_wr_nrd_a  : in  std_logic;
    o_dout_a    : out std_logic_vector(g_RAM_WIDTH-1 downto 0);
    -- Port B
    i_addr_b    : in std_logic_vector(g_ADD_WIDTH-1 downto 0);
    i_din_b     : in std_logic_vector(g_RAM_WIDTH-1 downto 0);
    i_wr_nrd_b  : in  std_logic;
    o_dout_b    : out std_logic_vector(g_RAM_WIDTH-1 downto 0)
  );
end entity uram_template;

architecture rtl of uram_template is
  
begin
  
  -- <-----Cut code below this line and paste into the architecture body---->

   -- URAM288_BASE: 288K-bit High-Density Base Memory Building Block
   --               Kintex UltraScale+
   -- Xilinx HDL Language Template, version 2019.2

   URAM288_BASE_inst : URAM288_BASE
   generic map (
      AUTO_SLEEP_LATENCY => 8,            -- Latency requirement to enter sleep mode
      AVG_CONS_INACTIVE_CYCLES => 10,     -- Average concecutive inactive cycles when is SLEEP mode for power
                                          -- estimation
      BWE_MODE_A => "PARITY_INTERLEAVED", -- Port A Byte write control
      BWE_MODE_B => "PARITY_INTERLEAVED", -- Port B Byte write control
      EN_AUTO_SLEEP_MODE => "FALSE",      -- Enable to automatically enter sleep mode
      EN_ECC_RD_A => "FALSE",             -- Port A ECC encoder
      EN_ECC_RD_B => "FALSE",             -- Port B ECC encoder
      EN_ECC_WR_A => "FALSE",             -- Port A ECC decoder
      EN_ECC_WR_B => "FALSE",             -- Port B ECC decoder
      IREG_PRE_A => "FALSE",              -- Optional Port A input pipeline registers
      IREG_PRE_B => "FALSE",              -- Optional Port B input pipeline registers
      IS_CLK_INVERTED => '0',             -- Optional inverter for CLK
      IS_EN_A_INVERTED => '0',            -- Optional inverter for Port A enable
      IS_EN_B_INVERTED => '0',            -- Optional inverter for Port B enable
      IS_RDB_WR_A_INVERTED => '0',        -- Optional inverter for Port A read/write select
      IS_RDB_WR_B_INVERTED => '0',        -- Optional inverter for Port B read/write select
      IS_RST_A_INVERTED => '0',           -- Optional inverter for Port A reset
      IS_RST_B_INVERTED => '0',           -- Optional inverter for Port B reset
      OREG_A => "FALSE",                  -- Optional Port A output pipeline registers
      OREG_B => "FALSE",                  -- Optional Port B output pipeline registers
      OREG_ECC_A => "FALSE",              -- Port A ECC decoder output
      OREG_ECC_B => "FALSE",              -- Port B output ECC decoder
      RST_MODE_A => "SYNC",               -- Port A reset mode
      RST_MODE_B => "SYNC",               -- Port B reset mode
      USE_EXT_CE_A => "FALSE",            -- Enable Port A external CE inputs for output registers
      USE_EXT_CE_B => "FALSE"             -- Enable Port B external CE inputs for output registers
   )
   port map (
      DBITERR_A => DBITERR_A,               -- 1-bit output: Port A double-bit error flag status
      DBITERR_B => DBITERR_B,               -- 1-bit output: Port B double-bit error flag status
      DOUT_A => DOUT_A,                     -- 72-bit output: Port A read data output
      DOUT_B => DOUT_B,                     -- 72-bit output: Port B read data output
      SBITERR_A => SBITERR_A,               -- 1-bit output: Port A single-bit error flag status
      SBITERR_B => SBITERR_B,               -- 1-bit output: Port B single-bit error flag status
      ADDR_A => ADDR_A,                     -- 23-bit input: Port A address
      ADDR_B => ADDR_B,                     -- 23-bit input: Port B address
      BWE_A => BWE_A,                       -- 9-bit input: Port A Byte-write enable
      BWE_B => BWE_B,                       -- 9-bit input: Port B Byte-write enable
      CLK => CLK,                           -- 1-bit input: Clock source
      DIN_A => DIN_A,                       -- 72-bit input: Port A write data input
      DIN_B => DIN_B,                       -- 72-bit input: Port B write data input
      EN_A => EN_A,                         -- 1-bit input: Port A enable
      EN_B => EN_B,                         -- 1-bit input: Port B enable
      INJECT_DBITERR_A => INJECT_DBITERR_A, -- 1-bit input: Port A double-bit error injection
      INJECT_DBITERR_B => INJECT_DBITERR_B, -- 1-bit input: Port B double-bit error injection
      INJECT_SBITERR_A => INJECT_SBITERR_A, -- 1-bit input: Port A single-bit error injection
      INJECT_SBITERR_B => INJECT_SBITERR_B, -- 1-bit input: Port B single-bit error injection
      OREG_CE_A => OREG_CE_A,               -- 1-bit input: Port A output register clock enable
      OREG_CE_B => OREG_CE_B,               -- 1-bit input: Port B output register clock enable
      OREG_ECC_CE_A => OREG_ECC_CE_A,       -- 1-bit input: Port A ECC decoder output register clock enable
      OREG_ECC_CE_B => OREG_ECC_CE_B,       -- 1-bit input: Port B ECC decoder output register clock enable
      RDB_WR_A => RDB_WR_A,                 -- 1-bit input: Port A read/write select
      RDB_WR_B => RDB_WR_B,                 -- 1-bit input: Port B read/write select
      RST_A => RST_A,                       -- 1-bit input: Port A asynchronous or synchronous reset for output
                                            -- registers

      RST_B => RST_B,                       -- 1-bit input: Port B asynchronous or synchronous reset for output
                                            -- registers

      SLEEP => SLEEP                        -- 1-bit input: Dynamic power gating control
   );

   -- End of URAM288_BASE_inst instantiation
  
end architecture rtl;


					
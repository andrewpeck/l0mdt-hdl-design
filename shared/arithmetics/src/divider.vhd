----------------------------------------------------------------------------------
-- Company: Max Planck Institute For Physics Munich
-- Engineer: Davide Cieri
--
--  Project: ATLAS L0MDT Trigger 
--  Module: Configurable Divider Module
--
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

LIBRARY shared_lib;
LIBRARY shared_cfg_def_lib;

ENTITY divider IS
  GENERIC(
    g_NUMERATOR_LEN     : INTEGER   := 20;
    g_DENOMINATOR_LEN   : INTEGER   := 20;
    g_DIVIDER_LEN       : INTEGER   := 22;
    g_QUOTIENT_LEN      : INTEGER   := 20;
    g_MULTIPLIER_LEN    : INTEGER   := 0;
    g_IS_SIGNED         : STD_LOGIC := '0';
    g_ROM_STYLE         : STRING    := "distributed";
    g_ROM_FILE          : STRING    := "fitter_reciprocal.mem"
  );
  PORT (
    i_clk           : IN STD_LOGIC;
    i_rst           : IN STD_LOGIC;
    i_enable        : IN STD_LOGIC;
    i_numerator     : IN STD_LOGIC_VECTOR(g_NUMERATOR_LEN-1 DOWNTO 0);
    i_denominator   : IN STD_LOGIC_VECTOR(g_DENOMINATOR_LEN-1 DOWNTO 0);
    o_valid         : OUT STD_LOGIC;
    o_quotient      : OUT STD_LOGIC_VECTOR(g_QUOTIENT_LEN-1 DOWNTO 0)
  );
END divider;


architecture divider_arc of divider is

  ---COMPONENTS --------
  COMPONENT rom
    GENERIC (
      MXADRB    : INTEGER;
      MXDATB    : INTEGER;
      ROM_FILE  : STRING;
      ROM_STYLE : STRING
    );
    PORT (
      clka  : IN STD_LOGIC;
      ena   : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR;
      douta : OUT STD_LOGIC_VECTOR
    );
  END COMPONENT;

  -- SIGNALS
  SIGNAL reciprocal_addr : STD_LOGIC_VECTOR(g_DENOMINATOR_LEN-1 DOWNTO 0);
  SIGNAL reciprocal_den : STD_LOGIC_VECTOR(g_DIVIDER_LEN-1 DOWNTO 0);
  SIGNAL rec_signed : SIGNED(g_DIVIDER_LEN downto 0);
  SIGNAL rec_unsigned : UNSIGNED(g_DIVIDER_LEN-1 DOWNTO 0);
  SIGNAL den_sign, den_sign_s1, den_sign_s2 : STD_LOGIC;
  SIGNAL dv0, dv1, dv2, dv3, dv4, dv5 : STD_LOGIC;
  SIGNAL num_s0, num_s1, num_s2 : STD_LOGIC_VECTOR(g_NUMERATOR_LEN-1 DOWNTO 0);
  SIGNAL num_signed : SIGNED(g_NUMERATOR_LEN-1 DOWNTO 0);
  SIGNAL num_unsigned : UNSIGNED(g_NUMERATOR_LEN-1 DOWNTO 0);
  SIGNAL quot_full_signed, quot_full_signed_s0: SIGNED(g_NUMERATOR_LEN+g_DIVIDER_LEN downto 0);
  SIGNAL quot_full_unsigned, quot_full_unsigned_s0 : UNSIGNED(g_NUMERATOR_LEN+g_DIVIDER_LEN-1 DOWNTO 0);

begin

  reciprocal_rom : rom
  GENERIC MAP(
    MXADRB    => g_DENOMINATOR_LEN,
    MXDATB    => g_DIVIDER_LEN,
    ROM_FILE  => g_ROM_FILE,
    ROM_STYLE => g_ROM_STYLE
  )
  PORT MAP(
    ena   => '1',
    clka  => i_clk,
    addra => reciprocal_addr,
    douta => reciprocal_den
  );

  DIV_PROC : process (i_rst, i_clk)
  begin
    if (i_rst = '1') then
      o_quotient <= (others => '0');
      dv0 <= '0';
      dv1 <= '0';
      dv2 <= '0';
      dv3 <= '0';
      dv4 <= '0';
      dv5 <= '0';
      o_valid <= '0';
    elsif (rising_edge(i_clk)) then
      -- Clock 0
      dv0 <= i_enable;
      if i_enable = '1' then
        if g_IS_SIGNED = '1' then
          reciprocal_addr <= STD_LOGIC_VECTOR(abs(SIGNED(i_denominator)));
          den_sign <= i_denominator(g_DENOMINATOR_LEN-1);
        else
          reciprocal_addr <= STD_LOGIC_VECTOR(i_denominator);
        end if;
        num_s0 <= i_numerator;
      end if;
      -- Clock 1
      dv1 <= dv0;
      num_s1 <= num_s0;
      den_sign_s1 <= den_sign;

      -- Clock 2
      dv2 <= dv1;
      num_s2 <= num_s1;
      den_sign_s2 <= den_sign_s1;

      -- Clock 3
      dv3 <= dv2;
      if g_IS_SIGNED = '1' then
        num_signed <= SIGNED(num_s2);
        if den_sign_s2 = '1' then
          rec_signed <= -SIGNED('0' & SIGNED(reciprocal_den));
        else
          rec_signed <= SIGNED('0' & SIGNED(reciprocal_den));
        end if;
      else
        num_unsigned <= UNSIGNED(num_s2);
        rec_unsigned <= UNSIGNED(reciprocal_den);
      end if;

      -- Clock 4
      dv4 <= dv3;
      if g_IS_SIGNED = '1' then
        quot_full_signed <= num_signed*rec_signed;
      else
        quot_full_unsigned <= num_unsigned*rec_unsigned;
      end if;

      -- Clock 5
      dv5 <= dv4;
      quot_full_signed_s0 <= quot_full_signed;
      quot_full_unsigned_s0 <= quot_full_unsigned;

      -- Clock 6
      o_valid <= dv5;
      if g_IS_SIGNED = '1' then
        o_quotient <= STD_LOGIC_VECTOR(resize(shift_right(quot_full_signed_s0, g_DIVIDER_LEN - g_MULTIPLIER_LEN), g_QUOTIENT_LEN));
      else
        o_quotient <= STD_LOGIC_VECTOR(resize(shift_right(quot_full_unsigned_s0, g_DIVIDER_LEN - g_MULTIPLIER_LEN), g_QUOTIENT_LEN));
      end if;
    end if;
  end process DIV_PROC;


end divider_arc;
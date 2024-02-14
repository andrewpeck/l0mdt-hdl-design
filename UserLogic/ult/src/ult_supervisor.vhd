--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ult_supervisor.vhd
-- Module: <<moduleName>>
-- File PATH: /ult_supervisor.vhd
-- -----
-- File Created: Wednesday, 14th February 2024 11:55:52 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 14th February 2024 11:56:58 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------



entity ult_supervisor is
  port (
    clk   : in std_logic;
    rst : in std_logic;

    g_ena : out std_logic;
    g_freeze : out std_logic
    
  );
end entity;

architecture beh of ult_supervisor is



begin

  process (clk)
  begin
    if rising_edge(clk) then
      if (rst = '1') then
        g_ena <= '1';
        g_freeze <= '0';
      end if;
    end if;
  end process;
  

end architecture;
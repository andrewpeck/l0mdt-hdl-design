--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------  
--  Project: ATLAS L0MDT Trigger 
--  Module: PHI CENTER CHAMBER
--  Description: 
--
--------------------------------------------------------------------------------
--  Revisions:
--      2020.12.21  0.1     File created
--------------------------------------------------------------------------------

entity mem_phi_center_chamber is
  generic(
    g_STATION : integer := 0
  );
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    --
    
    --
    i_rd_addr         : in unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
    o_rd_data         : out unsigned(SLC_COMMON_POSPHI_LEN-1 downto 0);
  );
end entity mem_phi_center_chamber;

architecture beh of mem_phi_center_chamber is
  
begin

  GET_PHI: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        
      else
        
      end if;
    end if;
  end process GET_PHI;
  
  
end architecture beh;
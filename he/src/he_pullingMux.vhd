--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module:
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--   26/11/2019  0.1  File created
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library he_lib;
use he_lib.he_pkg.all;

entity he_pullingMux is
    port (
        clk_360     : in std_logic;
        nReset      : in std_logic;
        tdc_enable  : in std_logic_vector(numInputs_mux -1 downto 0);
        --
        indata      : in sta_tdc_data;
        invalid     : in std_logic_vector(numInputs_mux -1 downto 0);
        invalid_acq : out std_logic_vector(numInputs_mux -1 downto 0);
        --
        outdata     : out tr_mux2tar_data
    );
end entity he_pullingMux;

architecture beh of he_pullingMux is

    signal tdc_vector : std_logic_vector(31 downto 0);

begin
    
    outdata.tdc_data <= tdc_vec2data(tdc_vector);

    HE_PM_proc : process(nReset,clk_360) 
        variable index_offset : integer;
        variable new_index : integer;
    begin

        if nReset = '0' then
            --outdata.tdc_data <= tdc_vec2data(std_logic_vector(to_unsigned(0,32)));
            tdc_vector <= (others => '0');
            outdata.muxch   <= 0;
            new_index := 0;
            invalid_acq <= (others => '0');
        elsif rising_edge(clk_360) then
            invalid_acq <= (others => '0');
            tdc_in_loop : for ti in (numInputs_mux -1) downto 0 loop
                new_index := index_offset + ti;
                if new_index < (numInputs_mux -1)  then
                    if (invalid(new_index)) then
                        tdc_vector <= indata(new_index);
                        outdata.muxch <= new_index;
                        invalid_acq(new_index) <= '1';

                        index_offset := new_index - 1;
                        exit;
                    else

                    end if;
                else
                    if (invalid(new_index - numInputs_mux)) then
                        tdc_vector <= indata(new_index - numInputs_mux);
                        outdata.muxch <= (new_index - numInputs_mux);
                        invalid_acq(new_index - numInputs_mux) <= '1';

                        index_offset := new_index - 1;
                        exit;
                    else

                    end if;    
                end if;
            end loop tdc_in_loop;
        end if;

    end process;
    
end beh;
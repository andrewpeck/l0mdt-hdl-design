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
        clk_360             : in std_logic;
        Reset_b             : in std_logic;
        tdc_enable_a        : in std_logic_vector(numInputs_mux -1 downto 0);
        --
        in_tdc_data_a       : in tdc_data_ta;
        in_tdc_valid_a      : in std_logic_vector(numInputs_mux -1 downto 0);
        in_tdc_valid_acq_a  : out std_logic_vector(numInputs_mux -1 downto 0);
        --
        out_data_r          : out mux2tar_data_rt;
        out_data_valid      : out std_logic
    );
end entity he_pullingMux;

architecture beh of he_pullingMux is

    signal tdc_vector : std_logic_vector(31 downto 0);

begin
    
    out_data_r.tdc_data_r <= tdc_vec2data(tdc_vector);

    HE_PM_proc : process(Reset_b,clk_360) 
        variable index_offset_v   : integer;
        variable new_index_v      : integer;
    begin

        if Reset_b = '0' then
            --out_data_r.tdc_data <= tdc_vec2data(std_logic_vector(to_unsigned(0,32)));
            tdc_vector <= (others => '0');
            out_data_r.mux_ch   <= 0;
            new_index_v := 0;
            in_tdc_valid_acq_a <= (others => '0');
        elsif rising_edge(clk_360) then
            in_tdc_valid_acq_a <= (others => '0');
            tdc_in_loop : for ti in (numInputs_mux -1) downto 0 loop
                new_index_v := index_offset_v + ti;
                if new_index_v < (numInputs_mux -1)  then
                    if (in_tdc_valid_a(new_index_v)) then
                        tdc_vector <= in_tdc_data_a(new_index_v);
                        out_data_r.mux_ch <= new_index_v;
                        in_tdc_valid_acq_a(new_index_v) <= '1';

                        index_offset_v := new_index_v - 1;
                        exit;
                    else

                    end if;
                else
                    if (in_tdc_valid_a(new_index_v - numInputs_mux)) then
                        tdc_vector <= in_tdc_data_a(new_index_v - numInputs_mux);
                        out_data_r.mux_ch <= (new_index_v - numInputs_mux);
                        in_tdc_valid_acq_a(new_index_v - numInputs_mux) <= '1';

                        index_offset_v := new_index_v - 1;
                        exit;
                    else

                    end if;    
                end if;
            end loop tdc_in_loop;
        end if;

    end process;
    
end beh;
----------------------------------------------------------------------------------
-- Company: Max Planck Institute For Physics Munich
-- Engineer: Davide Cieri
--
-- Create Date: 02/08/2019 11:40:56 AM
-- Design Name: Compact Segment Finder - BIL chamber
-- Module Name: csf_pkg - Behavioral
-- Project Name: MDTL0 Trigger
-- Target Devices: xcvu5p-flvb2104-2-e
-- Tool Versions: Vivado 2019.2
-- Description: Common package for CSF modules
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library csf_lib;
use csf_lib.custom_types_csf_pkg.all;

package csf_pkg is
    ----------------------------------------------------------------------------
    -- MDT hit coordinates constants
    constant R_OVER_Z_MULTI_LEN : integer :=
        integer(log2(MDT_RADIUS_MULT/MDT_LOCAL_AXI_MULT));

    -- Number of fitter module to instantiate
    constant NUM_FITTERS : integer := 4;
    --  Output Local Segment constants
    constant MFIT_MULTI_LEN : integer := integer(log2(CSF_SEG_M_MULT));
    constant CHI2_MULT_LEN  : integer := integer(log2(CSF_SEG_CHI2_MULT));

    ------------------------------------------------------------------------------------
    -- Functions
    function stdlogic_integer( s : std_logic ) return integer ;

end;

package body csf_pkg is

    function stdlogic_integer( s : std_logic ) return integer is
    begin
        if s = '1' then
            return 1;
        else
            return 0;
        end if;
    end function;

end package body;

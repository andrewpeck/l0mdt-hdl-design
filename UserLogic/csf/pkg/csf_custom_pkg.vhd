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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

LIBRARY shared_lib;
USE shared_lib.config_pkg.ALL;
USE shared_lib.common_types_pkg.ALL;
USE shared_lib.common_constants_pkg.ALL;
USE shared_lib.l0mdt_constants_pkg.ALL;

LIBRARY csf_lib;
USE csf_lib.csf_pkg.ALL;

PACKAGE csf_custom_pkg IS
    ----------------------------------------------------------------------------
    -- MDT hit coordinates constants
    CONSTANT R_OVER_Z_MULTI_LEN : INTEGER :=
    INTEGER(log2(HEG2SFHIT_RADIUS_MULT/HEG2SFHIT_LOCALX_MULT));

    -- Number of fitter module to instantiate
    CONSTANT NUM_FITTERS : INTEGER := 4;
    --  Output Local Segment constants
    CONSTANT MFIT_MULTI_LEN : INTEGER := INTEGER(log2(CSF_SEG_M_MULT));
    CONSTANT CHI2_MULT_LEN : INTEGER := INTEGER(log2(CSF_SEG_CHI2_MULT));

    ----------------------------------------------------------------------------------
    -- Functions
    FUNCTION stdlogic_integer(s : STD_LOGIC) RETURN INTEGER;

END;

PACKAGE BODY csf_custom_pkg IS

    FUNCTION stdlogic_integer(s : STD_LOGIC) RETURN INTEGER IS
    BEGIN
        IF s = '1' THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END FUNCTION;

END PACKAGE BODY;
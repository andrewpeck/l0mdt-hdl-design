--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package HOG_INFO_CTRL is
  type HOG_INFO_MON_t is record
    FRAMEWORK_FWHASH           : std_logic_vector(31 downto  0);
    FRAMEWORK_FWVERSION        : std_logic_vector(31 downto  0);
    GLOBAL_FWDATE              : std_logic_vector(31 downto  0);
    GLOBAL_FWHASH              : std_logic_vector(31 downto  0);
    GLOBAL_FWTIME              : std_logic_vector(31 downto  0);
    GLOBAL_FWVERSION           : std_logic_vector(31 downto  0);
    HOG_FWHASH                 : std_logic_vector(31 downto  0);
    OFFICIAL                   : std_logic_vector(31 downto  0);
    TOP_FWHASH                 : std_logic_vector(31 downto  0);
    TOP_FWVERSION              : std_logic_vector(31 downto  0);
    XML_HASH                   : std_logic_vector(31 downto  0);
    XML_VERSION                : std_logic_vector(31 downto  0);
  end record HOG_INFO_MON_t;



end package HOG_INFO_CTRL;
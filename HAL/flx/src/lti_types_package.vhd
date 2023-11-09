--! This file is part of the FELIX firmware distribution (https://gitlab.cern.ch/atlas-tdaq-felix/firmware/).
--! Copyright (C) 2001-2021 CERN for the benefit of the ATLAS collaboration.
--! Authors:
--!               Alessandra Camplani
--!               Frans Schreuder
--!               Thei Wijnen
--!
--!   Licensed under the Apache License, Version 2.0 (the "License");
--!   you may not use this file except in compliance with the License.
--!   You may obtain a copy of the License at
--!
--!       http://www.apache.org/licenses/LICENSE-2.0
--!
--!   Unless required by applicable law or agreed to in writing, software
--!   distributed under the License is distributed on an "AS IS" BASIS,
--!   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--!   See the License for the specific language governing permissions and
--!   limitations under the License.

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

package lti_types_package is

    constant Kchar_comma: std_logic_vector(7 downto 0) := x"BC";

    type TTC_data_type is record
        --***Phase2***
        -- Header
        MT                  : std_logic;
        PT                  : std_logic;
        Partition           : std_logic_vector(1 downto 0);
        BCID                : std_logic_vector(11 downto 0);
        SyncUserData        : std_logic_vector(15 downto 0);
        SyncGlobalData      : std_logic_vector(15 downto 0);
        TS                  : std_logic;
        ErrorFlags          : std_logic_vector(3 downto 0);

        -- TTC Message
        SL0ID               : std_logic;
        SOrb                : std_logic;
        Sync                : std_logic;
        GRst                : std_logic;
        L0A                 : std_logic;
        L0ID                : std_logic_vector(37 downto 0);
        OrbitID             : std_logic_vector(31 downto 0);
        TriggerType         : std_logic_vector(15 downto 0);
        LBID                : std_logic_vector(15 downto 0);

        --User message
        AsyncUserData       : std_logic_vector(63 downto 0);

        LTI_decoder_aligned   : std_logic;
        LTI_CRC_valid         : std_logic;


    end record;


    
end lti_types_package;



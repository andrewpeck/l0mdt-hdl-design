--! This file is part of the FELIX firmware distribution (https://gitlab.cern.ch/atlas-tdaq-felix/firmware/).
--! Copyright (C) 2001-2021 CERN for the benefit of the ATLAS collaboration.
--! Authors:
--!               Marco Trovato
--!               Frans Schreuder
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
    use IEEE.NUMERIC_STD.ALL;
    use ieee.numeric_std_unsigned.all;

library UNISIM;
    use UNISIM.VComponents.all;

    use work.lti_types_package.all;

--=================================================================================================--
--======================================= Module Body =============================================--
--=================================================================================================--
entity ltittc_wrapper is
    port (
        reset_in                    : in std_logic; --! Active high reset
        clk240_in                   : in std_logic; --! Recovered 240.474MHz clock from transceiver
        linkaligned_in              : in std_logic; --! 1 indicating that 8b10b decoder is aligned
        rxdata_in                   : in std_logic_vector(31 downto 0); --! 8b10b decoded data
        rxcharisk_in                : in std_logic_vector(3 downto 0);  --! 8b10b CharIsK indication
        TTC_out                     : out TTC_data_type;                --! Decoded record containing all available TTC information
        clk40_ttc_out               : out std_logic; --! TTC 40 MHz clock from clk240_rx_ttc_in
        clk40_ttc_ready_out         : out std_logic  --! Indication that 40 MHz clock is valid.
    );

end ltittc_wrapper;


architecture top of ltittc_wrapper is


    signal clk40_ttc_i            : std_logic;
    signal TTC_data_decoder_i     : std_logic_vector(191 downto 0) := (others=>'0');
    signal typemsg                : std_logic := '0';
    signal partn                  : std_logic_vector(2 downto 0)  := (others=>'0');
    signal bcid                   : std_logic_vector(11 downto 0) := (others=>'0');
    signal syncusrdata            : std_logic_vector(15 downto 0) := (others => '0');
    signal l0a                    : std_logic := '0';
    signal sl0id                  : std_logic := '0';
    signal sorb                   : std_logic := '0';
    signal sync                   : std_logic := '0';
    signal grst                   : std_logic := '0';
    signal l0id                   : std_logic_vector(37 downto 0) := (others=>'0');
    signal orbitid                : std_logic_vector(31 downto 0) := (others=>'0');
    signal ttype                  : std_logic_vector(15 downto 0) := (others => '0');
    signal lbid                   : std_logic_vector(15 downto 0) := (others => '0');
    signal asyncusrdata           : std_logic_vector(63 downto 0) := (others => '0');
    signal syncglobaldata         : std_logic_vector(15 downto 0) := (others => '0');
    signal turnsignal             : std_logic := '0';
    signal errorflags             : std_logic_vector(3 downto 0) := (others => '0');


    signal l0id_r               : std_logic_vector(37 downto 0) := (others => '0');
    signal orbitid_r            : std_logic_vector(31 downto 0) := (others => '0');
    signal ttype_r              : std_logic_vector(15 downto 0) := (others => '0');
    signal lbid_r               : std_logic_vector(15 downto 0) := (others => '0');
    signal asyncusrdata_r       : std_logic_vector(63 downto 0) := (others => '0');

    --data out
    signal TTC_out_i              : TTC_data_type;



    signal lti_decoder_aligned : std_logic;
    signal crc_valid : std_logic;
    signal clk40_ttc_ready_i : std_logic;
    signal ltittc_bit_err : std_logic_vector(2 downto 0); -- @suppress "signal ltittc_bit_err is never read"

begin


    clk40_ttc_out  <= clk40_ttc_i;
    clk40_ttc_ready_out <= clk40_ttc_ready_i;

    TTC_out <= TTC_out_i;


    --routing the whole TTC message minus the comma (192b-8b) rather than 136b mentioned in Table 2.2 of https://edms.cern.ch/ui/file/1563801/1/RequirementsPhaseII_v1.1.0.pdf
    TTC_out_i.MT               <= typemsg;
    TTC_out_i.PT               <= partn(2);
    TTC_out_i.Partition        <= partn(1 downto 0);
    TTC_out_i.BCID             <= bcid;
    TTC_out_i.SyncUserData     <= syncusrdata;
    TTC_out_i.SyncGlobalData   <= syncglobaldata;
    TTC_out_i.TS               <= turnsignal;
    TTC_out_i.ErrorFlags       <= errorflags;
    TTC_out_i.SL0ID            <= sl0id;
    TTC_out_i.SOrb             <= sorb;
    TTC_out_i.Sync             <= sync;
    TTC_out_i.GRst             <= grst;
    TTC_out_i.L0A              <= l0a;
    TTC_out_i.L0ID             <= l0id;
    TTC_out_i.OrbitID          <= orbitid;
    TTC_out_i.TriggerType      <= ttype;
    TTC_out_i.LBID             <= lbid;

    TTC_out_i.LTI_CRC_valid <= crc_valid;
    TTC_out_i.LTI_decoder_aligned <= lti_decoder_aligned;
    TTC_out_i.AsyncUserData    <= asyncusrdata;

    --=====================--
    -- DECODER
    --=====================--

    ltittc_dec: entity work.ltittc_decoder
        port map (
            reset_in        => reset_in,
            clk240_in       => clk240_in,
            LinkAligned_in  => linkaligned_in,
            data_in         => rxcharisk_in(0) & rxdata_in,
            data_out        => TTC_data_decoder_i,
            clk40_out       => clk40_ttc_i,
            clk40_ready_out => clk40_ttc_ready_i,  -- the ttc_clk_gated is present
            cnt_error_out   => ltittc_bit_err,
            decoder_aligned_out => lti_decoder_aligned,
            crc_valid_out   => crc_valid
        );






    --FS: Preserve ID/counter values, pulse signals should not be preserved.

    --As per Table 2.3 of https://edms.cern.ch/document/2379978/1 (v1.1)
    typemsg           <= TTC_data_decoder_i(31+0*32);
    partn             <= TTC_data_decoder_i(30+0*32 downto 28+0*32);
    bcid              <= TTC_data_decoder_i(27+0*32 downto 16+0*32);
    syncusrdata       <= TTC_data_decoder_i(15+0*32 downto  0+0*32);
    syncglobaldata    <= TTC_data_decoder_i(31+1*32 downto 16+1*32);
    turnsignal        <= TTC_data_decoder_i(15+1*32);
    errorflags        <= TTC_data_decoder_i(14+1*32 downto 11+1*32);
    sl0id             <= TTC_data_decoder_i(10+1*32)                when typemsg = '0' else '0';
    sorb              <= TTC_data_decoder_i( 9+1*32)                when typemsg = '0' else '0';
    sync              <= TTC_data_decoder_i( 8+1*32)                when typemsg = '0' else '0';
    grst              <= TTC_data_decoder_i( 7+1*32)                when typemsg = '0' else '0';
    l0a               <= TTC_data_decoder_i( 6+1*32)                when typemsg = '0' else '0';
    l0id              <= TTC_data_decoder_i(31+2*32 downto  0+2*32) &
                         TTC_data_decoder_i(5+1*32 downto 0+1*32)   when typemsg = '0' else l0id_r;
    orbitid           <= TTC_data_decoder_i(31+3*32 downto  0+3*32) when typemsg = '0' else orbitid_r;
    ttype             <= TTC_data_decoder_i(31+4*32 downto 16+4*32) when typemsg = '0' else ttype_r;
    lbid              <= TTC_data_decoder_i(15+4*32 downto  0+4*32) when typemsg = '0' else lbid_r;
    -- asyncusrdata      <= TTC_data_decoder_i(31+4*32 downto  0+3*32) when typemsg = '1' else asyncusrdata_r;
    asyncusrdata      <= TTC_data_decoder_i(31+4*32 downto  0+3*32) when typemsg = '1' else (others => '1');
    --CRC is checked in ltittc_decoder
    --crc               <= TTC_data_decoder_i(31+5*32 downto 16+5*32);

    reg_proc: process(clk40_ttc_i)
    begin
        if rising_edge(clk40_ttc_i) then
            l0id_r          <= l0id;
            orbitid_r       <= orbitid;
            ttype_r         <= ttype;
            lbid_r          <= lbid;
            asyncusrdata_r  <= asyncusrdata;
        end if;
    end process;

end top;

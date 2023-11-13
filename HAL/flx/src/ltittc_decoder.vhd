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
    use ieee.numeric_std.all;
    use ieee.numeric_std_unsigned.all;

library UNISIM;
    use UNISIM.VComponents.all;

    use work.lti_types_package.all;

--use work.all;
entity ltittc_decoder is
    port
    (
        reset_in                  : in std_logic;
        clk240_in                 : in std_logic;
        --@clk240_in
        LinkAligned_in            : in std_logic;
        data_in                   : in std_logic_vector(32 downto 0);
        --@clk40_out
        data_out                  : out std_logic_vector(191 downto 0);
        clk40_out                 : out std_logic;
        clk40_ready_out           : out std_logic; --@clk240_in
        cnt_error_out             : out std_logic_vector(2 downto 0);
        decoder_aligned_out       : out std_logic;
        crc_valid_out             : out std_logic


    );

end ltittc_decoder;

architecture top of ltittc_decoder is

    type   smtype  is (CLKSTART,ALIGN,COMMA_FOUND);
    signal state           : smtype;
    signal data_in32       : std_logic_vector(31 downto 0);
    signal disperr_in      : std_logic; -- @suppress "signal disperr_in is never read"
    signal cnt             : integer range 0 to 5;
    signal cnt_error_i     : std_logic_vector(2 downto 0);
    signal clk40_ready_i   : std_logic                      := '0';
    signal clk40_i         : std_logic                      := '1';
    signal state_i         : std_logic_vector(1 downto 0)   := "00";
    signal clk40_out_i     : std_logic := '0';
    signal data_out_i      : std_logic_vector(191 downto 0) := (others => '0');
    signal crc_reset, crc_en                                        : std_logic;
    signal crc_out                                                  : std_logic_vector(15 downto 0);
    signal crc_in: std_logic_vector(31 downto 0);

begin
    data_in32  <= data_in(31 downto 0);
    disperr_in <= data_in(32);
    ---------------------------
    ---*********DATA GEARBOX and CLK START*********
    ----------------------------
    state_i <= "00" when state = CLKSTART else
               "01" when state = ALIGN else
               "10" when state = COMMA_FOUND else
               "11";
    decoder_aligned_out <= '1' when state = COMMA_FOUND else '0';

    crc_reset <= '1' when cnt = 5 else '0';
    crc_en <= not crc_reset;
    crc_in <= data_in32 when cnt /= 5 else (others => '1');


    CRC16_0 : entity work.crc16_lti
        port map(
            data_in => crc_in,
            crc_en  => crc_en,
            rst     => crc_reset,
            clk     => clk240_in,
            crc_out => crc_out
        );

    GEARBOX_CLKST_proc : process(clk240_in)
        variable data_i        : std_logic_vector(191 downto 0);
    begin
        if clk240_in'event and clk240_in='1' then
            if (reset_in = '1' or LinkAligned_in = '0') then
                state                                   <= CLKSTART;
                data_i                                  := (others=>'0');
                cnt_error_i                             <= (others=>'0');
                cnt                                     <= 5;
                crc_valid_out                           <= '0';
            else
                case state is
                    when CLKSTART =>
                        data_i                              := (others=>'0');
                        cnt_error_i                         <= cnt_error_i;
                        if (data_in32(7 downto 0) = Kchar_comma) then
                            state                             <= ALIGN;
                            cnt                               <= 0;
                        else
                            state                             <= CLKSTART;
                            cnt                               <= 5;
                        end if;
                        crc_valid_out                         <= '0';
                    when ALIGN =>
                        data_i                              := (others=>'0');
                        if (data_in32(7 downto 0) = Kchar_comma and cnt = 5) then
                            state                             <= COMMA_FOUND;
                            cnt_error_i                       <= cnt_error_i;
                            cnt                               <= 0;
                        elsif ( cnt /= 5) then
                            state                             <= ALIGN;
                            cnt                               <= cnt+1;
                            cnt_error_i                       <= cnt_error_i;
                        else
                            state                             <= CLKSTART;
                            cnt                               <= 5;
                            cnt_error_i                       <= cnt_error_i+"001";
                        end if;
                        crc_valid_out                         <= '0';
                    when COMMA_FOUND =>
                        if (cnt /= 5) then
                            state                             <= COMMA_FOUND;
                            data_i(32*cnt+31 downto 32*cnt)   := data_in32; --writing word 0 to 4
                            cnt_error_i                       <= cnt_error_i;
                            cnt                               <= cnt+1;
                        else
                            if (data_in32(7 downto 0) = Kchar_comma) then         --double check that comma appear again
                                state                           <= COMMA_FOUND;
                                data_i(32*cnt+31 downto 32*cnt) := data_in32(31 downto 8) & x"00"; --writing word 5, dropping comma of next bunch (since MGT is 4 byte aligned to comma it will have comma in the LSByte)
                                cnt_error_i                     <= cnt_error_i;
                                cnt                             <= 0;
                                if crc_out = data_in32(31 downto 16) then
                                    crc_valid_out <= '1';
                                else
                                    crc_valid_out <= '0';
                                end if;
                            else --comma not found again in the same place.
                                data_i                          := (others=>'0');
                                if (cnt_error_i = x"7") then --if too many errors restart everything
                                    state                         <= CLKSTART;
                                    cnt                           <= 5;
                                    cnt_error_i                   <= (others=>'0');
                                else                           --otherwise skip cycle and find comma in the same spot (ie: do not change cnt'ing). Allowing for occasional
                                    state                         <= ALIGN;
                                    cnt                           <= 0;
                                    cnt_error_i                   <= cnt_error_i + "001";
                                end if; --if (cnt_error_i /= x"7")
                            end if; --if (data_in32(7 downto 0) = Kchar_comma)
                            data_out_i                        <= data_i; --every 6 clocks

                        end if; --if (cnt /= x"5")

                end case;
            end if;
        end if;
    end process;

    ---------------------------
    ---*********CLK*********
    ----------------------------

    CLK_proc: process(clk240_in)
    begin
        if clk240_in'event and clk240_in='1' then
            if ((cnt = 2 or cnt = 5) and state_i = "10") then
                clk40_i       <= not clk40_i;
                clk40_ready_i <= '1';
            end if;
        end if;
    end process;


    bufg_ttc : BUFG_GT --CE
        generic map(
            SIM_DEVICE => "ULTRASCALE",
            STARTUP_SYNC => "FALSE"
        )
        port map(
            O  => clk40_out_i,
            CE => clk40_ready_i,
            CEMASK => '0',
            CLR => '0',
            CLRMASK => '0',
            DIV => "000",
            I  => clk40_i
        );
    clk40_out       <= clk40_out_i;
    clk40_ready_out <= clk40_ready_i;

    RETIMING : process(clk40_out_i)
    begin
        if rising_edge(clk40_out_i) then
            --double register needed for simu
            data_out         <= data_out_i;
            cnt_error_out    <= cnt_error_i;
        end if;
    end process;



end top;

-- IEEE VHDL standard library:
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.SCA_PKG.all;
use work.tb_tools_package.all;

USE std.textio.all;
use std.env.all;

--=================================================================================================--
--#######################################   Entity   ##############################################--
--=================================================================================================--

entity testbench_top is
	port(

		GPIO		: inout std_logic_vector(31 downto 0);

		SCL_1				: out STD_LOGIC_VECTOR(15 downto 0);
		SCLEN_1				: out STD_LOGIC_VECTOR(15 downto 0);
		SDA_in_1			: in  STD_LOGIC_VECTOR(15 downto 0);
		SDA_out_1			: out STD_LOGIC_VECTOR(15 downto 0);

        JTAG_TDO            : out STD_LOGIC;
        JTAG_TCK            : out STD_LOGIC;
        JTAG_TMS            : out STD_LOGIC
	);
end testbench_top;

--=================================================================================================--
--####################################   Architecture   ###########################################--
--=================================================================================================--

architecture behabioral of testbench_top is

    -- Signal declaration (Testbench)
	signal powerup_reset			: std_logic := '1';
	signal prompt_reset				: std_logic := '1';

	signal general_reset_n			: std_logic	:= '1';
	signal general_reset			: std_logic	:= '0';

	signal sca_enable				: std_logic_vector(0 downto 0)	:= "1";
	signal start_transaction		: std_logic := '0';
	signal start_reset				: std_logic := '0';
	signal start_connect			: std_logic := '0';
	signal start_transaction_s0		: std_logic := '0';
	signal start_reset_s0			: std_logic := '0';
	signal start_connect_s0			: std_logic := '0';
	signal inject_crc_error         : std_logic := '0';

	signal hdlc_from_gbtsc			: std_logic_vector(1 downto 0)	:= "11";
	signal hdlc_to_gbtsc			: std_logic_vector(1 downto 0)	:= "11";

	signal hdlc_to_sca				: std_logic := '1';
	signal hdlc_from_sca			: std_logic := '1';
	signal hdlc_clock				: std_logic	:= '0';

    signal tx_addr					: std_logic_vector(7 downto 0)	:= x"00";
    signal tx_trid					: std_logic_vector(7 downto 0)	:= x"01";
    signal tx_ch					: std_logic_vector(7 downto 0)	:= x"00";
    signal tx_cmd					: std_logic_vector(7 downto 0)	:= x"02";
    signal tx_data					: std_logic_vector(31 downto 0)	:= x"0000FF00";

	signal rx_received				: std_logic						:= '0';
	signal rx_received_s0			: std_logic						:= '0';
    signal rx_addr					: std_logic_vector(7 downto 0)	:= x"00";
    signal rx_ctrl					: std_logic_vector(7 downto 0)	:= x"00";
    signal rx_trid					: std_logic_vector(7 downto 0)	:= x"00";
    signal rx_ch					: std_logic_vector(7 downto 0)	:= x"00";
    signal rx_len					: std_logic_vector(7 downto 0)	:= x"00";
    signal rx_err					: std_logic_vector(7 downto 0)	:= x"00";
    signal rx_data					: std_logic_vector(31 downto 0)	:= x"00000000";

	signal GPIO_i					: std_logic_vector(31 downto 0);
	signal GPIO_o					: std_logic_vector(31 downto 0);
	signal GPIO_oe					: std_logic_vector(31 downto 0);
	signal SDA_out_inv_1			: std_logic_vector(15 downto 0);

    -- Component declaration (SCA Model)
	COMPONENT TOP_core_sca_tri
        PORT (
         -- Elink HDLC
         link_clk_1			: in  STD_LOGIC;
         link_clk_aux_1		: in  STD_LOGIC;
         disable_aux_1		: in  STD_LOGIC;
         tx_sd_1			: out STD_LOGIC;
         tx_sd_aux_1		: out STD_LOGIC;
         rx_sd_1			: in  STD_LOGIC;
         rx_sd_aux_1		: in  STD_LOGIC;
         tx_adr_1			: in  STD_LOGIC_VECTOR(7 downto 0);
         CRE_1				: out STD_LOGIC_VECTOR(7 downto 0);
         active_aux_1		: out STD_LOGIC;

         -- JTAG
         JTAG_TCK_pad_o_1	: out STD_LOGIC;
         JTAG_TMS_pad_o_1	: out STD_LOGIC;
         JTAG_TDO_pad_o_1	: out STD_LOGIC;
         JTAG_TDI_pad_i_1	: in  STD_LOGIC;
         JTAG_RST_pad_o_1	: out STD_LOGIC;

         -- SPI
         SPI_sclk_pad_o_1	: out STD_LOGIC;
         SPI_ss_pad_o_1		: out STD_LOGIC_VECTOR(7 downto 0);
         SPI_miso_pad_i_1	: in  STD_LOGIC;
         SPI_mosi_pad_o_1	: out STD_LOGIC;

         -- GPIO
         GPIO_ext_pad_o_1	: out STD_LOGIC_VECTOR(31 downto 0);
         GPIO_ext_padOE_o_1	: out STD_LOGIC_VECTOR(31 downto 0);
         GPIO_clk_pad_i_1	: in  STD_LOGIC;
         GPIO_ext_pad_i_1	: in  STD_LOGIC_VECTOR(31 downto 0);

         -- I2C
         SCL_1				: out STD_LOGIC_VECTOR(15 downto 0);
		 SCLEN_1			: out STD_LOGIC_VECTOR(15 downto 0);
         SDA_in_1			: in  STD_LOGIC_VECTOR(15 downto 0);
         SDA_out_inv_1		: out STD_LOGIC_VECTOR(15 downto 0);

         -- ADC
         ADC_wb_RES_1		: out STD_LOGIC;
         ADC_wb_CLK_1		: out STD_LOGIC;
         ADC_wb_SEL_1		: out STD_LOGIC;
         ADC_wb_WE_1		: out STD_LOGIC;
         ADC_wb_STB_1		: out STD_LOGIC;
         ADC_wb_CYC_1		: out STD_LOGIC;
         ADC_wb_ADR_1		: out STD_LOGIC_VECTOR(3 downto 0);
         ADC_wb_DATi_1		: out STD_LOGIC_VECTOR(31 downto 0);
         ADC_wb_DATo_1		: in  STD_LOGIC_VECTOR(31 downto 0);
         ADC_wb_ACK_1		: in STD_LOGIC;
         ADC_wb_INT_1		: in STD_LOGIC;

         -- DAC
         anaDAC_A_1			: out STD_LOGIC_VECTOR(7 downto 0);
         anaDAC_B_1			: out STD_LOGIC_VECTOR(7 downto 0);
         anaDAC_C_1			: out STD_LOGIC_VECTOR(7 downto 0);
         anaDAC_D_1			: out STD_LOGIC_VECTOR(7 downto 0);

         -- Reset Logic
         PowerUpReset_1 	: in  STD_LOGIC;
         PromtReset_1		: in  STD_LOGIC;
         Reset_BG_1			: out STD_LOGIC;

         -- Auxiliary Port I2C
         auxPort_TestEn_1	: in  STD_LOGIC;
         auxPort_SCL_1		: in  STD_LOGIC;
         auxPort_SDA_in_1	: in  STD_LOGIC;
         auxPort_SDA_out_1	: out STD_LOGIC;
         auxPort_SDA_oEn_1	: out STD_LOGIC
        );
      END COMPONENT;

      signal tdo_s : stD_logic;


begin                 --========####   Architecture Body   ####========--

    JTAG_TDO <= tdo_s;

    SCAModel: TOP_core_sca_tri
      port map (
         -- Elink HDLC
         link_clk_1			=>	hdlc_clock		,					--: in  STD_LOGIC;
         link_clk_aux_1		=>	'0'				,					--: in  STD_LOGIC;
         disable_aux_1		=>	'1'				,					--: in  STD_LOGIC;
         tx_sd_1			=>	hdlc_from_sca	,					--: out STD_LOGIC;
         tx_sd_aux_1		=>	open			,					--: out STD_LOGIC;
         rx_sd_1			=>	hdlc_to_sca		,					--: in  STD_LOGIC;
         rx_sd_aux_1		=>	'0'				,					--: in  STD_LOGIC;
         tx_adr_1			=>	x"00"			,					--: in  STD_LOGIC_VECTOR(7 downto 0);
         CRE_1				=>	open			,					--: out STD_LOGIC_VECTOR(7 downto 0);
         active_aux_1		=>	open			,					--: out STD_LOGIC;

         -- JTAG
         JTAG_TCK_pad_o_1	=>	JTAG_TCK		,					--: out STD_LOGIC;
         JTAG_TMS_pad_o_1	=>	JTAG_TMS		,					--: out STD_LOGIC;
         JTAG_TDO_pad_o_1	=>	tdo_s		,					--: out STD_LOGIC;
         JTAG_TDI_pad_i_1	=>	tdo_s				,					--: in  STD_LOGIC;
         JTAG_RST_pad_o_1	=>	open			,					--: out STD_LOGIC;

         -- SPI
         SPI_sclk_pad_o_1	=>	open			,					--: out STD_LOGIC;
         SPI_ss_pad_o_1		=>	open			,					--: out STD_LOGIC_VECTOR(7 downto 0);
         SPI_miso_pad_i_1	=>	'0'				,					--: in  STD_LOGIC;
         SPI_mosi_pad_o_1	=>	open			,					--: out STD_LOGIC;

         -- GPIO
         GPIO_ext_pad_o_1	=>	GPIO_o			,					--: out STD_LOGIC_VECTOR(31 downto 0);
         GPIO_ext_padOE_o_1	=>	GPIO_oe			,					--: out STD_LOGIC_VECTOR(31 downto 0);
         GPIO_clk_pad_i_1	=>	'0'				,					--: in  STD_LOGIC;
         GPIO_ext_pad_i_1	=>	GPIO_i			,					--: in  STD_LOGIC_VECTOR(31 downto 0);

         -- I2C
         SCL_1				=>	SCL_1			,					--: out STD_LOGIC_VECTOR(15 downto 0);
		 SCLEN_1			=>	SCLEN_1			,					--: out STD_LOGIC_VECTOR(15 downto 0);
         SDA_in_1			=>	SDA_in_1		,					--: in  STD_LOGIC_VECTOR(15 downto 0);
         SDA_out_inv_1		=>	SDA_out_inv_1	,					--: out STD_LOGIC_VECTOR(15 downto 0);

         -- ADC
         ADC_wb_RES_1		=>	open			,					--: out STD_LOGIC;
         ADC_wb_CLK_1		=>	open			,					--: out STD_LOGIC;
         ADC_wb_SEL_1		=>	open			,					--: out STD_LOGIC;
         ADC_wb_WE_1		=>	open			,					--: out STD_LOGIC;
         ADC_wb_STB_1		=>	open			,					--: out STD_LOGIC;
         ADC_wb_CYC_1		=>	open			,					--: out STD_LOGIC;
         ADC_wb_ADR_1		=>	open			,					--: out STD_LOGIC_VECTOR(3 downto 0);
         ADC_wb_DATi_1		=>	open			,					--: out STD_LOGIC_VECTOR(31 downto 0);
         ADC_wb_DATo_1		=>	(others => '0')	,					--: in  STD_LOGIC_VECTOR(31 downto 0);
         ADC_wb_ACK_1		=>	'0'				,					--: in STD_LOGIC;
         ADC_wb_INT_1		=>	'0'				,					--: in STD_LOGIC;

         -- DAC
         anaDAC_A_1			=>	open			,					--: out STD_LOGIC_VECTOR(7 downto 0);
         anaDAC_B_1			=>	open			,					--: out STD_LOGIC_VECTOR(7 downto 0);
         anaDAC_C_1			=>	open			,					--: out STD_LOGIC_VECTOR(7 downto 0);
         anaDAC_D_1			=>	open			,					--: out STD_LOGIC_VECTOR(7 downto 0);

         -- Reset Logic
         PowerUpReset_1 	=>	powerup_reset	,					--: in  STD_LOGIC;
         PromtReset_1		=>	prompt_reset	,					--: in  STD_LOGIC;
         Reset_BG_1			=>	open			,					--: out STD_LOGIC;

         -- Auxiliary Port I2C
         auxPort_TestEn_1	=>	'0'				,					--: in  STD_LOGIC;
         auxPort_SCL_1		=>	'0'				,					--: in  STD_LOGIC;
         auxPort_SDA_in_1	=>	'0'				,					--: in  STD_LOGIC;
         auxPort_SDA_out_1	=>	open			,					--: out STD_LOGIC;
         auxPort_SDA_oEn_1	=>	open								--: out STD_LOGIC
      );

	SDA_out_1 <= not(SDA_out_inv_1);

	general_reset <= '1' after 100ns;
	general_reset_n <= not(general_reset);

    gbtsc_inst: entity work.gbtsc_top
        generic map(
            -- IC configuration
            g_IC_FIFO_DEPTH     => 20,

            -- EC configuration
            g_SCA_COUNT         => 1
        )
        port map(
            -- Clock & reset
            tx_clk_i                => hdlc_clock,
            rx_clk_i                => hdlc_clock,
            rx_reset_i              => general_reset_n,
            tx_reset_i              => general_reset_n,

            -- IC configuration
            tx_GBTx_address_i       => (others => '0'),
            tx_register_addr_i      => (others => '0'),
            tx_nb_to_be_read_i      => (others => '0'),

            -- IC Status
            tx_ready_o              => open,
            rx_empty_o              => open,

            rx_gbtx_addr_o          => open,
            rx_mem_ptr_o            => open,
            rx_nb_of_words_o        => open,

            -- IC FIFO control
            wr_clk_i                => hdlc_clock,
            tx_wr_i                 => '0',
            tx_data_to_gbtx_i       => (others => '0'),

            rd_clk_i                => hdlc_clock,
            rx_rd_i                 => '0',
            rx_data_from_gbtx_o     => open,

            -- IC control
            tx_start_write_i        => '0',
            tx_start_read_i         => '0',

            -- SCA control
            sca_enable_i            => "1",
            start_reset_cmd_i       => start_reset,
            start_connect_cmd_i     => start_connect,
            start_command_i         => start_transaction,
            inject_crc_error        => inject_crc_error,

            -- SCA command
            tx_address_i            => tx_addr,
            tx_transID_i            => tx_trid,
            tx_channel_i            => tx_ch,
            tx_command_i            => tx_cmd,
            tx_data_i               => tx_data,

            rx_received_o(0)        => rx_received,
            rx_address_o(0)         => rx_addr,
            rx_control_o(0)         => rx_ctrl,
            rx_transID_o(0)         => rx_trid,
            rx_channel_o(0)         => rx_ch,
            rx_len_o(0)             => rx_len,
            rx_error_o(0)           => rx_err,
            rx_data_o(0)            => rx_data,

            -- EC line
            ec_data_o(0)            => hdlc_from_gbtsc,
            ec_data_i(0)            => hdlc_to_gbtsc,

            -- IC lines
            ic_data_o               => open,
            ic_data_i               => "00"

        );

    --GBTSC_inst: entity work.sca_top
	--   port map(
	--	   tx_clk_i             => hdlc_clock,
	--	   rx_clk_i             => hdlc_clock,
	--	   reset_i              => general_reset_n,
	--
	--	   enable_i             => sca_enable,
	--	   start_reset_cmd_i    => start_reset,
	--	   start_connect_cmd_i  => start_connect,
	--	   start_command_i      => start_transaction,
	--
	--	   tx_address_i         => tx_addr,
	--	   tx_transID_i         => tx_trid,
	--	   tx_channel_i         => tx_ch,
	--	   tx_len_i             => tx_len,
	--	   tx_command_i         => tx_cmd,
	--	   tx_data_i            => tx_data,
	--
	--	   rx_received_o(0)     => rx_received,
	--	   rx_address_o(0)      => rx_addr,
	--	   rx_control_o(0)      => rx_ctrl,
	--	   rx_transID_o(0)      => rx_trid,
	--	   rx_channel_o(0)      => rx_ch,
	--	   rx_len_o(0)          => rx_len,
	--	   rx_error_o(0)        => rx_err,
	--	   rx_data_o(0)         => rx_data,
    --
	--	   tx_data_o(0)         => hdlc_from_gbtsc,
	--	   rx_data_i(0)         => hdlc_to_gbtsc
	--   );

	   -- Clock generation
	   hdlc_clock	<= not(hdlc_clock) after 12.5ns;


	   -- HDLC serializer
	   hdlcser_proc: process(hdlc_clock)
	   begin

			if rising_edge(hdlc_clock) then
				hdlc_to_sca <= hdlc_from_gbtsc(0);

			elsif falling_edge(hdlc_clock) then
				hdlc_to_sca <= hdlc_from_gbtsc(1);

			end if;

	   end process;

	   -- HDLC deserializer
	   hdlcdes_proc: process(hdlc_clock)
			variable cnter:		integer range 0 to 1 	:= 0;
			variable hdlc_des:	std_logic_vector(1 downto 0);
	   begin

			if falling_edge(hdlc_clock) then
				hdlc_des(0) := hdlc_from_sca;
				hdlc_to_gbtsc <= hdlc_des;

			elsif rising_edge(hdlc_clock) then
				hdlc_des(1) := hdlc_from_sca;

			end if;

	   end process;

	   prompt_reset		<= '0' after 200ns;
	   powerup_reset	<= '0' after 200ns;

	   -- Manage GPIO
	   GPIO_gen: for i in 0 to 31 generate

		GPIO(i)		<= GPIO_o(i)	when GPIO_oe(i) = '1';
		GPIO_i(i)	<= GPIO(i) when GPIO_oe(i) = '0';

	   end generate;

		-- Print Message
		print_mess: process(hdlc_clock)
		begin

			if rising_edge(hdlc_clock) then

				start_connect_s0 	<= start_connect;
				start_reset_s0   		<= start_reset;
				start_transaction_s0 	<= start_transaction;
				rx_received_s0			<= rx_received;

				if start_transaction = '1' and start_transaction_s0 = '0' then
					write(output, "** Send packet to (0x" & to_hstring(tx_addr) & "):" & LF );
					write(output, "      Transaction ID: 0x" & to_hstring(tx_trid) & LF );
					write(output, "      Channel: 0x" & to_hstring(tx_ch) & LF );
					write(output, "      Command: 0x" & to_hstring(tx_cmd) & LF );
					write(output, "      Data: 0x" & to_hstring(tx_data) & LF );
					write(output, "" & LF );

				elsif start_reset = '1' and start_reset_s0 = '0' then
					write(output, "** Send reset packet to (0x" & to_hstring(tx_addr) & ")" & LF );
					write(output, "" & LF );

				elsif start_connect = '1' and start_connect_s0 = '0' then
					write(output, "** Send connect packet to (0x" & to_hstring(tx_addr) & ")" & LF );
					write(output, "" & LF );

				elsif rx_received = '1' and rx_ctrl(0) /= '1' then
					write(output, "** Received packet from (0x" & to_hstring(rx_addr) & "):" & LF );
					write(output, "      Transaction ID: 0x" & to_hstring(rx_trid) & LF );
					write(output, "      Channel: 0x" & to_hstring(rx_ch) & LF );
					write(output, "      Len: 0x" & to_hstring(rx_len) & LF );
					write(output, "      Error: 0x" & to_hstring(rx_err) & LF );
					write(output, "      Data: 0x" & to_hstring(rx_data) & LF );
					write(output, "      Control: 0x" & to_hstring(rx_ctrl) & LF );
					write(output, "" & LF );

				elsif rx_received = '1' then
					write(output, "** Received packet from (0x" & to_hstring(rx_addr) & "):" & LF );
					write(output, "      Control: 0x" & to_hstring(rx_ctrl) & LF );
					write(output, "" & LF );
				end if;

				if rx_received_s0 = '0' and rx_received = '1' then
					stop(0);
				end if;
			end if;

		end process;

end behabioral;
--=================================================================================================--
--#################################################################################################--
--=================================================================================================--
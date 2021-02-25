library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity rx_comma_detection is
  generic (
    NUMBER_OF_WORDS_IN_A_PACKET : integer := 6;
    NUMBER_OF_BYTES_IN_A_WORD : integer := 4);  
  port
    (
      RESET : in std_logic;
      CLK_IN : in std_logic;
      RX_DATA_IN : in std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0);
      RX_CTRL0_IN : in std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
      RX_CTRL1_IN : in std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
      DECODED_DATA_OUT : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD*8-1 downto 0);
      DECODED_CHARISK_OUT : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
      DECODED_ISCOMMA_OUT : out std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
      COMMA_PULSE_OUT : out std_logic;
      LOCK_OUT : out std_logic;
      RXSLIDE_OUT : out std_logic
      );
end rx_comma_detection;

architecture RTL of rx_comma_detection is
  signal counter_i : integer range NUMBER_OF_WORDS_IN_A_PACKET downto 0 := 0;
  --  RXSLIDE must be Low for at least 32 RXUSRCLK2 cycles before it can be
  --  used again.
  signal word_boundary_phase_i : integer range NUMBER_OF_BYTES_IN_A_WORD-1 downto 0:= 0;
  signal waiting_i : std_logic;         -- flag for waiting state
  -- a bit longer wait time than really needed (32 clk)
  signal wait_counter_i : std_logic_vector(5 downto 0) := (others => '0');
  signal lock_counter_i : std_logic_vector(8 downto 0) := (others => '0');
  -- in order to stretch for 2 clock cycles
  signal rxslide_i : std_logic := '0';
  signal rxslide_r : std_logic := '0';  
  signal rxcommadet_i : std_logic;
  type data10_array is array (NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) of std_logic_vector(9 downto 0);
  type data8_array is array (NUMBER_OF_BYTES_IN_A_WORD-1 downto 0) of std_logic_vector(7 downto 0);
  
  signal rx_10bit_data_i : data10_array;
  signal rx_8bit_data_i : data8_array;
  signal rx_8bit_data_buf_i : data8_array;
  signal rx_isk_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
  signal rx_isk_buf_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
  signal rx_isComma_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
  signal rx_isComma_buf_i : std_logic_vector(NUMBER_OF_BYTES_IN_A_WORD-1 downto 0);
  
  constant mcommaword : std_logic_vector(9 downto 0) := "1010000011";
  constant pcommaword : std_logic_vector(9 downto 0) := "0101111100";
  
  -- component dec_8b10b
  --   port(
  --     RESET : in std_logic ;	-- Global asynchronous reset (AH) 
  --     RBYTECLK : in std_logic ;	-- Master synchronous receive byte clock
  --     AI, BI, CI, DI, EI, II : in std_logic ;
  --     FI, GI, HI, JI : in std_logic ; -- Encoded input (LS..MS)		
  --     KO : out std_logic ;	-- Control (K) character indicator (AH)
  --     HO, GO, FO, EO, DO, CO, BO, AO : out std_logic 	-- Decoded out (MS..LS)
  --     );
  -- end component;
  
begin  -- RTL
  
  input_data_latch : for ii in 0 to NUMBER_OF_BYTES_IN_A_WORD-1 generate
  begin
    process (CLK_IN)
    begin
      if rising_edge(CLK_IN) then
        rx_10bit_data_i(ii)(7 downto 0) <= RX_DATA_IN((ii+1)*8-1 downto ii*8);
        rx_10bit_data_i(ii)(8) <= RX_CTRL0_IN(ii);
        rx_10bit_data_i(ii)(9) <= RX_CTRL1_IN(ii);
      end if;
    end process;
  end generate;
  
  output_data_latch : for ii in 0 to NUMBER_OF_BYTES_IN_A_WORD-1 generate
    signal index_i : integer;
  begin
    index_i <= ((ii+word_boundary_phase_i) mod NUMBER_OF_BYTES_IN_A_WORD);
    process (CLK_IN)
    begin
      if rising_edge(CLK_IN) then
        if ii<=word_boundary_phase_i then
          DECODED_DATA_OUT((ii+1)*8-1 downto ii*8) <= rx_8bit_data_buf_i(index_i);
          DECODED_CHARISK_OUT(ii) <= rx_isk_buf_i(index_i);
          DECODED_ISCOMMA_OUT(ii) <= rx_isComma_buf_i(index_i);
        else
          DECODED_DATA_OUT((ii+1)*8-1 downto ii*8) <= rx_8bit_data_i(index_i);
          DECODED_CHARISK_OUT(ii) <= rx_isk_i(index_i);
          DECODED_ISCOMMA_OUT(ii) <= rx_isComma_i(index_i);
        end if;
      end if;
    end process;
  end generate;
  
  -- latch output data 
  process (CLK_IN)
  begin
    if rising_edge(CLK_IN) then
      RXSLIDE_OUT <= rxslide_i or rxslide_r;
      LOCK_OUT <= and_reduce(lock_counter_i);
      COMMA_PULSE_OUT <= rxcommadet_i;
    end if;
  end process;
  
  shift_registers : for ii in 0 to NUMBER_OF_BYTES_IN_A_WORD-1 generate
  begin
    process (CLK_IN)
    begin
      if rising_edge(CLK_IN) then
        rx_8bit_data_buf_i(ii) <= rx_8bit_data_i(ii);
        rx_isk_buf_i(ii) <= rx_isk_i(ii);
        rx_isComma_buf_i(ii) <= rx_isComma_i(ii);
      end if;
    end process;
  end generate;

  is_comma_decoders : for ii in 0 to NUMBER_OF_BYTES_IN_A_WORD-1 generate
  begin
    process (CLK_IN)
    begin
      if rising_edge(CLK_IN) then
        if ((rx_10bit_data_i(ii)=mcommaword) or (rx_10bit_data_i(ii)=pcommaword)) then rx_isComma_i(ii) <= '1';
        else rx_isComma_i(ii) <= '0'; end if;        
      end if;
    end process;    
  end generate;

  decoders_8b10b : for ii in 0 to NUMBER_OF_BYTES_IN_A_WORD-1 generate
  begin
    dec_8b10b_byte_0_i : entity work.dec_8b10b
      port map (
        RESET => RESET,
        RBYTECLK => CLK_IN,
        AI=>rx_10bit_data_i(ii)(0),
        BI=>rx_10bit_data_i(ii)(1),
        CI=>rx_10bit_data_i(ii)(2),
        DI=>rx_10bit_data_i(ii)(3),
        EI=>rx_10bit_data_i(ii)(4),
        II=>rx_10bit_data_i(ii)(5),
        FI=>rx_10bit_data_i(ii)(6),
        GI=>rx_10bit_data_i(ii)(7),
        HI=>rx_10bit_data_i(ii)(8),
        JI=>rx_10bit_data_i(ii)(9),
        KO=>rx_isk_i(ii),
        HO=>rx_8bit_data_i(ii)(7),
        GO=>rx_8bit_data_i(ii)(6),
        FO=>rx_8bit_data_i(ii)(5),
        EO=>rx_8bit_data_i(ii)(4),
        DO=>rx_8bit_data_i(ii)(3),
        CO=>rx_8bit_data_i(ii)(2),
        BO=>rx_8bit_data_i(ii)(1),
        AO=>rx_8bit_data_i(ii)(0)
        );
  end generate;
  
  -- comma/error detection
  process (CLK_IN)
  begin
    if rising_edge(CLK_IN) then
      rxslide_r <= rxslide_i;
      
      if (RESET='1') then
        counter_i <= 0;
        rxcommadet_i <= '0';
        lock_counter_i <= (others => '0');
        rxslide_i <= '0';
        word_boundary_phase_i <= 0;
        waiting_i <= '0';
      else        
        if (or_reduce(rx_isComma_i)='1') then
          -------------------
          -- comma detection, if the frequency is as expected, lock_counter is
          -- incremented
          -------------------
          rxcommadet_i <= '1';
          rxslide_i <= '0';
          counter_i <= 0;
          
          -- increment lock counter
          if (counter_i=NUMBER_OF_WORDS_IN_A_PACKET-1 and and_reduce(lock_counter_i)='0') then
            lock_counter_i <= lock_counter_i + 1;
          end if;
          
          -- ========================================================
          -- set phase
          -- hardcoded part, depending on NUMBER_OF_WORDS_IN_A_PACKET
          if    (rx_isComma_i(0)='1')    then word_boundary_phase_i <= 0;
          elsif (rx_isComma_i(1)='1')    then word_boundary_phase_i <= 1;
          elsif (rx_isComma_i(2)='1')    then word_boundary_phase_i <= 2;
          else word_boundary_phase_i <= 3; end if;
          -- ========================================================
          
          if (waiting_i='1') then
            if (and_reduce(wait_counter_i)='1') then
              waiting_i <= '0';
              wait_counter_i <= (others => '0');
            else
              wait_counter_i <= wait_counter_i+1;
            end if;
          end if;
          
        elsif (counter_i=NUMBER_OF_WORDS_IN_A_PACKET) then
          -------------------
          -- if counter gets NUMBER_OF_WORDS_IN_A_PACKET without detecting
          -- comma, then reset
          -------------------          
          counter_i <= 0;
          rxcommadet_i <= '0';
          lock_counter_i <= (others => '0');
          
          if (waiting_i='0') then
            rxslide_i <= '1';
            waiting_i <= '1';
          else
            rxslide_i <= '0';
            if (and_reduce(wait_counter_i)='1') then
              waiting_i <= '0';
              wait_counter_i <= (others => '0');
            else
              wait_counter_i <= wait_counter_i+1;
            end if;          
          end if;
          
          -- other cases
        else
          -------------------
          -- to handle signals when not detecting comma words
          -------------------          
          rxcommadet_i <= '0';        
          rxslide_i <= '0';
          counter_i <= counter_i+1;
          if (waiting_i='1') then
            if (and_reduce(wait_counter_i)='1') then
              waiting_i <= '0';
              wait_counter_i <= (others => '0');
            else
              wait_counter_i <= wait_counter_i+1;
            end if;
          end if;        
        end if;
      end if;
    end if;
  end process;
  
end RTL;


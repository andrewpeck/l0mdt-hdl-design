-- Reads in the standard rx files, converts into lwords

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all; 

entity sf_file_read is
generic (
    filename : string :=  "test.txt";
    		-- Width of S_AXI data bus
    C_S_AXI_DATA_WIDTH    : integer    := 32;
    C_M_AXIS_TDATA_WIDTH : integer := 32
    );
port
(
  clk_i  : in	std_logic;
  rst_i  : in   std_logic;
  en_i   : in   std_logic;
  first  : in  std_logic;
  d      : out  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
  dv     : out std_logic;
  last   : out std_logic
);
	
end sf_file_read;

architecture Behavioral of sf_file_read is
                                   
    signal en_d : std_logic;
    signal init : boolean;
--    signal end_line : boolean;
    signal s_start, s_start_d  : std_logic := '0';
     
begin

    en: process(clk_i)
    begin
        if rising_edge(clk_i) then
          en_d <= en_i;
        end if;
    end process;


    reading_proc : process(all)
    
        file infile: text;
        variable inline : line;
        variable infile_status : FILE_OPEN_STATUS;
        variable ln, lp : integer := 0;
        variable hex_data : std_ulogic_vector(31 downto 0);
        variable raw_data    : character;          	
        variable end_line : boolean;
        
    begin
    
        if rising_edge(clk_i) then    
	    s_start_d <= s_start;
        
            if  (en_i = '1') and (en_d = '0') then
                if first = '1' then
                    file_open(infile_status, infile, filename, read_mode);
                end if;
                init <= true;
                d <= (others => '0');
                dv <= '0';
                last <= '0';
                s_start <= '1';
		
            
--            elsif  (en_i = '0') and (en_d = '1') then
            
--                file_close(infile);
                
            
            elsif en_i = '1' then  

		        s_start <= '0';
--                        end_file <= endfile(infile);

                if endfile(infile) = false then 
                
                    if init = true then
--                        for i in 0 to 3 loop -- 2 loop (need to skip valid 0s)
                            readline(infile, inline); -- skips header crap
--                        end loop;
                    end if;                                        
                
                    init <= false;          
                                   
--                    readline(infile, inline);
                    
                    if inline'length > 0 then 
                    
                        -- raw data structure:
                        -- Frame XXXX : (bool)vXXXXXXXX (bool)vXXXXXXXX ...
--                        for i in 0 to 12 loop                  
--                            read(inline, raw_data); -- skips Frame XXXX : 
----                            report "read data = " & raw_data;
--                        end loop;
                      
 
                        
                        hread(inline, hex_data, end_line);
                        read(inline, raw_data);
                        d <= hex_data;
                        dv <= '1';
                        -- End of line
                        if end_line = false then
                            last <= '1';
                            d <= (others => '0');
                            dv <= '1';
--                                                        init <= true;

                        else 
                            last <= '0';
                        end if;
--                        for j in 0 to (N_REGION * 4)  - 1 loop 
                            
--                            d(j).strobe <= '1';
--                            d(j).start <= s_start and not s_start_d; 
                            
--                            read(inline, raw_data);
--                            if raw_data = '1' then
--                                d(j).valid <= '1';
--                            elsif raw_data = '0' then
--                                d(j).valid <= '0';
--                            else
--                                report "Error on word number " & to_string(j) & "! Data valid = " & raw_data;
--                            end if;
                        
--                              read(inline, raw_data); -- skips v
----                              report "Should be 'v'  = " & raw_data;
--                              hread(inline, hex_data);
----                              report "Hex word  = " & to_string(hex_data);
--                              d(j).data <= hex_data;
--                              read(inline, raw_data); -- skips space
                              
                          
--                        end loop;
                    
                    else
                        d <= (others => '0');
                        dv <= '0';
                        last <= '0';
--                        for k in 0 to (N_REGION * 4 - 1) loop
                        
--                            d(k) <= LWORD_NULL; 
                        
--                        end loop; 
                    
                    end if; 
                else
                     d <= (others => '0');
                        dv <= '0';
                        last <= '0';

--                    for k in 0 to (N_REGION * 4 - 1) loop
                
--                        d(k) <= LWORD_NULL; 
                
--                    end loop;  
                     
                end if;                 
            
            else
                d <= (others => '0');
                                  dv <= '0';

--                for k in 0 to (N_REGION * 4 - 1) loop
                
--                    d(k) <= LWORD_NULL; 
                
--                end loop; 

            end if; 
        
        end if;
    
    end process;

end Behavioral;

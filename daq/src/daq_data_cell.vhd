library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library daq_lib;
use daq_lib.daq_devel_defs_pkg.all;
use daq_lib.daq_defs_pkg.all;
use daq_lib.daq_row_defs_pkg.all;

library ttc_lib;
use ttc_lib.ttc_defs_pkg.all;

package daq_data_cell_pkg is
  component daq_data_cell is
    generic(G: cell_generics_rt);
    port (i: in cell_irt; o: out cell_ort);
  end component daq_data_cell;
end package daq_data_cell_pkg;

-----------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library daq_lib;
use daq_lib.daq_devel_defs_pkg.all;
use daq_lib.daq_defs_pkg.all;
use daq_lib.daq_row_defs_pkg.all;

library ttc_lib;
use ttc_lib.ttc_defs_pkg.all;

entity daq_data_cell is
  generic(G: cell_generics_rt := (INPUT_DATA_LEN => 511,
                                  COUNTER_LEN => 16));
  port (i : in cell_irt; o : out cell_ort);
end entity daq_data_cell;

architecture V2 of daq_data_cell is

  -- window information should be registered when process starts since
  -- other cells will be configured whenever a new request arrives.
  signal win_lower : bcid_t;
  signal win_width : bcid_t;

  -- some internal control signals ---------------------------------------------

  --   done active   busy     en : status
  --      0      0      0      0 : idle
  --      0      0      0      1 : window configuration (1 clk)
  --      0      0      1      1 : waiting for window to open
  --      0      1      1      1 : data gathering in process (window is open)
  --      1      1      1      1 : gathering is finished (data to be retrieved)
  signal done : std_logic := '0';
  signal busy : std_logic := '0';
  signal active : std_logic := '0';

  -- payload signals are delayed to allow window comparison
  -- signal wr_en : std_logic;
  -- signal stream_bcid_r    : bcid_t;
  signal payload_d : stream_rt;

  -- FIFO related signals ------------------------------------------------------

  -- empty signal is needed since we work with data available instead
  signal fifo_empty : std_logic;

  -- counter signal for bit length adjustment
  signal fifo_counter : std_logic_vector(DEV_LXA_REQ_COUNTER_WIDTH-1 downto 0);

  -- data signal for bit length adjustment
  signal fifo_data_in : std_logic_vector(DEV_LXA_REQ_DATA_BUS_WIDTH-1 downto 0);
  signal fifo_data_out : std_logic_vector(DEV_LXA_REQ_DATA_BUS_WIDTH-1 downto 0);

  -- This FIFO keeps the selected data until the package builder is
  -- able to retrieve it.
  component data_fifo
  port (
    clk : in std_logic;
    srst : in std_logic;
    din : in std_logic_vector(DEV_LXA_REQ_DATA_BUS_WIDTH-1 downto 0);
    wr_en : in std_logic;
    rd_en : in std_logic;
    dout : out std_logic_vector(DEV_LXA_REQ_DATA_BUS_WIDTH-1 downto 0);
    full : out std_logic;
    empty : out std_logic;
    data_count : out std_logic_vector(DEV_LXA_REQ_COUNTER_WIDTH-1 downto 0)
  );
  end component;
  
begin

  -- FIFO ----------------------------------------------------------------------

  data_fifo_u : component data_fifo port map (
    clk           => i.sys.clk320,    -- : IN STD_LOGIC;
    srst          => i.sys.rst,       -- : IN STD_LOGIC;
    din           => fifo_data_in,    -- : IN STD_LOGIC_VECTOR;
    wr_en         => payload_d.valid, -- : IN STD_LOGIC;
    rd_en         => i.bconv.rd_strb, -- : IN STD_LOGIC;
    dout          => fifo_data_out,   -- : IN STD_LOGIC_VECTOR;
    full          => o.mngt.full,     -- : OUT STD_LOGIC;
    empty         => fifo_empty,      -- : OUT STD_LOGIC;
    data_count    => fifo_counter     -- : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
  );

  -- generate non-empty signal
  o.bconv.nempty <= not fifo_empty;

  -- converting widths
  o.bconv.counter(fifo_counter'range) <= fifo_counter; 
  o.bconv.data <= fifo_data_out(o.bconv.data'range);
  fifo_data_in(payload_d.data'range) <= payload_d.data;
  
  -- Logic ---------------------------------------------------------------------
  
  -- done output
  -- done_o <= done;
  o.mngt.done <= done;
  

  -- storing data
  process (i.sys.clk320)
  begin
    if rising_edge(i.sys.clk320) then
      
      -- Whenever the processing cell is disabled, it must be in the
      -- reset state: not busy, not active, not done, and no errors.
      if i.mngt.en = '0' then
        busy   <= '0';
        active <= '0';
        done   <= '0';
        o.mngt.full <= '0';
        o.mngt.unexpected <= '0';

      -- When cell is enabled, load the window limit values and start
      -- gathering.
      else

        -- `busy` signal ensures that window limits are loaded just
        -- once. It is assumed that window limits will be configured
        -- before data comes, the overhead of a fast clock should not
        -- impact on latency.
        if busy = '0' and done = '0' then
          win_lower <= i.mngt.win_lower;
          win_width <= i.mngt.win_width;
          busy <= '1';
        end if;

        -- With window configured and while window is open, data
        -- should be gathered.
        if busy = '1' and win_width > 0 then

          -- look for lower edge of the window. If found, open window
          -- and start recording data. After that point, all data is
          -- forwarded to the FIFOs
          if i.stream.bcid = win_lower then
            active <= '1';
            payload_d.valid <= i.stream.valid;
            payload_d.data <= i.stream.data;
            payload_d.bcid <= i.stream.bcid;
          end if;

          -- if window is active, decrement window width in the case
          -- of changed bcid and keep recording data. Deactivate
          -- window when finished and set done.
          if active = '1' then

            -- Window width cannot be decremented for every clock. It
            -- should count the actual BCID values passing through.
            -- It cannot be compared with bcid+1 due to bcid wrapping.
            if i.stream.bcid /= payload_d.bcid then
              win_width <= win_width - 1;
            end if;

            -- When width is greater than 1, all data should be
            -- forwarded. If it is 1, the data should be forwarded
            -- only if bcid did not change. Width of 0 is not allowed
            -- here.
            if win_width > 1
              or (win_width = 0 and i.stream.bcid = payload_d.bcid) then
              payload_d.valid <= i.stream.valid;
              payload_d.data <= i.stream.data;
              payload_d.bcid <= i.stream.bcid;
            else
              o.mngt.unexpected <= '1';
            end if;              

          end if;
          
        elsif busy = '1' and win_width = 0 then
          done <= '1';
        end if;        
      end if;

      ----   ----------------
      ----   
      ---- 
      ----   if busy = '1' and done = '0' then
      ---- 
      ----     -- look for lower edge of the window. If found, open window
      ----     -- and start recording data
      ----     if stream_bcid_i = win_lower then
      ----       active <= '1';
      ----       wr_en <= stream_wren_i;
      ----       payload <= stream_payload_i;
      ----       stream_bcid_r <= stream_bcid_i;
      ----     end if;
      ---- 
      ----     if active = '1'
      ----       and stream_bcid_i /= stream_bcid_r
      ----       and win_width > 0 then
      ----     end if; 
      ---- 
      ----     
      ----     -- if window is active, decrement width and keep recording
      ----     -- data. Deactivate window when finished and set done.
      ----     if active = '1' and win_width > 0 then
      ---- 
      ----       -- window width cannot be decremented in a row. It should
      ----       -- actually count the BCID values passing through.
      ----       if stream_bcid_i /= stream_bcid_r then
      ----         win_width <= win_width - 1;
      ----       end if;
      ---- 
      ----       -- when width is greater than 1, all data should be
      ----       -- stored. If it is 1 (cannot be 0), store data only if
      ----       -- bcid did not change.
      ----       if win_width > 1 then
      ----         wr_en <= stream_wren_i;
      ----         payload <= stream_payload_i;
      ----         stream_bcid_r <= stream_bcid_i;
      ----       elsif stream_bcid_i = stream_bcid_r then
      ----         wr_en <= stream_wren_i;
      ----         payload <= stream_payload_i;
      ----         stream_bcid_r <= stream_bcid_i;
      ----       end if;              
      ---- 
      ----       
      ----     elsif busy = '1' and done = '1' then
      ----       active <= '0';
      ----       done <= '1';
      ----     end if;
      ---- 
      ----   end if; -- busy = '1' and done = '0'
      ---- 
      ---- -- whenever the processing cell is disabled, the done signal
      ---- -- must be reset.
      ---- else
      ----   done <= '0';
      ----   busy <= '0';
      ---- end if;
      
    end if;
  end process;
  
end V2;

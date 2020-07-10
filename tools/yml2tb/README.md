# Yaml2tb test bench generator

This is a set of tools which generate a simple VHDL testbench for a
specified entity.  The testbench will attach an input or output text
file to each VHDL port on the UUT (unit under test), which must be
written in VHDL and presented as a single VHDL entity.

There are 3 steps in the process:

1.  Read YAML files as described here:
    https://gitlab.com/tcpaiva/yml2hdl <br>
	Write to a simple database file e.g. ```types.db```
2.  Read the database and generate a VHDL library with overloaded
    *READ* and *WRITE* methods for each type described in the YAML.
3.  Read a VHDL entity declaration and create a testbench

Each step and it's associated tool will now be described in more
detail.

## YAML Parsing

### ymldump.pl

```ymldump.pl``` usage:

```
  $ ./ymldump.pl ...path/*.yml ...path/*.yml -d        # dump data
  $ ./ymldump.pl ...path/*.yml ...path/*.yml types.db  # write to db
```

"Synthesizable types" in YAML are defined currently as *unsigned*, *signed*
or *logic* (std_logic).  The first two occur only as vectors, while the last
may be a vector (std_logic_vector) or scalar (std_logic).

Each YAML file is assumed to consist of a top-level unordered list
of elements, each of which may be:

* An *integer* or *real* constant
* An array of a custom type defined elswhere in the YAML
* A record, with elements in an ordered list, where each is one of:
   * A scalar of std_logic
   * A vector of any synthesizable type
   * A scalar of a custom type defined elsewhere in the YAML
 
The hierarchy described in the YAML is two-level only.

The output database is organized slightly differently, and is documented
here for completeness.  The top-level is again an ordered list.  Each item
has the following attributes:

``` 
 'class' => 'constant'                A Constant
     'value' => (value)                 value only for constants
	 'type' => 'integer' or 'real'      type must be one of these
  'class' => 'array'                  An array
     'size' => 'open' or size
	 'type' => (custom time)            must be a custom type
  'class' => 'record'
    'members' => [ {member} {member} ... ]    ordered list of members
	   {
	     'name' => (name)
		 'type' => (type)   may be synthesizable or user-defined
		 'size' => 'scalar' or actual size
```

Top-level names are assumed to be unique.

### dump_db.pl

This script dumps the database for debugging.

```dump_db.pl``` usage:

```
  $ ./dump_db types.db
  $VAR1 = {
          'sf2pt_' => {
                        'type' => 'sf2pt',
                        'size' => 'open',
                        'class' => 'array'
                      },
          'mdt_tdc' => {
                         'members' => [
                                        {
                                          'type' => 'std_logic_vector',
                                          'size' => 'MDT_TDC_CH_LEN',
                                          'name' => 'ch'
                                        },
                                        {
                                          'size' => 'MDT_TDC_MODE_LEN',
                                          'type' => 'std_logic_vector',
                                          'name' => 'mode'
                                        },

	       ...
```

### yamlquery.pl

This script queries the database and returns a flattened list of all
elements in a user-defined type.

```yamlquery.pl``` usage:

```
  $ ./yamlquery.pl <database> <name> [<name>...] [-d]
```

For example:

```
  $ ./yamlquery.pl types.db mdt_polmux
     fiberID std_logic_vector(MDT_FIBER_LEN-1 downto 0)
     muxID std_logic_vector(MDT_MUXCH_LEN-1 downto 0)
     ch std_logic_vector(MDT_TDC_CH_LEN-1 downto 0)
     mode std_logic_vector(MDT_TDC_MODE_LEN-1 downto 0)
     coarse unsigned(MDT_TDC_COARSE_LEN-1 downto 0)
     fine unsigned(MDT_TDC_FINE_LEN-1 downto 0)
     pw unsigned(MDT_TDC_PW_LEN-1 downto 0)
     data_valid std_logic
```	 

This lists (in the order specified in the YAML source) all the synthesizable
elements in the type.  This can be used *e.g.* to generate find the list of
items which must be included in a test vector file for a given type.

```	 
  $ ./yamlquery.pl types.db mdt_polmux -d
   mdt_polmux is record 
     fiberID is std_logic_vector(MDT_FIBER_LEN-1 downto 0)*
     muxID is std_logic_vector(MDT_MUXCH_LEN-1 downto 0)*
      mdt_tdc is record 
        ch is std_logic_vector(MDT_TDC_CH_LEN-1 downto 0)*
        mode is std_logic_vector(MDT_TDC_MODE_LEN-1 downto 0)*
        coarse is unsigned(MDT_TDC_COARSE_LEN-1 downto 0)*
        fine is unsigned(MDT_TDC_FINE_LEN-1 downto 0)*
        pw is unsigned(MDT_TDC_PW_LEN-1 downto 0)*
     data_valid is std_logic*
```

The ```-d``` (debug) option displays an indented hierarchical list.

### yaml

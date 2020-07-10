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

```ymldump.pl``` usage:

```
  $ ./ymldump.pl ...path/*.yml ...path/*.yml -d1       # dump data
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

  'class' => 'constant'               (constant)
     'value' => (value)               (value only for constants)
	 'type' => 'integer' or 'real'
  'class' => 'array'
     'size' => 'open' or size
	 'type' => (custom time)
  'class' => 'record'
    'members' => [ {member} {member} ... ]    ordered list of members
	   {
	     'name' => (name)
		 'type' => (type)   may be synthesizable or user-defined
		 'size' => 'scalar' or actual size

 

 
 

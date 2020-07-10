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


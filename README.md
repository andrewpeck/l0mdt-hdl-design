# l0mdt-fpga-design

This repository holds all the FPGA design for the L0MDT (MDTTP) project. It
uses the Hog framework, which allows multiple top files and automated building.

This repository is expected to have a mix of HDL approaches: VDHL, Verilog (and 
family), HLS

## Some instructions to simulate and implement the code

... TBD

## Simplified coding rules

- Maximum length of 100 characters per line

- If more than one condition is needed in a code branching, each next condition
must have its own line starting with the comparison operator.

- Signal name suffixes (more than one suffix may apply):
    
    - i: input
    
    - o: output
    
    - v: variable
    
    - aN: meaningful array with dimension N
    
    - r: record
    
    - p, n: polarity
    
    - b: inverted
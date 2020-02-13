import argparse
import sys, os, csv
from math import *

def main():
    parser = argparse.ArgumentParser(description='Write Reciprocal ROM coe file')
    parser.add_argument("-i","--input", type=str, help="Input File")
    parser.add_argument("-o","--output",type=str,help="Output Dir", default="VHDL")
    parser.add_argument("--sagitta_mult",type=float,help="Sagitta Multiplier", default=64.0)
    parser.add_argument("--phi_mult",type=float,help="Phi Multiplier", default=2**6/0.6)
    parser.add_argument("--eta_mult",type=float,help="Eta Multiplier", default=2**10/0.6)
    parser.add_argument("--pt_mult",type=float,help="pT Multiplier", default=100.0)

    args = parser.parse_args()

    if not os.path.exists(args.output):
        os.mkdir(args.output)

    reciprocal_rom_file = open(args.output + '/reciprocalROM.coe', "w")
    sqrt_m_io_rom_file  = open(args.output + '/sqrt_m_io_ROM.coe', "w")

    reciprocal_rom_file.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")
    sqrt_m_io_rom_file.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")
    divider_width = 21
    m_sagitta_width = 16;
    m_sagitta_range = 4.0;
    m_sagitta_multi = (2.0**m_sagitta_width/m_sagitta_range); 

    for x in xrange(0,2**16-1):
        reciprocal = int(floor(2**divider_width/(x + 0.5)));
        if x ==0:
            reciprocal = int(floor(2**divider_width/(x + 1.)));

        reciprocal_rom_file.write("%d,\n" % reciprocal)
        sqrt_m_io = int(floor(sqrt(m_sagitta_multi**2 + x**2)));
        sqrt_m_io_rom_file.write("%d,\n" % sqrt_m_io)

    reciprocal_rom_file.write("0; \n")
    sqrt_m_io_rom_file.write("0; \n")

if __name__ == "__main__":
    main()


import argparse
import sys, os, csv
from math import *

def main():
    parser = argparse.ArgumentParser(description='Write CSF firmware ROM coe files')
    parser.add_argument("-i","--input", type=str, help="Input File")
    parser.add_argument("-o","--output",type=str,help="Output Dir", default="../data/")
    parser.add_argument("--mbar_width",type=int,help="SL slope m width", default=11)
    parser.add_argument("--mbar_multi",type=float,help="SL slope m multiplier", default=1024.0)
    parser.add_argument("--inv_sqrt_m_width", type=int, help="1/sqrt(1+mbar^2) width", default=18)

    args = parser.parse_args()

    if not os.path.exists(args.output):
        os.mkdir(args.output)

    invsqrt_mbar_rom = open(args.output + '/invsqrt_mbar_rom.coe', "w")
    invsqrt_mbar_rom.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")

    sqrt_mbar_rom = open(args.output + '/sqrt_mbar_rom.coe', "w")
    sqrt_mbar_rom.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")

    for x in xrange(0,2**args.mbar_width-1):
        invsqrt = int(floor(2**args.inv_sqrt_m_width/sqrt(args.mbar_multi**2 + x**2)))
        invsqrt_mbar_rom.write("%d,\n" % invsqrt)
        sqrt_mbar = int(floor(sqrt(args.mbar_multi**2 + x**2)))
        sqrt_mbar_rom.write("%d,\n" % sqrt_mbar)

    invsqrt_mbar_rom.write("0; \n")
    sqrt_mbar_rom.write("0; \n")

if __name__ == "__main__":
    main()
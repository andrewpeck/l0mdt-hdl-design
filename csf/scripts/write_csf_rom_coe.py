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
    parser.add_argument("--divider_width", type=int, help="divider width", default=22)
    parser.add_argument("--mfit_width", type=int,help="mfit width", default=15)
    parser.add_argument("--theta_glob_width", type=int,help="global theta width", default=15)
    parser.add_argument("--theta_glob_mult", type=float, help="global theta multiplier", default=4096.0)


    args = parser.parse_args()

    if not os.path.exists(args.output):
        os.mkdir(args.output)

    invsqrt_mbar_rom = open(args.output + '/invsqrt_mbar_rom.coe', "w")
    invsqrt_mbar_rom.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")

    sqrt_mbar_rom = open(args.output + '/sqrt_mbar_rom.coe', "w")
    sqrt_mbar_rom.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")

    reciprocal_rom = open(args.output + '/fitter_reciprocal_rom.coe', "w")
    reciprocal_rom.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")

    m_to_theta_rom = open(args.output + '/m_to_theta_rom.coe', "w")
    m_to_theta_rom.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")

    invsqrt_mbar_mem = open(args.output + '/invsqrt_mbar.mem', "w")
    sqrt_mbar_mem = open(args.output + '/sqrt_mbar.mem', "w")
    reciprocal_mem = open(args.output + '/fitter_reciprocal.mem', "w")
    m_to_theta_mem = open(args.output + '/m_to_theta.mem', "w")

    for x in xrange(0,2**args.mbar_width-1):
        invsqrt = int(floor(2**args.inv_sqrt_m_width/sqrt(args.mbar_multi**2 + x**2)))
        invsqrt_mbar_rom.write("%d,\n" % invsqrt)
        invsqrt_mbar_mem.write("%04X\n" % invsqrt)
        sqrt_mbar = int(floor(sqrt(args.mbar_multi**2 + x**2)))
        sqrt_mbar_rom.write("%d,\n" % sqrt_mbar)
        sqrt_mbar_mem.write("%04X\n" % sqrt_mbar)

    for x in xrange(0,2**16-1):
        reciprocal = int(floor(2**args.divider_width/(x + 0.5)));
        if x ==0:
            reciprocal = int(floor(2**args.divider_width/(x + 1.)));

        reciprocal_rom.write("%d,\n" % reciprocal)
        reciprocal_mem.write("%04X\n" % reciprocal)


    for x in range(0,2**args.theta_glob_width-1):
        m = -2**(args.theta_glob_width-1) + x + 0.5
        theta = int(floor( atan(args.theta_glob_mult/m)*args.theta_glob_mult ))
        m_to_theta_rom.write("%d,\n" % theta)
        m_to_theta_mem.write("%04X\n" % theta)


    reciprocal_rom.write("0;\n")
    invsqrt_mbar_rom.write("0; \n")
    sqrt_mbar_rom.write("0; \n")
    m_to_theta_rom.write("0; \n")

    reciprocal_mem.write("0000\n")
    invsqrt_mbar_mem.write("0000 \n")
    sqrt_mbar_mem.write("0000 \n")
    m_to_theta_mem.write("0000 \n")

if __name__ == "__main__":
    main()
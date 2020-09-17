import argparse
import sys, os, csv
from math import *


def main():
    parser = argparse.ArgumentParser(
        description='Write Reciprocal ROM coe file')
    parser.add_argument("-o",
                        "--output",
                        type=str,
                        help="Output Dir",
                        default="../src")
    parser.add_argument("--z_mult",
                        type=float,
                        help="z/r Multiplier",
                        default=8.0)
    parser.add_argument("--sagitta_mult",
                        type=float,
                        help="Sagitta Multiplier",
                        default=64.0)
    parser.add_argument("--phi_mult",
                        type=float,
                        help="Phi Multiplier",
                        default=2**6 / 0.6)
    parser.add_argument("--eta_mult",
                        type=float,
                        help="Eta Multiplier",
                        default=2048.0)
    parser.add_argument("--pt_mult",
                        type=float,
                        help="pT Multiplier",
                        default=100.0)
    parser.add_argument("--mag2_width",
                        type=int,
                        help="Mag2 width",
                        default=10)
    parser.add_argument("--z_width", type=int, help="z width", default=18)
    parser.add_argument("--mag2_shift",
                        type=int,
                        help="Mag2 shift",
                        default=28)

    args = parser.parse_args()

    if not os.path.exists(args.output):
        os.mkdir(args.output)

    reciprocal_rom_mem = open(args.output + '/reciprocalROM.mem', "w")
    sqrt_m_io_rom_mem = open(args.output + '/sqrt_m_io_ROM.mem', "w")
    mag_rom_mem = open(args.output + '/mag_ROM.mem', "w")
    halflog_rom_mem = open(args.output + '/halflog_ROM.mem', "w")

    divider_width = 21
    m_sagitta_width = 16
    m_sagitta_range = 4.0
    m_sagitta_multi = (2.0**m_sagitta_width / m_sagitta_range)
    mag_width = 19

    for x in xrange(0, 2**16 - 1):
        reciprocal = int(floor(2**divider_width / (x + 0.5)))
        if x == 0:
            reciprocal = int(floor((2**divider_width - 1) / (x + 1.)))

        sqrt_m_io = int(floor(sqrt(m_sagitta_multi**2 + x**2)))

        reciprocal_rom_mem.write("%04x\n" % reciprocal)
        sqrt_m_io_rom_mem.write("%04x\n" % sqrt_m_io)

    for x in xrange(0, 2**(args.mag2_width) - 1):
        mag = int(sqrt(x * 2**(args.mag2_shift / 2)))
        mag_rom_mem.write("%04x\n" % mag)

    # int(floor(0.5 * log((m_plus_z + 0.5) * pow(2, ETA_SHIFT_POS) / SEG_GPOS_MULTI) * MTC_ETA_MULTI));
    for x in xrange(0, 2**(args.z_width - args.mag2_shift / 4)):
        log_m = int(
            floor(0.5 * log(
                (x + 0.5) * 2**(args.mag2_shift / 4) / args.z_mult) *
                  args.eta_mult))
        # print("x: %d, log_m: %d" % (x, log_m))
        halflog_rom_mem.write("%04x\n" % log_m)

    reciprocal_rom_mem.write("0000")
    sqrt_m_io_rom_mem.write("0000")
    mag_rom_mem.write("0000")
    halflog_rom_mem.write("0000")


if __name__ == "__main__":
    main()

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
    parser.add_argument("--eta_shift", type=int, help="Eta shift", default=10)

    args = parser.parse_args()

    if not os.path.exists(args.output):
        os.mkdir(args.output)

    rec_sagitta_rom_mem = open(args.output + '/rec_sagitta.mem', "w")
    rec_dbeta_rom_mem = open(args.output + '/rec_dbeta.mem', "w")
    sqrt_m_io_rom_mem = open(args.output + '/sqrt_m_io_ROM.mem', "w")
    eta_BI_rom_mem = open(args.output + "/eta_BI.mem", "w")
    eta_BM_rom_mem = open(args.output + "/eta_BM.mem", "w")

    z_red_width = args.z_width - args.eta_shift
    divider_sagitta = 12
    divider_dbeta = 22
    dbeta_len = 14
    rec_sagitta_len = 10

    m_sagitta_len = 14
    m_sagitta_multi = 2.0**10

    BIL_SEC3_RHO = 4755.8234
    BML_SEC3_RHO = 6898.3570

    for beta in range(0, 2**dbeta_len - 1):
        reciprocal = int(floor(2**divider_dbeta / (beta + 0.5)))
        if beta == 0:
            reciprocal = int(floor((2**divider_dbeta - 1) / (beta + 1.)))
        rec_dbeta_rom_mem.write("%04x\n" % reciprocal)

    for den_sagitta in range(0, 2**rec_sagitta_len - 1):
        if den_sagitta == 0:
            reciprocal = int(
                floor((2**divider_sagitta - 1) / (den_sagitta + 1.)))
        else:
            reciprocal = int(floor((2**divider_sagitta - 1) / (den_sagitta)))

        rec_sagitta_rom_mem.write("%03x\n" % reciprocal)

    for m in range(0, 2**m_sagitta_len - 1):
        sqrt_m_io = int(floor(sqrt(m_sagitta_multi**2 + m**2)))
        sqrt_m_io_rom_mem.write("%04x\n" % sqrt_m_io)

    for z_digi in range(0, 2**(z_red_width) - 1):
        z = z_digi * 2**(args.eta_shift) / args.z_mult
        mag_BI = sqrt(z * z + BIL_SEC3_RHO * BIL_SEC3_RHO)
        eta_BI = 0.5 * log((mag_BI + z) / (mag_BI - z))
        eta_BI_digi = int(floor(eta_BI * args.eta_mult))
        eta_BI_rom_mem.write("%04x\n" % eta_BI_digi)

        mag_BM = sqrt(z * z + BML_SEC3_RHO * BML_SEC3_RHO)
        eta_BM = 0.5 * log((mag_BM + z) / (mag_BM - z))
        eta_BM_digi = int(floor(eta_BM * args.eta_mult))
        eta_BM_rom_mem.write("%04x\n" % eta_BM_digi)

    rec_sagitta_rom_mem.write("000")
    rec_dbeta_rom_mem.write("0000")
    sqrt_m_io_rom_mem.write("0000")
    eta_BI_rom_mem.write("0000")
    eta_BM_rom_mem.write("0000")


if __name__ == "__main__":
    main()

import argparse
import sys, os, csv, math


def main():
    parser = argparse.ArgumentParser(
        description='Write VHDL Parameters settings')
    parser.add_argument("-i", "--input", type=str, help="Input File")
    parser.add_argument("-s",
                        "--sector",
                        type=str,
                        help="Sector ID",
                        default="03")
    parser.add_argument("-v",
                        "--vhdl_out",
                        type=str,
                        help="Output File",
                        default="output.vhd")
    parser.add_argument("-o",
                        "--output",
                        type=str,
                        help="Output Dir",
                        default="../data")
    parser.add_argument("--sagitta_mult",
                        type=float,
                        help="Sagitta Multiplier",
                        default=16.0 / 2**15)
    parser.add_argument("--phi_mult",
                        type=float,
                        help="Phi Multiplier",
                        default=2**8 / 1.024)
    parser.add_argument("--eta_mult",
                        type=float,
                        help="Eta Multiplier",
                        default=2**14 / 5.4)
    parser.add_argument("--pt_mult",
                        type=float,
                        help="pT Multiplier",
                        default=512.0)

    args = parser.parse_args()

    if not os.path.exists(args.output):
        os.mkdir(args.output)

    a0_mem = open(args.output + '/a0.mem', "w")
    a1_mem = open(args.output + '/a1.mem', "w")
    a_combo_mem = open(args.output + "/a_combo.mem", "w")
    b0_mem = open(args.output + '/b0.mem', "w")
    b1_mem = open(args.output + '/b1.mem', "w")
    b2_mem = open(args.output + '/b2.mem', "w")
    c0_mem = open(args.output + '/c0.mem', "w")
    c1_mem = open(args.output + '/c1.mem', "w")
    combo_mem = open(args.output + "/combo.mem", "w")

    a0 = 0
    a1 = 0
    b0 = 0
    b1 = 0
    b2 = 0
    c0 = 0
    c1 = 0

    with open(args.input, "r") as param_file:
        reader = csv.reader(param_file, delimiter='\t')
        for row in reader:
            if args.sector in row[0]:
                pt_bin = int(row[2])
                combo = int(row[1])
                full_combo = 0
                full_combo |= int(row[1]) & 4095
                full_combo |= (int(row[2]) & 15) << 12

                a0 = int(round(float(row[3]) * args.pt_mult))
                a1 = int(
                    round(float(row[4]) * args.pt_mult * args.sagitta_mult))
                if pt_bin == 0:
                    print("combo %s a0 %f a1 %f" %
                          (row[0], float(row[3]), float(row[4])))
                    a0_mem.write("%08x\n" % a0)
                    a1_mem.write("%08x\n" % a1)
                    a_combo_mem.write("%04x\n" % combo)

                combo_mem.write("%04x\n" % full_combo)
                print("combo %s pt_bin %d b0 %f b1 %f b2 %f \n" %
                      (row[0], pt_bin, float(row[5]), float(
                          row[6]), float(row[7])))

                b0 = int(round(float(row[5]) * args.pt_mult))
                b1 = int(round(float(row[6]) * args.pt_mult / (args.phi_mult)))
                b2 = int(
                    round(float(row[7]) * args.pt_mult / (args.phi_mult**2)))
                c0 = int(round(float(row[8]) * args.pt_mult))
                c1 = int(round(float(row[9]) * args.pt_mult / args.eta_mult))

                b0_mem.write("%08x\n" % b0)
                b1_mem.write("%08x\n" % b1)
                b2_mem.write("%08x\n" % b2)

                c0_mem.write("%04x\n" % c0)
                c1_mem.write("%04x\n" % c1)

    a0_mem.write("0000")
    a1_mem.write("0000")
    b0_mem.write("0000")
    b1_mem.write("0000")
    b2_mem.write("0000")
    c0_mem.write("0000")
    c1_mem.write("0000")

    # print("a0_width: %d, a1_width: %d, b0_width: %d, b1_width: %d,  b2_width: %d, c0_width: %d, c1_width: %d" %
    #     (1 + math.ceil(math.log(a0, 2)), 1 + math.ceil(math.log(a1, 2)), 1 + math.ceil(math.log(b0, 2)), 1 + math.ceil(math.log(b1, 2)),
    #         1 + math.ceil(math.log(b2, 2)), 1 + math.ceil(math.log(c0, 2)), 1 + math.ceil(math.log(c1, 2)) )
    #     )


if __name__ == "__main__":
    main()

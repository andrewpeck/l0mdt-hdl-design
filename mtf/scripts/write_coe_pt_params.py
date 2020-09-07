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
                        default=2.0)

    TF_B_MULTI = 8.
    TF_C_MULTI = 8.

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
    a_combo_mem.write(
        "function acomboid_to_index_ram(comboid : unsigned) return std_logic_vector is\nvariable index : integer := 0;\nvariable addr : std_logic_vector(A_PARAMS_DEPTH_LEN-1 downto 0);\nbegin\n"
    )
    combo_mem.write(
        "function comboid_to_index_ram(comboid : unsigned) return std_logic_vector is\nvariable index : integer := 0;\nvariable addr : std_logic_vector(PARAMS_DEPTH_LEN-1 downto 0);\nbegin\n"
    )
    acombo_index = 0
    combo_index = 0

    with open(args.input, "r") as param_file:
        reader = csv.reader(param_file, delimiter='\t')
        for row in reader:
            if args.sector in row[0]:
                pt_bin = int(row[2])
                combo = int(row[1])
                full_combo = 0
                full_combo |= int(row[1]) & 4095
                full_combo |= (int(row[2]) & 15) << 12
                a0 = 0
                a1 = 0
                b0 = 0
                b1 = 0
                b2 = 0
                c0 = 0
                c1 = 0
                a0 |= int(round(float(row[3]) * args.pt_mult)) & 65535
                a1 |= (int(round(float(row[4]) * args.pt_mult)) & 65535)
                if pt_bin == 0:
                    a0_mem.write("%04x\n" % a0)
                    a1_mem.write("%04x\n" % a1)
                    a_combo_mem.write(
                        "if comboid = %d then\n index := %d;\nend if;\n" %
                        (combo, acombo_index))
                    acombo_index += 1
                combo_mem.write(
                    "if comboid = %d then\n index := %d;\nend if;\n" %
                    (full_combo, combo_index))
                combo_index += 1
                b0 |= int(round(
                    float(row[5]) * args.pt_mult * TF_B_MULTI)) & 65535
                if abs(float(row[5]) * args.pt_mult * TF_B_MULTI) > 65535:
                    print("b0 larger than ffff")

                b1 |= int(round(
                    float(row[6]) * args.pt_mult * TF_B_MULTI)) & 65535
                if abs(float(row[6]) * args.pt_mult * TF_B_MULTI) > 65535:
                    print("b1 larger than ffff")
                b2 |= int(round(
                    float(row[7]) * args.pt_mult * TF_B_MULTI)) & 65535
                if abs(float(row[7]) * args.pt_mult * TF_B_MULTI) > 65535:
                    print("b2 larger than ffff")
                c0 |= int(round(
                    float(row[8]) * args.pt_mult * TF_C_MULTI)) & 65535
                if abs(float(row[8]) * args.pt_mult * TF_C_MULTI) > 65535:
                    print("c0 larger than ffff")
                c1 |= int(round(
                    float(row[9]) * args.pt_mult * TF_C_MULTI)) & 65535
                if abs(float(row[9]) * args.pt_mult * TF_C_MULTI) > 65535:
                    print("c1 larger than ffff")

                b0_mem.write("%04x\n" % b0)
                b1_mem.write("%04x\n" % b1)
                b2_mem.write("%04x\n" % b2)

                c0_mem.write("%04x\n" % c0)
                c1_mem.write("%04x\n" % c1)

    a_combo_mem.write(
        "addr := std_logic_vector(to_unsigned(index, A_PARAMS_DEPTH_LEN));\nreturn addr;\nend function;"
    )

    combo_mem.write(
        "addr := std_logic_vector(to_unsigned(index, PARAMS_DEPTH_LEN));\nreturn addr;\nend function;"
    )

    # print("a0_width: %d, a1_width: %d, b0_width: %d, b1_width: %d,  b2_width: %d, c0_width: %d, c1_width: %d" %
    #     (1 + math.ceil(math.log(a0, 2)), 1 + math.ceil(math.log(a1, 2)), 1 + math.ceil(math.log(b0, 2)), 1 + math.ceil(math.log(b1, 2)),
    #         1 + math.ceil(math.log(b2, 2)), 1 + math.ceil(math.log(c0, 2)), 1 + math.ceil(math.log(c1, 2)) )
    #     )


if __name__ == "__main__":
    main()

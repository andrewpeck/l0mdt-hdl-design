import argparse
import sys, os, csv, math

def main():
    parser = argparse.ArgumentParser(description='Write VHDL Parameters settings')
    parser.add_argument("-i","--input", type=str, help="Input File")
    parser.add_argument("-s","--sector",type=str, help="Sector ID", default="03")
    parser.add_argument("-v","--vhdl_out",type=str, help="Output File", default="output.vhd" )
    parser.add_argument("-o","--output",type=str,help="Output Dir", default="VHDL")
    parser.add_argument("--sagitta_mult",type=float,help="Sagitta Multiplier", default=16.0/2**15)
    parser.add_argument("--phi_mult",type=float,help="Phi Multiplier", default=2**6/0.6)
    parser.add_argument("--eta_mult",type=float,help="Eta Multiplier", default=2**10/0.6)
    parser.add_argument("--pt_mult",type=float,help="pT Multiplier", default=100.0)

    args = parser.parse_args()

    if not os.path.exists(args.output):
        os.mkdir(args.output)

    a0_file = open(args.output + '/a0.coe', "w")
    a1_file = open(args.output + '/a1.coe', "w")
    b0_file = open(args.output + '/b0.coe', "w")
    b1_file = open(args.output + '/b1.coe', "w")
    b2_file = open(args.output + '/b2.coe', "w")
    c0_file = open(args.output + '/c0.coe', "w")
    c1_file = open(args.output + '/c1.coe', "w")

    a0_file.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")
    a1_file.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")
    b0_file.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")
    b1_file.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")
    b2_file.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")
    c0_file.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")
    c1_file.write("memory_initialization_radix = 10; \nmemory_initialization_vector = \n")

    a0 = 0; a1 = 0; b0 = 0; b1 = 0; b2 = 0; c0 = 0; c1 = 0

    with open(args.input,"r") as param_file:
        reader = csv.reader(param_file, delimiter='\t')
        for row in reader:
            # print(row)
            if args.sector in row[0]:
                if a0 < abs(int(round(float(row[2])*args.pt_mult))): 
                    a0 = int(round(float(row[2])*args.pt_mult))
                if a1 < abs(int(round(float(row[3])*args.pt_mult*args.sagitta_mult))): 
                    a1 = int(round(float(row[3])*args.pt_mult*args.sagitta_mult))
                if b0 < abs(int(round(float(row[4])*args.pt_mult))): 
                    b0 = int(round(float(row[4])*args.pt_mult))
                if b1 < abs(int(round(float(row[5])*args.pt_mult/args.phi_mult))): 
                    b1 = abs(int(round(float(row[5])*args.pt_mult/(args.phi_mult))))
                if b2 < abs(int(round(float(row[6])*args.pt_mult/(args.phi_mult**2)))): 
                    b2 = abs(int(round(float(row[6])*args.pt_mult/(args.phi_mult**2))))
                if c0 < abs(int(round(float(row[7])*args.pt_mult))): 
                    c0 = abs(int(round(float(row[7])*args.pt_mult)))
                if c1 < abs(int(round(float(row[8])*args.pt_mult/args.eta_mult))): 
                    c1 = abs(int(round(float(row[8])*args.pt_mult/args.eta_mult)))

                a0_file.write("%d,\n" % int(round(float(row[2])*args.pt_mult)))
                a1_file.write("%d,\n" % int(round(float(row[3])*args.pt_mult*args.sagitta_mult)))
                b0_file.write("%d,\n" % int(round(float(row[4])*args.pt_mult)))
                b1_file.write("%d,\n" % int(round(float(row[5])*args.pt_mult/args.phi_mult)))
                b2_file.write("%d,\n" % int(round(float(row[6])*args.pt_mult/(args.phi_mult**2))))
                c0_file.write("%d,\n" % int(round(float(row[7])*args.pt_mult)))
                c1_file.write("%d,\n" % int(round(float(row[8])*args.pt_mult/args.eta_mult)))

    a0_file.write("0; \n")
    a1_file.write("0; \n")
    b0_file.write("0; \n")
    b1_file.write("0; \n")
    b2_file.write("0; \n")
    c0_file.write("0; \n")
    c1_file.write("0; \n")

    print("a0_width: %d, a1_width: %d, b0_width: %d, b1_width: %d,  b2_width: %d, c0_width: %d, c1_width: %d" %
        (1 + math.ceil(math.log(a0, 2)), 1 + math.ceil(math.log(a1, 2)), 1 + math.ceil(math.log(b0, 2)), 1 + math.ceil(math.log(b1, 2)), 
            1 + math.ceil(math.log(b2, 2)), 1 + math.ceil(math.log(c0, 2)), 1 + math.ceil(math.log(c1, 2)) )
        )


if __name__ == "__main__":
    main()


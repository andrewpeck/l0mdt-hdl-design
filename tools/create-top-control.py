# -*- coding: utf-8 -*-
# @Author: Davide Cieri
# @Date:   2023-02-17 15:04:08
# @Last Modified by:   Davide Cieri
# @Last Modified time: 2023-02-17 15:10:54

import yaml
import argparse

# Define the command-line arguments
parser = argparse.ArgumentParser(
    description=
    "Script that processes input file and writes results to output file.")
parser.add_argument("input_file", help="Path to the input file.")
parser.add_argument("-template",
                    "-t",
                    help="Template control file",
                    default="HAL/ctrl/src/top_control_template.vhd")
parser.add_argument("-output_file",
                    "-o",
                    help="Output File",
                    default="control.vhd")
# parser.add_argument("output_file", help="Path to the output file.")

# Parse the command-line arguments
args = parser.parse_args()

# Access the input and output file paths
input_file_path = args.input_file
output_file_path = args.output_file

# Use the input and output file paths in your script
# For example, to read the contents of the input file and write it to the output file:
with open(input_file_path, "r") as input_file:
    data = yaml.safe_load(input_file)

if "AXI_SLAVES" in data:
    ## Loop into slaves.yml to find the AXI slaves in the project
    for slave in data["AXI_SLAVES"]:
        if data["AXI_SLAVES"][slave]["TCL_CALL"][
                "command"] == "AXI_PL_DEV_CONNECT":
            print(slave)
else:
    print("ERROR: Input yml file does not contain any AXI slave!")
    exit(1)

# with open(output_file_path, "w") as output_file:
#     output_file.write(str(data))

# Extract values
# tcl_call = data["HOG"]["TCL_CALL"]
# command = tcl_call["command"]
# axi_control = tcl_call["axi_control"]
# remote_slave = tcl_call["remote_slave"]
# addr_offset = tcl_call["addr"]["offset"]
# addr_range = tcl_call["addr"]["range"]
# uhal_base = data["HOG"]["UHAL_BASE"]
# xml = data["HOG"]["XML"]
# hdl = data["HOG"]["HDL"]
# out_name = hdl["out_name"]
# map_template = hdl["map_template"]

# # Print extracted values
# print(f"Command: {command}")
# print(f"AXI control: {axi_control}")
# print(f"Remote slave: {remote_slave}")
# print(f"Address offset: {addr_offset}")
# print(f"Address range: {addr_range}")
# print(f"UHAL base: {uhal_base}")
# print(f"XML file: {xml}")
# print(f"HDL out name: {out_name}")
# print(f"HDL map template: {map_template}")

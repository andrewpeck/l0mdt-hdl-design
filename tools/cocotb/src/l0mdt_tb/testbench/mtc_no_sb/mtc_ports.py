
##################################################
# autogenerated file
# created by tb create on: 03-Jun-2020 (10:30:39)
# created by tb create for test: mtc_no_sb
##################################################

import enum

from l0mdt_tb.utils import port_descriptor


class MtcPorts(port_descriptor.PortDescriptor):
	def __init__(self):
		super().__init__()

	n_output_interfaces=1

	def n_input_interfaces(self):
		return 2

	def get_input_interface_ports(interface):
                ports = [3,3]
                return ports[interface]

	def get_all_input_interface_ports():
                ports = [3,3]
                return ports

	def get_output_interface_ports(interface):
                ports = [3]
                return ports[interface]

	def get_all_output_interface_ports():
                ports = [3]
                return ports

	def total_output_ports():
                return 3
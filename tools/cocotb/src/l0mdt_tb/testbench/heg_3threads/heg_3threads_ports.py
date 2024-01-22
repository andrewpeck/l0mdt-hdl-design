
##################################################
# autogenerated file
# created by tb create on: 23-Oct-2023 (04:40:23)
# created by tb create for test: heg_3threads
# Author:Priya Sundararajan
# Email:priya.sundararajan@cern.ch
##################################################

import enum

from l0mdt_tb.utils import port_descriptor


class Heg3threadsPorts(port_descriptor.PortDescriptor):
	def __init__(self):
		super().__init__()


	n_input_interfaces = 2

	n_output_interfaces = 2

	def get_input_interface_ports(self, interface):
		input_ports = [3, 6]
		return input_ports[interface]

	def get_all_input_interface_ports(self ):
		input_ports = [3, 6]
		return input_ports

	def get_output_interface_ports(self, interface):
		output_ports = [3, 3]
		return output_ports[interface]

	def get_all_output_interface_ports(self ):
		output_ports = [3, 3]
		return output_ports

	def n_input_ports(self):
		input_ports = 0
		for i in range(self.n_input_interfaces):
			input_ports = input_ports + self.get_input_interface_ports(i)
		return input_ports
	def n_output_ports(self):
		output_ports = 0
		for i in range(self.n_output_interfaces):
			output_ports = output_ports + self.get_output_interface_ports(i)
		return output_ports


##################################################
# autogenerated file
# created by tb create on: 12-Oct-2021 (14:14:59)
# created by tb create for test: csf
# Author:Priya Sundararajan
# Email:priya.sundararajan@cern.ch
##################################################

import enum

from l0mdt_tb.utils import port_descriptor


class CsfPorts(port_descriptor.PortDescriptor):
	def __init__(self):
            super().__init__()


	n_input_interfaces = 3

	n_output_interfaces = 1

	def get_input_interface_ports(self,interface):
		input_ports = [1, 1, 1]
		return input_ports[interface]

	def get_all_input_interface_ports(self,):
		input_ports = [1, 1, 1]
		return input_ports

	def get_output_interface_ports(self,interface):
		output_ports = [1]
		return output_ports[interface]

	def get_all_output_interface_ports(self,):
		output_ports = [1]
		return output_ports

	def n_input_ports(self):
		input_ports = 0
		for i in range(self.n_input_interfaces):
			input_ports = input_ports + self.get_input_interface_ports(i)
		return input_ports
	def n_output_ports(self):
		output_ports = 0
		for i in range(self.n_output_interfaces):
			output_ports = output_ports + self.n_output_interfaces
		return output_ports

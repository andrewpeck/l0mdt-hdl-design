
##################################################
# autogenerated file
# created by tb create on: 19-Jun-2020 (09:22:45)
# created by tb create for test: t1
##################################################

import enum

from tp_tb.utils import port_descriptor


class T1Ports(port_descriptor.PortDescriptor):
	def __init__(self):
		super().__init__()

	class Inputs(enum.Enum):
		Input_0 = 0
		Input_1 = 1

	class Outputs(enum.Enum):
		Output_0 = 0
		Output_1 = 1

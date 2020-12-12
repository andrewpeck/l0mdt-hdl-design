
##################################################
# autogenerated file
# created by tb create on: 01-Dec-2020 (14:29:10)
# created by tb create for test: ptcalc
##################################################


##################################################
# autogenerated file
# created by tb create on: 24-Nov-2020 (20:45:39)
# created by tb create for test: ptcalc
##################################################

import cocotb
from cocotb.triggers import Event, Combine, with_timeout, Timer

from l0mdt_tb.testbench.ptcalc.ptcalc_ports import PtcalcPorts

from l0mdt_tb.utils import events
from l0mdt_tb.utils import block_wrapper


class PtcalcWrapper(block_wrapper.BlockWrapper):
    def __init__(self, clock, name):
        super().__init__(
            clock,
            name,
            PtcalcPorts.get_all_input_interface_ports(),
            PtcalcPorts.get_all_output_interface_ports(),
        )

    def send_input_events(
        self, input_testvectors,n_to_send=-1, l0id_request=-1, event_delays=False
    ):

#Moving to dataformat, so don't do file comparison
#        n_input_files = len(input_testvectors)
#        if n_input_files != self.n_input_ports:
#            raise ValueError(
#                f"Number of input event tables (={n_input_files}) is not equal to number of Ptcalc input ports (={self.n_input_ports})"
#            )

        hooks           = []
        input_interface = 0
        port_index      = 0
        interface_port  = 0

        for port_num in range(PtcalcPorts.n_input_ports(PtcalcPorts)):
            if port_num == (port_index + PtcalcPorts.get_input_interface_ports(input_interface)) :
                port_index      = (port_index + PtcalcPorts.get_input_interface_ports(input_interface))
                input_interface = input_interface + 1

            if port_num >= port_index:
                interface_port = port_num - port_index
            else:
                interface_port = interface_port + 1

            input_events = input_testvectors[port_num]
            driver, io, active = self.input_ports[input_interface][interface_port]

            cocotb.log.info(
                f"Sending {len(input_events)} events to input interface with (port_num) = ({io})"
            )

            hook = None
            for iword, word in enumerate(input_events):
                    flow_kwargs = {}

                    # delays are entered at event boundaries
                    hook = (
                        Event()
                    )  # used to tell outside world that all events have been queued to be sent into the fifos
                    driver.append(word, event=hook, **flow_kwargs)
            if hook:
                hooks.append(hook.wait())

        return hooks

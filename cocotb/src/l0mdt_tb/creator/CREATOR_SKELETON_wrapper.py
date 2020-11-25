import cocotb
from cocotb.triggers import Event, Combine, with_timeout, Timer

from l0mdt_tb.testbench.CREATORTESTNAME.CREATORTESTNAME_ports import CREATORCLASSNAMEPorts

from l0mdt_tb.utils import events
from l0mdt_tb.utils import block_wrapper


class CREATORCLASSNAMEWrapper(block_wrapper.BlockWrapper):
    def __init__(self, clock, name):
        super().__init__(
            clock,
            name,
            #[len(CREATORCLASSNAMEPorts.Input_Interface_0), len(CREATORCLASSNAMEPorts.Input_Interface_1)], #Make this an array
            CREATORCLASSNAMEPorts.get_all_input_interface_ports(),
            CREATORCLASSNAMEPorts.get_all_output_interface_ports(),
        )

    def send_input_events(
        self, input_testvectors,input_interface, n_to_send=-1, l0id_request=-1, event_delays=False
    ):

#Moving to dataformat, so don't do file comparison
#        n_input_files = len(input_testvectors)
#        if n_input_files != self.n_input_ports:
#            raise ValueError(
#                f"Number of input event tables (={n_input_files}) is not equal to number of CREATORCLASSNAME input ports (={self.n_input_ports})"
#            )

        hooks = []
        for port_num, testvector_file in enumerate(input_testvectors):

            driver, io, active = self.input_ports[input_interface][port_num]

            input_events = events.load_events_from_file(
                filename=testvector_file, n_to_load=n_to_send, l0id_request=l0id_request
            )
            cocotb.log.info(
                f"Sending {len(input_events)} events to input (port_num, port_name) = ({io.value}, {io.name}) from testvector {testvector_file}"
            )

            hook = None
            for ievent, event in enumerate(input_events):
                words = list(event)
                for iword, word in enumerate(words):
                    flow_kwargs = {}

                    # delays are entered at event boundaries
                    hook = (
                        Event()
                    )  # used to tell outside world that all events have been queued to be sent into the fifos
                    driver.append(word.get_binary(), event=hook, **flow_kwargs)
            if hook:
                hooks.append(hook.wait())

        return hooks

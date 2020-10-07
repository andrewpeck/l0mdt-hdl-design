from bitstring import BitArray


class BlockWrapper:
    def __init__(self, clock, name, n_input_ports, n_output_ports):
        self._clock = clock
        self._name = name
        self._n_input_ports =n_input_ports
        self._n_output_ports = n_output_ports


        self._input_ports = [tuple([[None, None, False] for i in range(ports)]) for j,ports in enumerate(n_input_ports)]
        self._output_ports = [tuple([[None, None, False] for i in range(ports)]) for j,ports in enumerate(n_output_ports)]


    @property
    def clock(self):
        return self._clock

    @property
    def name(self):
        return self._name

    @property
    def n_input_ports(interface=0):
        return self._n_input_ports[interface]


    @property
    def input_ports(self):
        return self._input_ports


    @property
    def n_input_interfaces(self):
        return len(self._n_input_ports)

    @property
    def n_output_interfaces(self):
        return len(self._n_output_ports)


    def __str__(self):
        return f'Wrapper "{self.name}": (IN,OUT)=({self.n_input_ports},{self.n_output_ports}) = ({self._io_bitmask()[0].bin}, {self._io_bitmask()[1].bin})'

    def __repr__(self):
        return self.__str__()

    def _io_bitmask(self):

        inputs = BitArray([x[2] for x in self._input_ports[::-1]])
        outputs = BitArray([x[2] for x in self._output_ports[::-1]])
        return inputs, outputs



    def set_output_state(self, io_num, active):

        if self._output_ports[interface][io_num][0]:
            self._output_ports[interface][io_num][2] = active
        else:
            self._output_ports[interface][io_num][2] = False


    def add_output_monitor(self, monitor, output_interface,IO, active=True):
        io_num = IO.value
        if io_num > self._n_output_ports[output_interface]:
            raise ValueError(
                f'Provided output monitor "{monitor.name}" is registered for invalid IO port {io_num}, {self.name} block only has {self.n_output_ports} output ports'
            )
        self._output_ports[output_interface][io_num][0] = monitor
        self._output_ports[output_interface][io_num][1] = IO
        self._output_ports[output_interface][io_num][2] = active

    def send_input_events(self, input_testvectors, **kwargs):
        raise NotImplementedError(
            'Sub-classes of Wrapper should define a "send_input_events" function'
        )




    def set_input_state(self, interface, io_num, active): #Adding input interface

        if self._input_ports[interface][io_num][0]:
            self._input_ports[interface][io_num][2] = active
        else:
            self._input_ports[interface][io_num][2] = False

    def sort_ports(self):
        for s in range(self.n_input_interfaces):
            self._input_ports[s] = tuple(sorted(self._input_ports[s], key=lambda x: x[1].value))
        for s in range(self.n_output_interfaces):
            self._output_ports[s] = tuple(sorted(self._output_ports[s], key=lambda x: x[1].value))

    def add_input_driver(self, driver, input_interface, IO, active=True):
        io_num = IO.value
        if io_num > self._n_input_ports[input_interface]:
            raise ValueError(
                f'Provided input driver "{driver.name}" is registered for invalid IO port {io_num}, {self.name} block only has {self.n_input_ports} input ports'
            )
        self._input_ports[input_interface][io_num][0] = driver
        self._input_ports[input_interface][io_num][1] = IO
        self._input_ports[input_interface][io_num][2] = active




    def close(self):
        for j in range(self.n_input_interfaces):
            for i in range(self.n_input_ports):
                self.set_input_state(j, i, False)
        for i in range(self.n_output_ports):
            self.set_output_state(i, False)



    def n_output_ports(self, interface):
        return self._n_output_ports[interface]


    def output_ports(self, interface):
        return self._output_ports[interface]

from pathlib import Path
import struct

import cocotb
from cocotb.drivers import Driver
from cocotb.monitors import Monitor
from cocotb.triggers import RisingEdge, Event, ReadOnly, NextTimeStep, Timer

from l0mdt_tb.utils import utils


class FifoWrapper:
    def __init__(
        self, fifo_block, clock, block_name, io_enum, write_out=True, out_dir=""
    ):

        self._fifo = fifo_block
        self._clock = clock
        self._block_name = block_name
        self._io_enum = io_enum
        self._io_type = None
        self._is_active = False
        self._observed_words = []
        self._delay = Event()
        self._in_delay = False

        self._write_out = write_out
        self._write_out_time = write_out
        self._output_directory = out_dir
        self._output_filename = ""
        self._output_filename_time = ""
        self._first_write = True

        if self.write_out:
            if self.output_directory == "":
                out_path = Path("./")
            else:
                out_path = Path(out_dir)
            if not out_path.is_dir():
                cocotb.log.info(
                    f'WARNING Requested output directory (={out_dir}) not valid, setting to "./"'
                )
                out_path = Path("./")

            # construct full output filename
            io_name = io_enum.name
            name_num = io_name.split("_")[-1]
            if name_num.isdigit():
                name_num = f"{int(name_num):02}"
                io_name = "".join(io_name.split("_")[:-1])
                io_name += name_num
            else:
                io_name = io_name.replace("_", "")
            self._output_directory = str(out_path)
            out_path = (
                out_path
                / f"{str(type(self).__name__.lower())}_{self.block_name}_{int(io_enum.value):02}_{io_name}.evt"
            )
            self._output_filename = str(out_path)

            if self.write_out_time:
                self._output_filename_time = self._output_filename.replace(
                    ".evt", "_timing.txt"
                )

    @property
    def fifo(self):
        return self._fifo

    @property
    def clock(self):
        return self._clock

    @property
    def block_name(self):
        return self._block_name

    @property
    def io_port_num(self):
        return int(self._io_enum.value)

    @property
    def is_active(self):
        return self._is_active

    @is_active.setter
    def is_active(self, val):
        self._is_active = bool(val)

    @property
    def observed_words(self):
        return self._observed_words

    @property
    def write_out(self):
        return self._write_out

    @property
    def write_out_time(self):
        return self._write_out_time

    @property
    def output_directory(self):
        return self._output_directory

    @property
    def output_filename(self):
        return self._output_filename

    def __str__(self):
        return f"{type(self).__name__} {self.block_name} (port_num={self.io_port_num}, active={self.is_active})"

    def __repr__(self):
        return self.__str__()

    ##
    ## callbacks/methods
    ##

    def store_word(self, transaction_tuple):

        transaction, time_ns = transaction_tuple
        dword = utils.transaction_to_data_word(transaction)
        dword.set_timestamp(time_ns, units="ns")
        self._observed_words.append(dword)

    def write_word(self, transaction_tuple):

        transaction, time_ns = transaction_tuple
        word = utils.transaction_to_data_word(transaction)
        word.set_timestamp(time_ns, units="ns")
        wfmt = {True: "wb", False: "ab"}[self._first_write]
        with open(self.output_filename, wfmt) as ofile:
            word.write_testvec_fmt(ofile)

        wfmt = {True: "w", False: "a"}[self._first_write]
        if self.write_out_time:
            with open(self._output_filename_time, wfmt) as ofile:
                if self._first_write:
                    ofile.write(f"info_data_file:{self.output_filename}\n")
                    ofile.write(f"info_time_unit:{'ns'}\n")
                ofile.write(f"{time_ns}\n")
        self._first_write = False


class FifoDriver(FifoWrapper, Driver):
    def __init__(
        self, fifo_block, clock, block_name, io_enum, write_out=True, out_dir=""
    ):

        FifoWrapper.__init__(
            self, fifo_block, clock, block_name, io_enum, write_out, out_dir
        )
        Driver.__init__(self)

    ##
    ## cocotb coroutine implementation
    ##
    @cocotb.coroutine
    def _driver_send(self, transaction, sync=True, **kwargs):

        if self._in_delay:
            yield self._delay.wait()  # don't let any words be written until delays are registered as completed
            self._in_delay = False

        if "delay" in kwargs:
            unit = "ns"
            if "delay_unit" in kwargs:
                unit = kwargs["delay_unit"]
            time_delay = Timer(kwargs["delay"], units=unit)
            self._delay.clear()
            self._in_delay = True
            yield time_delay
            self._delay.set()
            # re-sync
            yield RisingEdge(self.clock)

        if sync:
            yield RisingEdge(self.clock)
            self.fifo.write_enable <= 0

        # wait until there is space in the fifo
        while self.fifo.almost_full != 0:
            yield RisingEdge(self.clock)

        self.fifo.write_enable <= 1  # strobe the FIFO write enable signal
        self.fifo.write_data <= int(
            transaction
        )  # write data to FIFO write_data register

        # keep track of the simulation time (this time coincides with what appears in the waveforms)
        time = cocotb.utils.get_sim_time(units="ns")

        yield RisingEdge(
            self.clock
        )  # latch write data register on next clock rising edge
        self.fifo.write_enable <= 0  # set write enable strobe low

        # dump written words and times to output file for later analysis
        if self.write_out:
            self.write_word((int(transaction), time))


class FifoMonitor(FifoWrapper, Monitor):
    def __init__(
        self,
        fifo_block,
        clock,
        block_name,
        io_enum,
        callbacks=[],
        write_out=True,
        out_dir="",
    ):
        FifoWrapper.__init__(
            self, fifo_block, clock, block_name, io_enum, write_out, out_dir
        )
        Monitor.__init__(self)

        self.add_callback(self.store_word)
        if write_out:
            self.add_callback(self.write_word)
        if callbacks:
            for cb in callbacks:
                self.add_callback(cb)

    ##
    ## cocotb coroutine implementation
    ##
    @cocotb.coroutine
    def _monitor_recv(self):

        while True:

            # wait until rising edge of clock
            yield RisingEdge(self.clock)

            # wait until simulation reaches stage where signals/registers are settled
            yield ReadOnly()

            if self.fifo.empty.value == 0:

                # retrieve data from the FIFO read_data register
                transaction = self.fifo.read_data.value

                # keep track of the simulation time (this time coincides with what appears in the waveforms)
                time = cocotb.utils.get_sim_time(units="ns")

                yield NextTimeStep()  # leave ReadOnly phase
                self.fifo.read_enable <= 1  # strobe the FIFO read-enable signal

                self._recv(
                    (transaction, time)
                )  # store the FIFO data and time for use by registered callbacks
            else:
                yield NextTimeStep()
                self.fifo.read_enable <= 0

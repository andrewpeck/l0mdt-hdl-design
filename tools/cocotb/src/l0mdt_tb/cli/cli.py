"""The TP-FW test bench command line interface (CLI)"""

import click

#from . import utils
from . import testbench
from . import creator


@click.group(context_settings=dict(help_option_names=["-h", "--help"]))
def tb():
    """Top-level entrypoint into L0MDT fw cocotb test-bench infrastructure."""


tb.add_command(testbench.run)
tb.add_command(testbench.list)
tb.add_command(testbench.check_config)
tb.add_command(creator.create)

"""The TB creator CLI group."""
import sys

import click

from l0mdt_tb.creator import creator


@click.group(name="create")
def cli():
    """The create CLI group."""

@click.option("-ip", "--ports_in_input_interface", help="Give number of ports in input interface (E.g 3,3,3 if n_inputs=3)", required=False)
@click.option("-op", "--ports_in_output_interface", help="Give number of ports in output interface (E.g 3 if n_outputs=1", required=False)
@click.option("-t", "--test-name", help="Give the test a name", required=True)
@click.option(
    "-i",
    "--n-input-interfaces",
    help="Specify the number of input interfaces for the DUT",
    type=int,
    required=True,
)
@click.option(
    "-o",
    "--n-output-interfaces",
    help="Specify the number of output interfaces for the DUT",
    type=int,
    required=True,
)
@click.option(
    "--software-block",
    is_flag=True,
    help="Indicate if you require a software block to be generated",
)
@cli.command()
def create(ports_in_input_interface, ports_in_output_interface, test_name, n_input_interfaces, n_output_interfaces, software_block):
    input_ports = []
    output_ports = []
    if ports_in_input_interface == None:
        for i in range(n_input_interfaces):
            input_ports.append(1)
    else:
        x = ports_in_input_interface.split(",")
        for i in range(n_input_interfaces):
            input_ports.append(int(x[i]))
    if ports_in_output_interface == None:
        for i in range(n_outputs):
            output_ports.append(1)
    else:
        x = ports_in_output_interface.split(",")
        for i in range(n_output_interfaces):
            output_ports.append(int(x[i]))

    """Create a new test."""
    test_name = test_name.lower()
    test_name = test_name.replace("-", "_")
    print(
        f'Creating test "{test_name}" with {n_input_interfaces} input interface(s) and {n_output_interfaces} output interface(s).'
    )

    ##
    ## initialize minimal directory structure
    ##
    ok, err = creator.create_initial_directory_structure(test_name)
    if not ok:
        print(err)
        sys.exit(1)

    ##
    ## create the test utils file
    ##
    ok, err = creator.create_test_utils_file(test_name)
    if not ok:
        print(err)
        sys.exit(1)

    ##
    ## create test ports file
    ##
    ok, err = creator.create_test_ports_file(test_name, n_input_interfaces, n_output_interfaces, input_ports, output_ports)
    if not ok:
        print(err)
        sys.exit(1)

    ##
    ## create the test wrapper file
    ##
    ok, err = creator.create_test_wrapper(test_name)
    if not ok:
        print(err)
        sys.exit(1)

    ##
    ## create test/Makefile
    ##
    ok, err = creator.create_test_makefile(test_name)
    if not ok:
        print(err)
        sys.exit(1)

    ##
    ## create test/TopLevel
    ##
    ok, err = creator.create_test_toplevel(test_name, n_input_interfaces, n_output_interfaces, input_ports, output_ports)
    if not ok:
        print(err)
        sys.exit(1)

    ##
    ## create test/module.py
    ##
    ok, err = creator.create_test_module(test_name, software_block)
    if not ok:
        print(err)
        sys.exit(1)

    ##
    ## create test configuration file
    ##
    ok, err = creator.create_test_configuration(test_name, n_input_interfaces, n_output_interfaces, input_ports, output_ports)
    if not ok:
        print(err)
        sys.exit(1)

    if software_block:
        ok, err = creator.create_software_block(test_name)
        if not ok:
            print(err)
            sys.exit(1)

    ##
    ## all done!
    ##
    sys.exit(0)

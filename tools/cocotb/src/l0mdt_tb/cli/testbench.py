import sys
import os
import click
import shutil

from l0mdt_tb.utils import test_config


# from l0mdt_tb.testbench import defined_testbenches


##
## B2B
##
@click.group(name="testbench")
def cli():
    """The testbench CLI group."""


@cli.command()
@click.argument("config")
def run(config):
    """Setup and run cocotb-based testbenches."""

    config_data, err = test_config.config_from_file(config)
    if err:
        print(f"Cannot run test: {err}")
        sys.exit(1)


    run_config = config_data["run_config"]
    test_name = config_data["test_name"]

    test_location = run_config["test_location"]
    output_dir_name = run_config["output_directory_name"]

 	
    ##
    ## communicate input args
    ##
    os.environ["COCOTB_TEST_CONFIG_FILE"] = os.path.abspath(config)

    ##
    ## start the test
    ##
    cwd_start = os.getcwd()
    relative_output_path = os.path.relpath(
        cwd_start, test_location
    )  # this is the output path relative to the test_location

    # I can't seem to get cocotb to run with absolute paths provided to the Makefile,
    # so I just move to the test_location here
    os.chdir(test_location)
    
    #Update RTL configuration
    if "configure_rtl" in run_config:
        if run_config["configure_rtl"] is True:
            configure_rtl_for_test(run_config)


    makefile = "Makefile"
    sim_build_out = f"{relative_output_path}/test_output/{output_dir_name}"
    cocotb_results_file =f"{relative_output_path}/test_output/{output_dir_name}/{test_name}_results.xml"
    cmd = f"SIM_BUILD={sim_build_out} TESTBENCH_TOPLEVEL=TopLevel_{test_name} TESTBENCH_TEST_MODULE=test_{test_name} COCOTB_RESULTS_FILE={cocotb_results_file}"  # WAVES=1 make -f {makefile}"


    #Remove output directory if it exists
    if os.path.exists(sim_build_out) and os.path.isdir(sim_build_out):
        shutil.rmtree(sim_build_out)

    for rc, rc_val in run_config.items():
        if rc in ["output_directory", "test_location"]:
            continue
        cmd += f" {rc.upper()}={rc_val} "
    cmd = f"{cmd} WAVES=1 make -f {makefile}"
    cwd = os.getcwd()
    print(80 * "*")
    print(f"Test: {test_name}")
    print(f"Test run directory: {cwd}")
    print(f"Test output directory: {cwd}/{sim_build_out}")
    print(f"Run command: {cmd}")
    import subprocess

    subprocess.call(cmd, shell=True)
    sys.exit(0)


@cli.command()
def list():
    """List all available testbenches and their status."""

    from colorama import Fore

    valid_configs, invalid_configs = test_config.get_valid_test_configs()
    n_configs_total = len(valid_configs) + len(invalid_configs)
    if not n_configs_total:
        print("No defined testbenches found")
    else:
        print("Defined testbenches:")
        n_printed = 0
        for i, config in enumerate(valid_configs):
            print(
                f"[{n_printed:02}] {str(config).split('/')[-1].replace('config_','').replace('.json','')}"
            )
            n_printed += 1
        for i, config in enumerate(invalid_configs):
            s = f"[{n_printed:02}] {str(config).split('/')[-1].replace('config_','').replace('.json','')}"
            s += " " + Fore.RED + "INVALID" + Fore.RESET
            print(s)
            n_printed += 1


@cli.command()
@click.argument("config")
@click.option("--dump", is_flag=True, help="Dump contents of valid test configuration.")
def check_config(config, dump):
    """Check/inspect a testbench's configuration (*.json) file."""
    parsed_config, err = test_config.config_from_file(config)

    if err:
        print(f"ERROR Provided test config (={config}) has error(s):")
        print(f" > {err}")
    else:
        print("Test configuration OK")
        if dump:
            import json

            test_name = parsed_config["test_name"]
            print(60 * "-")
            print(f'Configuration for test "{test_name}":')
            print(json.dumps(parsed_config, sort_keys=False, indent=4))
            print(60 * "-")


def configure_rtl_for_test(run_config):
    filename="prj_cfg.vhd"
    #RTL configuration for MPT/UPT
    if "pt_type" in run_config:
        if run_config["pt_type"] == "mpt":
            test_config.rtl_configuration(filename, "PT_TYPE", 0)
        else:
            test_config.rtl_configuration(filename, "PT_TYPE", 1)

    if "num_threads" in run_config:
        test_config.rtl_configuration(filename,"NUM_THREADS",run_config["num_threads"], as_str=0)

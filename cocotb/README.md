# cocotb-based testbench infrastructure for the MDT trigger processor (L0MDT TP)

This directory contains the TP's [cocotb](https://github.com/cocotb/cocotb)-based testbench
infrastructure.


Table of Contents
=================
<!--ts-->
   * [Requirements](#requirements)
      * [Python Installation](#python-installation)
   * [Installation and Setup](#installation-and-setup)
      * [The Virtual Environment Is Required](#the-virtual-environment-is-necessary-for-running-the-testbench)
      * [Fresh Installation and Reinstallation](#fresh-installation-and-reinstallation)
   * [Overview of the Testbench Infrastructure](#overview-of-the-testbench-infrastructure)
   * [Description of tb Directory Structure](#directory-structure)
   * [Anatomy of a Testbench](#testbench-structure)
   * [How to Run a Testbench](#running-a-testbench)
      * [Testbench Output](#output-generated-by-the-testbenches)
   * [How to Create a Testbench](#creating-a-testbench)
   * [Creating a Python Defined Logic Block](#defining-logic-blocks-in-python)
   * [Testbench Commands](#functionality)
      * [list](#tb-list)
      * [check-config](#tb-check-config)
      * [create](#tb-create)
      * [run](#tb-run)
      * [test-summary](#tb-test-summary)
      * [diff](#tb-diff)
      * [dump](#tb-dump)
      * [update-makefile](#tb-update-makefile)



<!--te-->

<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
<!------------------------------- REQUIREMENTS -------------------------------->
<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
# Requirements
In order to run the testbenches defined here you must have Python3 (>=3.8.2) installed
on your machine and accessible via the `python3` command in your `$PATH`.


## Python from CVMFS

One can obtain a recent python version from CVMFS. For that, you have to setup
your environment as follows: Either run
```bash
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh
```
or define a function in your `.bashrc` which does it for you
```bash
# Define setupATLAS
function setupATLAS () {
    # ATLAS environment variables
    export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
    source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh
}
```
and then call that function via `setupATLAS` when needed. Afterwards you can obtain
python 3 from CVMFS via
```bash
lsetup "lcgenv -p LCG_98python3 x86_64-centos7-gcc9-opt Python"
```
This gives you the current python 3 version from CVMFS as of this writing (2020-9-23).
Newer versions will be published occasionally, with an overview over all
available packages being given at [http://lcginfo.cern.ch](http://lcginfo.cern.ch).


## Custom python installation

If you instead want to install python3 yourself, there are many places online showing
how to do this. For example, [here](https://realpython.com/installing-python/).

Additionally, you can find an installation script at [this repository](https://github.com/dantrim/danny_installs_python)
that will install python for you. Beware, python compilation depends on external system libraries and so
running the script at that repository straight out of the box may fail. Use it as a guide. It has been tested
on MacOSX as well as CentOS7.

<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
<!--------------------------- INSTALLATION AND SETUP -------------------------->
<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
# Installation and Setup
<!-- <details> <summary> Expand </summary> -->

If you have confirmed that you have `python3` on your machine, then the only
thing that you need to do to install all requirements for running the cocotb-based
testbenches is to run,
```bash
$ source setup_env.sh
(env) $
```
which will install all dependencies (cocotb, third-party packages, etc...). The installation
is handled by [pip](https://pypi.org/project/pip/) and [setuptools](https://pypi.org/project/setuptools/).
You can inspect [setup.py](setup.py) to see the package and installation configuration.

To override the paths for the compiled libraries and the testvectors in the different test configurations
globally, one can either setup the environment via
```bash
$ source setup_env.sh -c /path/to/xilinx_compiled_libraries/ -t /path/to/testvectors
```
or set the environment variables `COMPONENTS_LIB_DIR` and `L0MDT_TESTVECTOR_DIR` manually.

Once the above command completes succesfully, you will be in a python virtual environment
(indicated by the "`(env) $`" at your terminal command prompt instead of the usual "`$`").
If you are unfamiliar with the concept of virtual environments, see [here](https://docs.python.org/3/tutorial/venv.html)
or [here](https://realpython.com/python-virtual-environments-a-primer/).

To exit the virtual environment run,
```bash
(env) $ deactivate
$
```

To ensure that the testbench infrastructure has been installed properly, after sourcing
the `setup_env.sh` script as in the above you should have the command "`tb`" available to you in your
path (within the virtual environment). You should be able to print its help message to
the screen by running,
```bash
(env) $ tb -h
Usage: tb [OPTIONS] COMMAND [ARGS]...

  Top-level entrypoint into TP fw cocotb test-bench infrastructure.

Options:
  -h, --help  Show this message and exit.

Commands:
  check-config     Check/inspect a testbench's configuration (*.json) file.
  create           Create a new test.
  diff             Diff two *.evt files and test for differences.
  dump             Dump the contents of an *.evt file.
  list             List all available testbenches and their status.
  run              Setup and run cocotb-based testbenches.
  test-summary     Dump the test results *.json file.
  update-makefile  Update the QuestaSim makefile used by CocoTB
```
If you see the above help message after running the top-level "`tb`" command then
you should be on your way to running the testbench infrastructure.

## The virtual environment is necessary for running the testbench
In order to return back to the virtual environment for the cocotb testbenches,
simply run,
```bash
$ source setup_env.sh
(env) $
```
Subsequent calls to this script will not attempt to re-install the package, but will only
initialize the virtual environment and ensure that the top-level entrypoint "`tb`" is accessible.

That is, **`setup_env.sh` must be sourced every time you return back to running the testbenches**.

## Fresh Installation and Reinstallation
If you wish to make a clean installation, simply delete the `env/` directory created when you
ran `setup_env.sh` and re-run the installation procedure,
```bash
$ rm -rf env/
$ source setup_env.sh
(env) $ # everything is all fresh now
```
<!-- </details> -->

<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
<!------------------------------- OVERVIEW ------------------------------------>
<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
# Overview of the Testbench Infrastructure

The `cocotb`-based testbench infrastructure laid out in this repository is based
around testing logic blocks that are interfaced to Spybuffer (`"Spy+FIFO"`) blocks.
This is motivated by the fact that in the Trigger Processor, at least in the
development/debugging phase, `Spy+FIFO` blocks will be interspersed throughout
the logic and between functional blocks.
This is illustrated in the high-level TP block diagram:

<div align="center">
<img src="doc/figures/tp_fw_tp_overview.png" height = "400">
</div>

Given this design consideration, the testbench infrastructure here laid out is
based around designers providing their logic block that they wish to test and
having it's inputs and outputs interfaced directly to `Spy+FIFO` blocks.
This is illustrated in the figure below:
<div align="center">
<img src="doc/figures/tp_fw_hdl_onlyPNG.png" height="400">
</div>

Once the `DUT` is interfaced to `Spy+FIFO` blocks as in the above, the
`cocotb` testbench can be constructed. `cocotb` is a `python` based testbench
framework that runs `python` defined coroutines side-by-side with the
RTL simulation. A `cocotb` testbench has complete access to all signals
(internal and external) of the `DUT` and provides methods for designers of
testbenches to drive signals onto the inputs of the toplevel design,
monitor the outputs of the toplevel design, and even control internal registers
inside of simulation time. It is a powerful tool, and complete information can
be found in the [official documentation](https://docs.cocotb.org/en/latest/).

With the "`Spy+FIFO`-generalized interface" assumed for all designs to be tested
by the testbench infrastructure, providing utilities for creating testbenches
and driving & monitoring the designs is relatively straightforward given
enough familiarity with `python` and `cocotb`.

The main idea of developing testbenches with this "`Spy+FIFO` generalized interface"
is illustrated by the following figure,
<div align="center">
    <img src="doc/figures/tp_fw_fullPNG.png" height="800">
</div>
and the minimal order of operations can be listed as:

 1. (`HDL`) Design a logic block that you wish to test
 2. (`HDL`) Wrap the design in `Spy+FIFO` blocks (one such block for each input and output)
 3. (`python`) Construct a `cocotb` test module that initializes the `DUT` (the `Spy+FIFO`-wrapped design)
 4. (`python`) Use [FifoDrivers](https://gitlab.cern.ch/atlas-tdaq-phase2-l0mdt-electronics/l0mdt-hdl-design/-/blob/devel/cocotb/src/l0mdt_tb/utils/fifo_wrapper.py#L146) to drive input testvector data onto the `DUT` inputs
 5. (`python`) Use [FifoMonitors](https://gitlab.cern.ch/atlas-tdaq-phase2-l0mdt-electronics/l0mdt-hdl-design/-/blob/devel/cocotb/src/l0mdt_tb/utils/fifo_wrapper.py#L204) to monitor the `DUT` output signals
 6. (`python`) Compare the signals observed by the [FifoMonitors](https://gitlab.cern.ch/atlas-tdaq-phase2-l0mdt-electronics/l0mdt-hdl-design/-/blob/devel/cocotb/src/l0mdt_tb/utils/fifo_wrapper.py#L204) to the output testvectors

The work necessary to perform steps 2-6 are, for the most part, handled entirely
by the testbench infrastructure laid out in this repository.
As a designer of a logic block, you really only need to provide the testbench
infrastructure with the source files for your logic design and plug them into
`Spy+FIFO` blocks.
Most of the leg work to perform the rest is done by utilizing the testbench infrastructure
described in the [rest of this README](#directory-structure).

**Note 1:** Given the flexibility and strength of the `cocotb` framework, users
can define logic blocks *entirely within python*. That is, you do  not need to
have the logic defined and laid out in HDL/RTL (as illustrated in the above figure)
at all. If you wish to study yet-to-be-designed logic, or add additional control
logic to a design's interface(s), you can create it entirely within `python` by
leveraging `cocotb` constructs.
The testbench infrastructure laid out in this repository provides means for
users to put together the initial stages of a pure software-defined logic block.
See the section [Creating a Python Defined Logic Block](#defining-logic-blocks-in-python)
for more information.

**Note 2:** There is no limit to the number of firmware blocks that can be tested
at a single time. That is, you can chain together any number of firmware logic
blocks --- with `Spy+FIFO` interconnects --- and use the testbench infrastructure
to test the combined logic. For two logic blocks, for example, the above figure(s)
would be augmented as in the following figure:

<div align="center">
<img src="doc/figures/tp_fw_two_blocks.png" height="400">
</div>

By default, the testbench infrastructure will drive and monitor only the **outermost**
`Spy+FIFO` blocks. Monitoring any internal `Spy+FIFO` blocks can be done by the user
adding the necessary code to their `cocotb` test module, in the same way as adding
any code to monitor or drive internal signals of the `DUT` (here we use `"DUT"` to
not refer to the `Spy+FIFO` logic).


<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
<!-------------------------- DIRECTORY STRUCTURE ------------------------------>
<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
# Directory Structure

```
cocotb/
 ├── default_makefiles/
 ├── schema/
 ├── src/
 │   └── l0mdt_tb/
 │       ├── cli/
 │       ├── creator/
 │       ├── utils/
 │       └── testbench/
 │           ├── mtc_auto/
 │           ├── ptcalc/
 │           └── lsf_auto/
 └──test_config/
```

The layout of the `cocotb` directory is illustrated in the above schematic (produced from a reduced `tree` command). Below a brief description
is given of each of the `tb` sub-directories.

### cocotb/default_makefiles

The `default_makefiles` directory contains copies of the the simulator-specific makefiles that `cocotb` uses by default.
By default, at least for using `cocotb` with QuestaSim, the `vsim` command generated by `cocotb` does
not result in the signals of the complete hierarchy (all internal signals) being saved in the output
`vsim.wlf` files.

When running testbenches, the QuestaSim makefile `$(cocotb-config --makefiles)/simulators/Makefile.questa` is
updated to include the additional arguments to save all internal signals for later analysis. The update
process (see [update-makefile](#tb-update-makefile)) uses the default makefiles under the directory
`default_makefiles` as templates for the makefiles to be updated.

**Note:** If in future releases of `cocotb` the structure of the makefiles under `$(cocotb-config --makfiles)/simulators` change,
the copies located in `default_makefiles` will need to be updated.

### cocotb/schema

This directory holds the `JSON` schema files for `JSON` structures relevant to
the testbench infrastructure.

If you are unfamiliar with how to specify or define a schema for `JSON`, and validate
`JSON` objects within python, see the [Understanding JSON Schema page](https://json-schema.org/understanding-json-schema/index.html)
and the [jsonschema repository](https://github.com/Julian/jsonschema).

### cocotb/test_config

This directory holds the `JSON` configuration files for each of the defined tests.
Users must provide a test configuration to the [tb run](#tb-run) command in order
to run testbenches.

Testbench conifguration files must satisfy the schema defined in [schema/schema_test_config.json](schema/schema_test_config.json).

### cocotb/src/l0mdt_tb

Directory containing testbench implementation and modules for creating testbenches.

### l0mdt_tb/cli

Directory defining the top-level command-line-interface (CLI) for the testbench infrastructure.
It is here where the top-level executable `tb`, and it's [sub-commands](#functionality), are defined.

### l0mdt_tb/creator

This directory holds the module that is responsible for creating new testbenches from
pre-defined template ("skeleton") files. The [tb create](#tb-create) utility looks in here
for defining tests.

**Note:** If the format of testbenches change, the [creator module](https://gitlab.cern.ch/atlas_hllhc_uci_htt/tp-fw/-/blob/master/tb/src/tp_tb/creator/creator.py)
will need to be updated accordingly, as well as any templates located in this directory.

### l0mdt_tb/utils

This directory houses modules necessary for building and running `cocotb` testbenches,
as well as other miscellaneous utility methods and modules.
Defined testbenches will rely on modules and classes implemented in this directory.

### l0mdt_tb/testbench

This directory is where defined `cocotb` testbenches reside. Each testbench,
for a specific firmware block, gets it's own directory. In the above there
are three defined testbenches: `b2b`, `evt_sync`, and `example_sw_block`.

# Testbench Structure

For details on how a given testbench is laid out and what is the minimal setup,
see the [testbench structure page](doc/testbench_structure.md).





<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
<!---------------------------- RUNNING A TESTBENCH ---------------------------->
<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
# Running a Testbench
<!-- <details> <summary> Expand </summary> -->

To run a testbench, do something like:

```bash
$ source setup_env.sh
(env) $ tb run test_config/config_<test_name>.json
```
which will result in plenty of output to the screen generated by the RTL compilation and by cocotb and the RTL simulation running.

If one does not want to use the hardcoded paths for the compiled libraries and the testvectors,
one can supply alternative paths:
```bash
(env) $ COMPONENTS_LIB_DIR=/path/to/xilinx_compiled_libraries/ L0MDT_TESTVECTOR_DIR=/path/to/testvectors tb run test_config/config_<test_name>.json
```

The results of the tests that we run within a given testbench are printed to the screen at the end of the test. For example:
```bash
|----------------------------|--------------------|----------------------------|
|PORT/PATH TESTED            |RESULT SUMMARY      |FAILED TESTS                |
|                            |                    |                            |
|==============================================================================|
|TEST_B2B_SRC00_DEST00       |PASS                |                            |
|----------------------------|--------------------|----------------------------|
|TEST_B2B_SRC00_DEST01       |FAIL                |EVENT_FOOTER                |
|----------------------------|--------------------|----------------------------|
...
|----------------------------|--------------------|----------------------------|

|TEST_B2B_SRC00_DEST12       |FAIL                |EVENT_FOOTER                |
|----------------------------|--------------------|----------------------------|
|TEST_B2B_SRC00_DEST13       |FAIL                |EVENT_FOOTER                |
|----------------------------|--------------------|----------------------------|
```
along with the `cocotb` result being reported:
```bash
Failed 1 out of 1 tests (0 skipped)
*****************************************************************************
** TEST                 PASS/FAIL  SIM TIME(NS)  REAL TIME(S)  RATIO(NS/S) **
*****************************************************************************
** test_b2b.b2b_test_0    FAIL        57570.00         13.87      4151.78  **
*****************************************************************************
```

Obtaining more detailed information about why tets failed can be obtained either by adjusting your test or
by using the `test-summary` utility described above.

## Output Generated by the Testbenches
Output generated by the test (from both cocotb and by our testbench) will be located in the `tb/test_output/<test_name>` directory.
If this directory does not exist before running the test, it will get made prior to the test.

The output of primary interest are:

* Waveform files (\*.wlf)
* Data (\*.evt) files generated by the testbenches (e.g. fifodriver\*.evt and fifomonitor\*.evt files)
* Test result summary files (`test_results_summary_*.json`)

The data files named "`fifodriver*.evt`" correspond to the data being driven into the DUT *inputs*.
The data files named "`fifomonitor*.evt`" correspond to the data observed at the DUT *outputs*.
There are analogously named `*timing*.txt` files which contain the timestamp information for the data seen in each
of the FIFO blocks associated with the generated `fifo*.evt` files.

<!-- </details> -->

<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
<!--------------------------- CREATING A TESTBENCH ---------------------------->
<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
# Creating a Testbench

To learn how to create a testbench from scratch using the [tb create](#tb-create)
utility, see the [Creating a Testbench page](doc/creating_a_testbench.md).

<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
<!------------------------ SOFTWARE DEFINED BLOCKS ---------------------------->
<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
# Defining Logic Blocks in Python

To learn how to create and instantiate a logic block defined purely in python,
see the [Creating a Logic Block in Python page](doc/software_block.md).

<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
<!------------------------------ FUNCTIONALITY -------------------------------->
<!----------------------------------------------------------------------------->
<!----------------------------------------------------------------------------->
# Functionality
<!-- <details> <summary> Expand </summary> -->

Here each of the ```tb``` commands will be briefly described.

All `tb` commands available to you are listed by printing the help message:
```bash
(env) $ tb -h
Usage: tb [OPTIONS] COMMAND [ARGS]...

  Top-level entrypoint into TP fw cocotb test-bench infrastructure.

Options:
  -h, --help  Show this message and exit.

Commands:
  check-config     Check/inspect a testbench's configuration (*.json) file.
  create           Create a new test.
  diff             Diff two *.evt files and test for differences.
  dump             Dump the contents of an *.evt file.
  list             List all available testbenches and their status.
  run              Setup and run cocotb-based testbenches.
  test-summary     Dump the test results *.json file.
  update-makefile  Update the QuestaSim makefile used by CocoTB
```
Each command has it's own set of arguments and options, which can be accessed by
```bash
(env) $ tb [command] -h
```

<!-- <details> <summary> <strong>check-config</strong> (click to expand) </summary> -->
## tb check-config

```bash
(env) $ tb check-config -h
Usage: tb check-config [OPTIONS] CONFIG

  Check/inspect a testbench's configuration (*.json) file.

Options:
  --dump      Dump contents of valid test configuration.
  -h, --help  Show this message and exit.
```

The `check-config` command is for inspecting a testbench configuration JSON file.
A testbench's configuration is placed in the [test_config/](test_config/) directory.
For example, here is [test_config/config_b2b.json](test_config/config_b2b.json):
```json
{
    "testbench_config" :
    {
       "test_name" : "b2b"
       ,"input_args" :
       {
           "n_events" : 10
           ,"event_delays" : true
           ,"event_detail" : false
           ,"clock_period" : 5
           ,"clock_time_unit" : "ns"
       },
       "run_config" :
       {
           "output_directory_name" : "b2b"
           ,"test_location" : "src/tp_tb/testbench/b2b/test"
       }
    }
}
```


To check that a testbench configuration is sound, simply provide `check-config` the path to
a testbench JSON configuration file. If the configuration is valid you will be told accordingly.
Here is an example using [test_config/config_b2b.json](test_config/config_b2b.json):
```bash
(env) $ tb check-config test_config/config_b2b.json
Test configuration OK
```

The flag `--dump` additionally prints the configuration content to screen:
```bash
(env) $ tb check-config --dump test_config/config_b2b.json
Test configuration OK
------------------------------------------------------------
Configuration for test "b2b":
{
    "test_name": "b2b",
    "input_args": {
        "n_events": 10,
        "event_delays": true,
        "event_detail": false,
        "clock_period": 5,
        "clock_time_unit": "ns"
    },
    "run_config": {
        "output_directory_name": "b2b",
        "test_location": "src/tp_tb/testbench/b2b/test"
    }
}
------------------------------------------------------------
```

<!-- </details> -->

<!-- <details> <summary> <strong>create</strong> (click to expand) </summary> -->
## tb create

```bash
(env) $ tb create -h
Usage: tb create [OPTIONS]

  Create a new test.

Options:
  --software-block                     Indicate if you require a software block to be
                                       generated

  -o, --n-outputs-interfaces INTEGER   Specify the number of output ports for the DUT
                                       [required]

  -i, --n-inputs-interfaces INTEGER   Specify the number of input ports for the DUT
                                      [required]

  -t, --test-name TEXT                Give the test a name  [required]
  -op, --ports_in_output_interface TEXT
                                      Give number of ports(comma separated) in
                                      each output interface (E.g 3 if n_outputs=1.
                                      Default is 1

  -ip, --ports_in_input_interface TEXT
                                     Give number of ports(comma separated) in
                                     each input interface (E.g 3,3,3 if
                                     n_inputs=3). Default is 1
  -h, --help                         Show this message and exit.
```

The `create` command can be used as a means to create from scratch a brand new testbench.
It produces the necessary files to get a user up and running with passing testvectors through
a DUT with minimal changes required to the files that are created.

**Note: If you wish to understand what are the minimum requirements for setting up a testbench, you should
understand the files and directories that get generated by `tb create`. This structure is
fully described in the [Testbench Structure section](#testbench-structure).**

The `-i|--n-inputs` and `-o|--n-outputs` options correspond to the number of inputs
and outputs, respectively, of the toplevel DUT. That is, they are equal to the number of
input and output testvector files, respectively, that you wish to load into your DUT.

The `-t|--test-name` option defines the name of the testbench. This has consequences for the
naming of the testbenches directory structure, testbench module and class names, etc...

The `--software-block` option will create a skeleton for a python-defined logic block and place it in the CocoTB
test module.

For example, if I wish to create a testbench for a new firmware block called `dummy_block` that has
`2` input dataformat interfaces and `4` output dataformat interfaces, I would do:

```bash
(env) $ tb create -t dummy_block -i 2 -o 4
Creating test "dummy_block" with 2 inputs and 4 outputs.

For above case each dataformat interface has 1 port.


```
At this point the following directory structure related to this new testbench is as follows:

```
tb/
├── src/
│   ├── tp_tb/
│       ├── testbench/
│           ├── dummy_block/
│               ├── README.md
│               ├── dummy_block_ports.py
│               ├── dummy_block_utils.py
│               ├── dummy_block_wrapper.py
│               ├── test/
│                   ├── Makefile
│                   ├── test_dummy_block.py
│                   ├── TopLevel_dummy_block.v
│
├── test_config
     ├── config_dummy_block.json
```

You can see the following files created:


* `<test_name>_ports.py`: A file containing enum descriptors for each of the DUT inputs and outputs [**user should update names of enumerated `Inputs` and `Outputs`**]
* `<test_name>_utils.py`: A file to put any utility/helper functions that you may need in defining your test (by default it has an empty function that you can implement)
* `<test_name>_wrapper.py`: A file defining the `BlockWrapper` for your DUT that contains the methods for driving input testvectors into the DUT
* `test/Makefile`: This is the CocoTB Makefile, in which the user must add additional HDL source files for their DUT and update include paths/etc as needed
* `test/test_<test_name>.py`: This is the CocoTB test module, where you define your testbench
* `test/TopLevel_<test_name>.v`: This is the testbench TopLevel DUT, where you will connect your DUT to the outer input and output Spy+FIFO blocks that are autogenerated for you
* `test_config/config_<test_name>.json`: This is the testbench configuration, where you will need to update input arguments for your tests, specify testvectors, etc...

For the ptcalc port, we have 2 input interfaces (SF2PTCALC, PL2PTCALC) and one output interface (PTCALC2MTC). SF2PTCALC has 3 input ports, PL2PTCALC has 1 port.
PTCALC2MTC has one port. For this case following commands creates testbench:
(env) $ tb create -t ptcalc -i 2 -o 1 -ip 3,1 -op 1

Providing the `--software-block` option will result in the additional file `testbench/<test_name>/<test_name>_block.py` which has a skeleton
logic block defined in python. An instance of the logic block will be added to the created CocoTB test module (`testbench/<test_name>/test/test_<test_name>.py`)
to have it start running. The user will need to do work to implement this logic block, of course, by filling in
the `input_handlers` and `output_handlers` for the `SoftwareBlock` instance that is created.


<!-- </details> -->

<!-- <details> <summary> <strong>list</strong> (click to expand)  </summary> -->
## tb list

```bash
(env) $ tb list -h
Usage: tb list [OPTIONS]

  List all available testbenches (and their tests).

Options:
  -h, --help  Show this message and exit.
```

The `list` utility inspects the testbench directories and finds all properly configured
testbenches that are available to be run. It takes no arguments:

```bash
(env) $ tb list
Defined testbenches:
b2b
```

<!-- </details> -->

<!-- <details> <summary> <strong> run </strong> (click to expand)  </summary> -->
## tb run

```bash
(env) $ tb run -h
Usage: tb run [OPTIONS] CONFIG

  Setup and run cocotb-based testbenches.

Options:
  -h, --help  Show this message and exit.
```

The `run` command is the primary driver of testbenches. You call this when you want to run a testbench.
It takes only a single argument, which is the testbench configuration JSON file that describes the
test you wish to run. For example,

```bash
(env) $ tb run test_config/config_b2b.json
```
Calling `run` will check that the testbench is configured properly and will construct the
command that will ultimately execute the compilation of the RTL source files and the running
of cocotb. Basically, it is nearly the same as setting up your testbench environment and calling
`make` on the cocotb-configured Makefile for your test.

The path to the provided testbench configuration file is passed to the cocotb tests and
can be used internally. In this way, the user can specify "input arguments" to pass to their
test that may change it's behavior. This is the "`input_args`" field of the testbench configuration
file. In the case of the `b2b` testbench these are (c.f. `tb check-config --dump test_config/config_b2b.json`):
```bash
"input_args" :
{
    "n_events" : 10
    ,"event_delays" : true
    ,"event_detail" : false
    ,"clock_period" : 5
    ,"clock_time_unit" : "ns"
}
```
It is up to the designer of the specific testbench to ensure that these "input_args" are properly
handled within their test, or have suitable defaults in the case of their absence within the
testbench's JSON configuration.

<!-- </details> -->

<!-- <details> <summary> <strong>test-summary</strong> (click to expand) </summary> -->
## tb test-summary

```bash
(env) $ tb test-summary -h
Usage: tb test-summary [OPTIONS] [INPUT]...

  Dump the test results *.json file.

Options:
  -q, --quiet         Do not print anything to standard output.
  -r, --result-only   Simply return whether the test is passed or not.
  -e, --event-detail  Report event-level test details.
  -d, --detail        Report test details in addition to final summary.
  -h, --help          Show this message and exit.
```

The testbenches result in `test_result_summary*.json` JSON files which report summaries of all tests
run. The `test-summary` utility provides the user with functionality to dump the
information contained in these files with varying levels of detail in tabular form.

The option `-r|--result-only` reports in a single line the OR of all test results contained in the
provided summary files:
```bash
(env) $ tb test-summary -r test_output/b2b/test_result_summary_B2B_srcAMTP00_destAMTP01.json
Test result: PASS
```

The option `-d|--detail` reports a summary table for each of the provided input summary files, e.g.:

```bash
(env) $ tb test-summary -d test_output/b2b/test_result_summary_B2B_srcAMTP00_destAMTP01.json
|----------------------------------------|--------------------|-------------------------|----------------------------------------|
|PORT/PATH TESTED                        |TEST                |RESULT(ACROSS ALL EVENTS)|INFO                                    |
|================================================================================================================================|
|B2B_SRC00_DEST01                        |N_EVENTS            |PASS                     |                                        |
|----------------------------------------|--------------------|-------------------------|----------------------------------------|
|                                        |RECVD_L0IDS         |PASS                     |                                        |
|----------------------------------------|--------------------|-------------------------|----------------------------------------|
|                                        |EVENT_ORDER         |PASS                     |                                        |
|----------------------------------------|--------------------|-------------------------|----------------------------------------|
|                                        |--------------------|-------------------------|----------------------------------------|
|----------------------------------------|--------------------|-------------------------|----------------------------------------|
|                                        |N_WORDS             |PASS                     |                                        |
|----------------------------------------|--------------------|-------------------------|----------------------------------------|
|                                        |EVENT_HEADER        |PASS                     |                                        |
|----------------------------------------|--------------------|-------------------------|----------------------------------------|
|                                        |EVENT_FOOTER        |FAIL                     |bad_fields: ['CRC']                     |
|----------------------------------------|--------------------|-------------------------|----------------------------------------|
|                                        |MODULE_COUNT        |PASS                     |                                        |
|----------------------------------------|--------------------|-------------------------|----------------------------------------|
|                                        |MODULE_DATA         |PASS                     |                                        |
|----------------------------------------|--------------------|-------------------------|----------------------------------------|
|                                        |FLOATING_DATA       |PASS                     |                                        |
|----------------------------------------|--------------------|-------------------------|----------------------------------------|

|----------------------------------------|--------------------|----------------------------------------|
|PORT/PATH TESTED                        |RESULT SUMMARY      |FAILED TESTS                            |
|======================================================================================================|
|TEST_B2B_SRC00_DEST01                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
```

Providing `test-summary` the `-e|--event-detail` option provides additional breakdown for each of the tests reported in the above (with
the `-d|--detail` option) but *for each event*.

You can provide `test-summary` any number of `test_result_summary*.json` JSON input files (>=1) and it will
concatenate their results into a single table. For example:

```bash
(env) $ tb test-summary -d test_output/b2b/test_results_summary_B2B_srcAMTP00_dest*
...
...
|----------------------------------------|--------------------|----------------------------------------|
|PORT/PATH TESTED                        |RESULT SUMMARY      |FAILED TESTS                            |
|======================================================================================================|
|TEST_B2B_SRC00_DEST00                   |PASS                |                                        |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST01                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST02                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST03                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST04                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST05                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST06                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST07                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST08                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST09                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST10                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST11                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST12                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
|TEST_B2B_SRC00_DEST13                   |FAIL                |EVENT_FOOTER                            |
|----------------------------------------|--------------------|----------------------------------------|
```
<!-- </details> -->

<!-- <details> <summary> <strong>diff</strong> (click to expand) </summary> -->
## tb diff

```bash
(env) $ tb diff -h
Usage: tb diff [OPTIONS] INPUTS...

  Diff two *.evt files and test for differences.

Options:
  -n, --n-events INTEGER     The number of events to load and be diffed.
  -e, --endian [little|big]  Endian-ness of data within the files to load.
  -l, --l0id INTEGER         Select an event with a specific L0ID from the
                             input files to diff.

  -v, --verbose
  -t, --table                Print out results of the diff in a table at the
                             end.

  --event-detail             Print out more detailed information for each
                             event when tabling is enabled.

  -h, --help                 Show this message and exit.
```

The `diff` utility is a very useful one. The testbenches output *.evt files (in the same format as the
testvector files) and the `diff` utility allows for comparing any two of them to each other.

For example, if you drive your design with a given set of testvectors and it produces an output file
called `fifomonitor_OUTPUT_01.evt` which has an associated testvector providing the *expected* output called `testvector_OUTPUT_01.evt`,
you can use the `diff` utility as a means to compare them to each other. Choosing to compare only the first event,

```bash
(env) $ tb diff -n 1 test_output/b2b/fifomonitor_OUTPUT_01.evt ${TESTVECDIR}/testvector_OUTPUT_01.evt
(env) $ echo $? # non-zero return code indicates that differences exist between the files
1 # differences exist!
```
In the above we see that `tb diff` by default does not print anything to screen, and instead provides a return code.
Non-zero return codes indicate that there are differences between the two files provided.

To make `tb diff` a bit more informative to the user, you can provide the `-v|--verbose` option:
```bash
(env) $ tb diff -n 1 -v test_output/b2b/fifomonitor_OUTPUT_01.evt ${TESTVECDIR}/testvector_OUTPUT_01.evt
================================================================================
File0: ./test_output/b2b/fifomonitor_OUTPUT_01.evt
File1: /foo/bar/testvector_OUTPUT_01.evt
====================================================================================================
Comparing event at L0ID=0x2
           NWORDS   = 61        NWORDS   = 61
           NMODULES = 3         NMODULES = 3
           ----------------------------------------
           0x1ab02000000000002  0x1ab02000000000002  FLAG: 0xab / 0xab          TRK_TYPE: 0x2 / 0x2        SPARE: 0x0 / 0x0           L0ID: 0x2 / 0x2
           0x004c00000000785a1  0x004c00000000785a1  BCID: 0x4c / 0x4c          SPARE: 0x0 / 0x0           RUNNUMBER: 0x785a1 / 0x785a1
           0x0000000000fffffff  0x0000000000fffffff  ROI: 0xfffffff / 0xfffffff
           0x00e3bc00100000000  0x00e3bc00100000000  EFPU_ID: 0xe3bc / 0xe3bc   EFPU_PID: 0x1 / 0x1        TIME: 0x0 / 0x0
           0x00000000000000002  0x00000000000000002  Connection_ID: 0x0 / 0x0   Transaction_ID: 0x2 / 0x2
           0x0000000002300bdf9  0x0000000002300bdf9  STATUS: 0x0 / 0x0          CRC: 0x2300bdf9 / 0x2300bdf9
           ----------------------------------------
           0x155400000000001fe  0x155400000000001fe  MODULE #000 FLAG: 0x55 / 0x55        TYPE: 0x1 / 0x1          DET: 0x0 / 0x0           ROUTING: 0xff / 0xff
           0x0130440002e4fc45e  0x01304400034b65f77  MODID: 0x4c11 / 0x4c11   MODTYPE: 0x0 / 0x0       ORIENTATION: 0x0 / 0x0
           0x067affe58322904d3  0x03e8bf76806b37792
           0x00b04bf7e1bb54174  0x023ce63e265272015
           0x032d17a79164ff0fb  0x00fa5d2922513a41f
           0x04ea95c1830c6d1e5  0x0088e9e156901719f
           0x04b2054a327c4bc66  0x00697c6c046f7a5d0
           0x013fde2055ae6eebb  0x05f2b442567e074e4
           ...
           ...
           ...
           0x05277e6db9cfdd243  0x027061d1bfcba14e7
           0x0771b000000000000  0x0771b000000000000  FLAG: 0x77 / 0x77    COUNT: 0x1b / 0x1b   ERROR: 0x0 / 0x0
           ----------------------------------------
           0x1cd0000042300bdf9  0x1cd0000042300bdf9  FLAG: 0xcd / 0xcd         SPARE: 0x0 / 0x0          META_COUNT: 0x4 / 0x4     HDR_CRC: 0x2300bdf9 / 0x2300bdf9
           0x00000000000000000  0x00000000000000000  ERROR_FLAGS: 0x0 / 0x0
           0x00000003adeadbeef  0x00000003a7f812270  WORD_COUNT: 0x3a / 0x3a   CRC DIFFERROR: 0xdeadbeef / 0x7f812270
                      ^^^^^^^^             ^^^^^^^^
           ----------------------------------------
           EVENT OK? NO

```
Here you see the data being printed word-by-word within each of the files. The column of data on the left corresponds to the data contained in "File0", which is the
first input file provided at the command line (in our case `test_output/b2b/fifomonitor_OUTPUT_01.evt`), and the column of data on the right corresponds to the second file
(`${TESTVECDIR}/testvector_OUTPUT_01.evt`).

In addition to printing side-by-side the data words from the two files, there is decoded information to the right. Currently,
decoded information is provided only for **EVENT HEADER**, **EVENT FOOTER**, **MODULE HEADER**, and **MODULE FOOTER**, given that the testvector
data for the cluster data words is random and not correlated between the input and output testvectors. The decoded values for each
field within each of these are shown on the right, alongside the corresponding data word in which the field resides. The
format of the decoded values are **`FIELD_NAME: VALUE_FILE0 / VALUE_FILE1`**. For example,
```bash
WORD_COUNT: 0x3a / 0x3a
```
indicates that the `EVENT FOOTER` field "`WORD_COUNT`" had the value of `0x3a` in both input files for the event being parsed.

Any differences that exist between the two files are indicated in the printout and are indicated in **red**. The positions within
the data itself where the differences are found are subscripted with "`^`" characters indicating the positions
in the formatted hex-strings where the differences are. For example, from the above:
```bash
           0x00000003adeadbeef  0x00000003a7f812270  WORD_COUNT: 0x3a / 0x3a   CRC DIFFERROR: 0xdeadbeef / 0x7f812270
                      ^^^^^^^^             ^^^^^^^^
```
points to the `CRC` fields between the files being different: `0xdeadbeef` (for File0) and `0x7f812270` (for File1).
Any field where an error occurs is also indicated with the flag `DIFFERROR`, as in the above with `CRC DIFFERROR`.

If any of the two files being compared has a different number of modules within a given event, then
the `diff` utility will report "unmatched" data:
```bash
====================================================================================================
Comparing event at L0ID=0x2
           NWORDS   = 61        NWORDS   = 61
           NMODULES = 4         NMODULES = 3
           ----------------------------------------
           0x1ab02000000000002  0x1ab02000000000002  FLAG: 0xab / 0xab          TRK_TYPE: 0x2 / 0x2        SPARE: 0x0 / 0x0           L0ID: 0x2 / 0x2
           0x004c00000000785a1  0x004c00000000785a1  BCID: 0x4c / 0x4c          SPARE: 0x0 / 0x0           RUNNUMBER: 0x785a1 / 0x785a1
           0x0000000000fffffff  0x0000000000fffffff  ROI: 0xfffffff / 0xfffffff
           0x00e3bc00100000000  0x00e3bc00100000000  EFPU_ID: 0xe3bc / 0xe3bc   EFPU_PID: 0x1 / 0x1        TIME: 0x0 / 0x0
           0x00000000000000002  0x00000000000000002  Connection_ID: 0x0 / 0x0   Transaction_ID: 0x2 / 0x2
           0x0000000002300bdf9  0x0000000002300bdf9  STATUS: 0x0 / 0x0          CRC: 0x2300bdf9 / 0x2300bdf9
           ----------------------------------------
           0x155400000000001fe  0x155400000000001fe  MODULE #000 FLAG: 0x55 / 0x55        TYPE: 0x1 / 0x1          DET: 0x0 / 0x0           ROUTING: 0xff / 0xff
           0x0130440002e4fc45e  0x01304400034b65f77  MODID: 0x4c11 / 0x4c11   MODTYPE: 0x0 / 0x0       ORIENTATION: 0x0 / 0x0
           0x067affe58322904d3  0x03e8bf76806b37792
           ...
           ...
           0x155400001e00001fe       unmatched          MODULE #002 FLAG: 0x55        TYPE: 0x1          DET: 0x0           ROUTING: 0xf00000ff
           0x013b2400003a67598       unmatched          MODID: 0x4ec9   MODTYPE: 0x0       ORIENTATION: 0x0
           0x04722466e08cc527b       unmatched
           0x00aab117b39c97d15       unmatched
           0x01fcbfc2526d1e64b       unmatched
           ...
           ...
```
where we see that the data in File0 had an extra module in it not associated with any module contained in the event data in File1.

In cases where event or module boundaries are not correctly reported in the data (e.g. if the fw block under test discards them by accident),
then the event building in the `diff` utility will not associate those words to any event or module since it is the event/module headers
within the data where that data is placed. For example, if a module header is missed, then the subsequent data words
*until the next observed header or start of footer*, will be "floating", so to speak. If such data is found, it is reported as "headless" by the `diff` utility
(and indicated with a **blue** text color):
```bash
           0x155400001e00001fe       headless
           0x013b2400003a67598       headless
           0x04722466e08cc527b       headless
           0x00aab117b39c97d15       headless
           0x01fcbfc2526d1e64b       headless
```

Giving `tb diff` the `-t|--table` option (in combination with the `--event-detail` option) provides tabulated results
of tests of differences in the same format as the `test-summary` utility.

<!-- </details> -->

<!-- <details> <summary> <strong>dump</strong> (click to expand) </summary> -->
## tb dump

```bash
(env) $ tb dump -h
Usage: tb dump [OPTIONS] INPUT_FILE

  Dump the contents of an *.evt file.

Options:
  -b, --boundary          Indicate event and module boundaries.
  -p, --parse             Print out (any) decoded information.
  -t, --timestamp         Indicate timestamps of each word in the file (if
                          available).

  -n, --n-events INTEGER  Dump a specific number of events.
  -l, --l0id TEXT         Print out a specific L0ID (can be comma-separated
                          list for multiple, or a range indicated via
                          <min>-<max>, e.g. 0x1-0x20).

  -c, --word-count        Indicate the overall word count.
  -e, --event-word-count  Indicate the word count within each event.
  -a, --all-opt           Set all options (except for timestamp).
  --start-l0id INTEGER    Dump events with L0ID >= "start-l0id".
  --stop-l0id INTEGER     Do not dump events with L0ID > "stop-l0id".
  --list-l0id             Print L0IDs for the events in the input file.
  -h, --help              Show this message and exit.
```

The `dump` utility provides the means to dump in a human-readable form the data contained in the binary *.evt files associated with
the testvectors and the data files generated by the testbenches. It takes a single input file and dumps the hex-string formatted datawords
to the screen.

There are a lot of configuration options available to the `dump` utility, all primarily related to the level of detail or decoding performed.
Providing no options just dumps the data words line-by-line:
```bash
(env) $ tb dump ./test_output/b2b/fifomonitor_B2B_OUTPUT0.evt
0x1ab02000000000002
0x004c00000000785a1
0x0000000000fffffff
0x00e3bc00100000000
0x00000000000000002
0x0000000002300bdf9
0x155400000000001fe
0x0130440002e4fc45e
0x067affe58322904d3
...
...
0x01120a229593ae9b5
0x00675239167b879e2
0x05277e6db9cfdd243
0x0771b000000000000
0x1cd0000042300bdf9
0x00000000000000000
0x00000003adeadbeef
```

The `-b|--boundary` option places line indicators of where the EVENT, MODULE, and FOOTER boundaries lie:
```bash
(env) $ tb dump -b ./test_output/b2b/fifomonitor_B2B_OUTPUT0.evt
=================== [EVENT 000]
0x1ab02000000000002
0x004c00000000785a1
0x0000000000fffffff
0x00e3bc00100000000
0x00000000000000002
0x0000000002300bdf9
------------------- [MODULE 000/000]
0x155400000000001fe
0x0130440002e4fc45e
...
...
0x05277e6db9cfdd243
0x0771b000000000000
------------------- [FOOTER 000]
0x1cd0000042300bdf9
0x00000000000000000
0x00000003adeadbeef
```

The `-p|--parse` option decodes the EVENT HEADER, MODULE HEADER, MODULE FOOTER, and EVENT FOOTER datawords and places the decoded
fields on the right hand side. For example,
```bash
========================================================================== [EVENT 000]
0x1ab02000000000002   FLAG: 0xab, TRK_TYPE: 0x2, L0ID: 0x2
...
```

The `-c|--word-count` option prints the overall word count of the printed dataword within the file. If there are `N` datawords (and `M << N` events)
in the file, then the word-count is contained in `[0,N-1]`. This word count is indicated to the left of the data words:
```bash
(env) $ tb dump -b -c test_output/b2b/fifomonitor_B2B_OUTPUT1.evt
============================== [EVENT 000]
0         0x1ab02000000000002
1         0x004c00000000785a1
2         0x0000000000fffffff
...
57        0x0771b000000000000
------------------------------ [FOOTER 000]
58        0x1cd0000042300bdf9
59        0x00000000000000000
60        0x00000003adeadbeef
============================== [EVENT 001]
61        0x1ab02000000000005
62        0x00cb00000000785a1
...
```

The `-e|--event-word-count` option prints the *inter-event* dataword count. This count repeats after each new event is printed and is printed to the right
of the data word:
```bash
(env) $ tb dump -b -c -e test_output/b2b/fifomonitor_B2B_OUTPUT1.evt
===================================== [EVENT 000]
0         0x1ab02000000000002   0
1         0x004c00000000785a1   1
2         0x0000000000fffffff   2
3         0x00e3bc00100000000   3
...
56        0x05277e6db9cfdd243   56
57        0x0771b000000000000   57
------------------------------------- [FOOTER 000]
58        0x1cd0000042300bdf9   58
59        0x00000000000000000   59
60        0x00000003adeadbeef   60
===================================== [EVENT 001]
61        0x1ab02000000000005   0
62        0x00cb00000000785a1   1
63        0x0000000000fffffff   2
64        0x026f9400b00000000   3
...
```

The `-t|--timestamp` option prints the simulator timestamp value at which point the printed dataword was made available.
For example, the `fifomonitor_*.evt` files produced by the testbench are data put into the output FIFOs by
the DUT. The timestamp is therefore the time at which the DUT wrote the dataword into the FIFO.
The timestamp values correspond to what would appear in a waveform alongside a given register transition event.
The timestamps are given in the simulator timescale (default to "ns") and are printed to the left of the datawords:
```bash
(env) $ tb dump -b -c -e -t test_output/b2b/fifomonitor_B2B_OUTPUT1.evt
==================================================== [EVENT 000]
0        300.0          0x1ab02000000000002   0
1        305.0          0x004c00000000785a1   1
2        310.0          0x0000000000fffffff   2
3        315.0          0x00e3bc00100000000   3
4        320.0          0x00000000000000002   4
5        325.0          0x0000000002300bdf9   5
---------------------------------------------------- [MODULE 000/000]
6        570.0          0x155400000000001fe   6
7        575.0          0x0130440002e4fc45e   7
8        580.0          0x067affe58322904d3   8
...
```

**Note**: The timestamps are only available to those \*.evt files generated by the testbenches, and **NOT the testvector files.**

The remaining options (`-n`, `--list-l0id`, `--start/stop-l0id`, `-l`) should all be self-explanatory.

Any combination of these options can be provided to the `dump` utility. Provide the `-a|--all-opt` option to provide
the combination of `-b -c -e -t -p`.


<!-- </details> -->

<!-- <details> <summary> <strong>update-makefile</strong> (click to expand)  </summary> -->
## tb update-makefile

```bash
(env) $ tb update-makefile -h
Usage: tb update-makefile [OPTIONS]

  Update the QuestaSim makefile used by CocoTB to dump all signals (external
  AND internal) to output waveform file.

Options:
  -v, --verbose  Print out detailed reporting
  -h, --help     Show this message and exit.
```

By default, CocoTB's underlying `Makefile` that it uses for its QuestaSim simulator, located at
`$(cocotb-config --makefiles)/simulators/Makefile.questa`, does not provide the necessary arguments to the `vsim` command
to report all signals contained in the DUT hiearchy.

Running `tb update-makefile` updates the `Makefile.questa` file accordingly. The update procedure is additionally
run during each call to `tb run`. As a result, the update procedure is ~automatic.

<!-- </details> -->

<!-- </details> -->

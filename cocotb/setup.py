from setuptools import setup, find_packages
import os
import subprocess

# dantrim May 2020:
# This is a hack but it appears to work and I coudln't get anything from
# stackoverflow to work. It also does not help that the package is camelcased
# (fun fact: Unix filesystem is case-insensitive!)
# and matches in name with an existing package on PyPi...

# check if kinit is there
#rc = subprocess.call(["which", "kinit"])
#if rc == 0:
#    system_sim_path = "https://:@gitlab.cern.ch:8443/atlas-tdaq-p2-firmware/tdaq-htt-firmware/system-simulation.git"
#else:
#    system_sim_path = "https://gitlab.cern.ch/atlas-tdaq-p2-firmware/tdaq-htt-firmware/system-simulation.git"
#system_sim_branch = "python3_import"
#os.system("pip install git+{}@{}".format(system_sim_path, system_sim_branch))
#os.system("python -m pip install CppHeaderParser")
#os.system("python -m pip install -e ../dataformats")
#os.system("python -m pip install -e ../tv/TVReader")
#os.system("python -m pip install -e ../tv/TVDataFormat")
#os.system("python -m pip install -e ../tv")
#os.system("source ../tv/setupPy.sh")

setup(
    name="l0mdt_tb",
    version="0.1",
    description="",
    long_description="",
    url="",
    author="Daniel Joseph Antrim",
    author_email="daniel.joseph.antrim@cern.ch",
    package_dir={"": "src"},
    packages=find_packages(where="src"),
    include_package_data=True,
    python_requires=">=3.6",
    install_requires=[
        "cocotb",
        "cocotb_bus",
        "flake8",
        "black",
        "colorama",
        "columnar",
        "numpy",
        "Click>=6.0",
        "bitstring",
        "scipy",
        "jsonschema",
        "prettytable",
        "pandas",
        "tabulate",
        "termcolor",       
    ],
    entry_points={"console_scripts": ["tb=l0mdt_tb.cli:cli"]},
)

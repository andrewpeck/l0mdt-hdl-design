# l0mdt-hdl-design

This repository holds all the FPGA design for the L0MDT (MDTTP) project. It
uses the Hog framework, which allows multiple top files and automated building.

This repository is expected to have a mix of HDL approaches: VDHL, Verilog (and 
family), HLS

**See Wiki area for other information**

## How to retrieve the code

`git clone --recurse-submodules ssh://git@gitlab.cern.ch:7999/atlas-tdaq-phase2-l0mdt-electronics/l0mdt-fpga-design.git`

## Directory structure

Hog dictates the basic directory structure, please see [this](https://cern.ch/Hog).

Full chain projects are stored in the `Top/l0mdt*` folders. The Hog and AXI configuration files for these projects are automatically generated using the `Top/generate_mdt_flavors.tcl` script. This uses the `Top/base_l0mdt` project as a template and creates the selected projects, according to the parameters declared in the `Top/mdt_flavors.yml` file.

For example, the configuration,

```yaml
ku15p_lsf_upt:
  fpga: xcku15p-ffva1760-2-e
  board_pkg: board_pkg_mpi_ku15p
  sf: lsf
  pt: upt
  constraints:
    - "pinouts_mpi_ku15p.xdc"
  variants:
    default:
      link_map: "link_map_ku15p"
      sector_id: 3
      sector_side: 0
      endcap: 0
      large: 0
      en_neighbors: 0
      en_daq: 1
      hog_only_synth: 1
      hog_no_bitstream: 1
      zynq_target: 7s  # 7s or usp
```

will create the `Top/l0mdt_ku15p_lsf_upt` project, with the configuration to create a firmware for the KU15P, with the LSF segment finder and the UPT momentum calculator modules. 

To create a new `l0mdt` project, just add a new definition in the yaml file and run the `Make flavors` command. Each `l0mdt` project, contains also a unique AXI definition, which is defined in the `Top/project/slaves.yaml` and `Top/project/address_tables/address_apollo.xml` files. These files are currently copied from the `base_l0mdt` project, and can be modified by the users to adapt for their needs. The `generate_mdt_flavors` script would check if these files already exist, and does not overwrite them, to avoid loss of work. For the future, we plan to generate also the `slaves.yaml` and the `address_apollo.xml` files automatically from the `mdt_flavors.yml`.

When generating the project configurations, the tool also parses the `slaves.yaml` file to create the correspondent `top_control.vhd` and `top_l0mdt.vhd` files, which are stored in the `Top/project/` folder. When creating the project for the first time, please remember to commit also these files to git, otherwise the CI would fail. 

If you modify the `slaves.yaml` in a project, you can automatically update the `top_*` files by launching the following command from the main path of the repository.

```shell
./Top/update_top_modules.tcl <project_name>
```


## GitLab workflow

- Issues created to track changes in code, branches created from issues.

- Master branch protected to hold stable (release) versions

- Devel branch to concentrate all the merges before release

- Working branches created as needed 

- feature-\<name\>: for features implementation 

- hotfix-\<name\>: for fixes directly on master and devel branches.

Please see: [A successful git branching model](https://nvie.com/posts/a-successful-git-branching-model/)

## Hog documentation hub

http://hog-user-docs.web.cern.ch/

## Some instructions to simulate and implement the code
  
.... TBD

## Gitlab CI

... TBD  

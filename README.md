# l0mdt-fpga-design 

This repository holds all the FPGA design for the L0MDT (MDTTP) project. It
uses the Hog framework, which allows multiple top files and automated building.

This repository is expected to have a mix of HDL approaches: VDHL, Verilog (and 
family), HLS

**See Wiki area for other information**

## How to retrieve the code

`git clone --recurse-submodules ssh://git@gitlab.cern.ch:7999/atlas-tdaq-phase2-l0mdt-electronics/l0mdt-fpga-design.git`

## Directory structure

Hog dictates the basic directory structure, please see [this](https://gitlab.cern.ch/hog/Hog).

Functionalities of this project will be implemented as "libraries". "Competing"
modules (e.g. CSF and LSF) must have equivalent levels and port structure. An 
initial incomplete suggestion of libraries follows (naming can be improved):

```
/shared
/hit_extraction
/csf
/lsf
/tf1
/tf2
/sector_logic_interface
/daq
/neighbors
```

And Hog also defines how to implement multiple designs in the same repository by
means of the Top folder, for example:

```
/Top/csm_tf1
/Top/lsm_tf1
/Top/csm_tf2
/Top/lsm_tf2
```

## Gitlab workflow

- Issues created to track changes in code, branchs created from issues.

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


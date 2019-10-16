# l0mdt-fpga-design

This repository holds all the FPGA design for the L0MDT (MDTTP) project. It
uses the Hog framework, which allows multiple top files and automated building.

This repository is expected to have a mix of HDL approaches: VDHL, Verilog (and 
family), HLS

** See Wiki area for other information **

## How to retrieve the code

`git clone --recurse-submodules ssh://git@gitlab.cern.ch:7999/atlas-tdaq-phase2-l0mdt-electronics/l0mdt-fpga-design.git`

## Gitlab workflow

- Issues created to track changes in code, branchs created from issues.

- Master branch protected to hold stable (release) versions

- Devel branch to concentrate all the merges before release

- Working branches created as needed 

    - feature-\<name\>: for features implementation 

    - hotfix-\<name\>: for fixes directly on master and devel branches.

Please see: [A successful git branching model](https://nvie.com/posts/a-successful-git-branching-model/)

## Some instructions to simulate and implement the code

... TBD


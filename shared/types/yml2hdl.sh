#!/usr/bin/env bash
# -------------------------------
# 
# -------------------------------

yml2hdl_v1="../../tools/yml2hdl_v1/yml2hdl.py"
yml2hdl_v2="../../tools/yml2hdl/yml2hdl.py"

common_v1="-e yml2hdl_v1/common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e yml2hdl_v1/common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e yml2hdl_v1/common_types.yml"

common_v2="-e yml2hdl/common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e yml2hdl/common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e yml2hdl/common_types.yml"

common=""

yml_ver=0
dataformats=0
modules=0
# common_ieee="../../../shared/types/common_ieee.yml"

#####
# python3 $yml2hdl -e $common_ieee MPL/MPL_TYPES_v2.yml
# python3 $yml2hdl common_ieee.yml

if [ -z "$1" ]; then
  echo "No arguments supplied"
  exit 1
else
  while [[ $# -gt 0 ]]
    do

    key="$1"

    echo "$1 : $2"

    case $key in
      -v1|--version1)
        echo "script used $yml2hdl_v1 "
        yml2hdl=yml2hdl_v1
        yml_ver=1
        shift
        ;;
      -v2|--version2)
        echo "script used $yml2hdl_v2 "
        yml2hdl=yml2hdl_v2
        yml_ver=2
        shift
        ;;

      -e|--elements)
        if [ -z "$2" ]; then
          echo "No arguments supplied"
          exit 1
        else    
          while [[ $# -gt 0 ]]
          do
            if [[ ${1:0:1} == "-" ]] && [[ $1 != "-e" ]]; then
              echo "Wrong arguments supplied"
              exit 1
            else
            
              case $2 in
                all)
                  dataformats=1 
                  echo "everything will be compiled"
                  shift
                  ;;
                mod|modules)
                  modules=1
                  echo "all modules will be compiled"
                  shift
                  ;;
                com|common)
                  modules=1
                  dataformats=1
                  echo "only common will be compiled"
                  shift
                  ;;
                # -*)
                #   echo "module loading done"
                #   shift
                #   shift
                #   ;;
                *)
                  echo "added module $1 : $2 : $3"
                  modules+=("$2")
                  shift
                  ;;
              esac
            fi
          done
          
        fi
        shift # past argument
        shift # past value
        ;;
        *)    # unknown option
        # POSITIONAL+=("$1") # save it in an array for later
        shift # past argument
        ;;
    esac
  done
fi
if [[ $yml_ver == 1 ]]; then
  if [[ $dataformats == 1 ]]; then
    echo "compiling commons"
    python3 $yml2hdl_v1 yml2hdl_v1/common_ieee.yml
  fi
  if [[ $dataformats == 1 ]]; then
    echo "compiling commons"
    python3 $yml2hdl_v1 yml2hdl_v1/common_ieee.yml
  fi
fi

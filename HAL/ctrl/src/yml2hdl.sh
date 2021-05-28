#!/usr/bin/env bash
# --------------------------------------------------------------------------------
# --  UMass , Physics Department
# --  Guillermo Loustau de Linares
# --  gloustau@cern.ch
# --------------------------------------------------------------------------------
# --  Project: ATLAS L0MDT Trigger 
# --  Module: REGMAP to yml2hdl v2 
# --  Description:
# --
# --------------------------------------------------------------------------------

yml2hdl="../../../tools/yml2hdl/yml2hdl.py"
# # common_ieee="../../../shared/types/common_ieee.yml"

# #####
# # python3 $yml2hdl -e $common_ieee MPL/MPL_TYPES_v2.yml
# python3 $yml2hdl -v -n MPL_CTRL MPL/MPL_PKG.yml
# python3 $yml2hdl -v -n UCM_CTRL UCM/UCM_PKG.yml
# python3 $yml2hdl -v -n H2S_CTRL H2S/H2S_PKG.yml

# # Interfaces
# python3 $yml2hdl -v MEM_INT_10A148D/MEM_INT_10A148D_PKG.yml
# python3 $yml2hdl -v MEM_INT_12A148D/MEM_INT_12A148D_PKG.yml
# python3 $yml2hdl -v MEM_INT_4A17D/MEM_INT_4A17D_PKG.yml
# python3 $yml2hdl -v MEM_INT_9A19D/MEM_INT_9A19D_PKG.yml

declare -a arr=(
  "TAR"
  "MPL" 
  "UCM" 
  "H2S"
  "MEM_INT_10A148D"
  "MEM_INT_12A148D"
  "MEM_INT_4A17D"
  "MEM_INT_9A19D"
  "MEM_INT_10A38D"
)

for ifile in "${arr[@]}"
do
  echo "-----------------------------------------------"
  echo "INFO    : Module : $ifile"
  echo "-----------------------------------------------"

  echo "INFO    : Running YML2HDL"
  python3 $yml2hdl -n ${ifile}_CTRL ${ifile}/${ifile}_PKG.yml
  echo "INFO    : Done YML2HDL"

  if grep -Fxq "use work.${ifile}_Ctrl_DEF.all;" ${ifile}/${ifile}_map.vhd
  then
    echo "INFO    : map has default lib"
  else
    echo "WARNING : map hasn't default lib"
    IFS=''
    cnty="use work.${ifile}_Ctrl.all;"    
    while read line || [ -n "$line" ]
    do
      # echo "$line"
      printf "%s\n" "$line"
      if [[ $line  == *${cnty}* ]]; then
        # printf "%s\n" "$line"
        echo "use work.${ifile}_Ctrl_DEF.all;"
      fi
    done < ${ifile}/${ifile}_map.vhd > ${ifile}/${ifile}_map_tmp.vhd
    mv ${ifile}/${ifile}_map_tmp.vhd ${ifile}/${ifile}_map.vhd
    echo "INFO    : default lib added to map"
  fi
done



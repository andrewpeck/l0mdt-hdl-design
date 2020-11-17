#!/usr/bin/python3
#
#
#
import platform
import argparse
import sys
import os
import csv


import sim_options
from sim_options import verb

from sim_data import simData


# verbose_level = ()
# where = ()



#-----------------------------------------------------------
#
#-----------------------------------------------------------
# def read_vectors(prj_data,sim,ov_file):

#   ov_data = {}
  
  
#   verb(1,"------------------- read vectors -------------------")
#   if where == "local":
#     full_path = "../../VivadoProject/" + prj_data[sim]['subprj_name'] + "/"+ prj_data[sim]['subprj_name'] + output_vector_path + sim + "/" + ov_file
#   else:
#     full_path = ""
#   # verb(1,"full path  :  " + full_path)

#   ov_data['full_path'] = full_path

#   with open(full_path, newline='') as f:
#     bytes = f.read() # read entire file as bytes
#     ov_data['hash'] = hashlib.sha256(bytes.encode('utf-8')).hexdigest()
#     # verb(1,"hash  :  " + ov_data['hash'])
  


#   # verb(1," num lines : " + str(ov_data['num_lines']))
#   # verb(1,ov_data)
#   # for key in ov_data:
#   #   ob_str = str(key).rjust(10) + " : " + str(ov_data[key])
#   #   verb(1,ob_str)

#   return ov_data
    
#-----------------------------------------------------------
#
#-----------------------------------------------------------
def compare(Data):
  compared_data = 0


  return compared_data
#-----------------------------------------------------------
#
#-----------------------------------------------------------
# def report(Data):
#   verb(0,"====================================================")
#   verb(0,"==                     REPORT                     ==")
#   verb(0,"====================================================")
#   verb(0,"Project Base Name : " + Data['project_name'])
#   verb(0,"        Xsim file : " + Data['xsim']['ov']['full_path'])
#   verb(0,"   Xsim file hash : " + Data['xsim']['ov']['hash'])
#   verb(0,"        Num lines : " + str(Data['xsim']['ov']['num_lines']))

#   verb(0,"      Questa file : " + Data['questa']['ov']['full_path'])
#   verb(0," Questa file hash : " + Data['questa']['ov']['hash'])
#   verb(0,"        Num lines : " + str(Data['questa']['ov']['num_lines']))

#   if Data['xsim']['ov']['hash'] == Data['questa']['ov']['hash'] :
#     verb(0,"same hash")
#   else:
#     verb(0,"Hash are not equal")
#     exit(1)

#-----------------------------------------------------------
#
#-----------------------------------------------------------
def main_script(args):
  #
  verb (1,"main_script")
  project_name = args.project.split('_')

  del project_name[-1]

  Data = simData('_'.join(project_name))

  Data.read_vector("hps_heg_bm_hit_A3_Barrel_yt_v04.txt")
  Data.read_vector("hps_heg_bm_slc_A3_Barrel_yt_v04.txt")

  Data.read_vector("pt_in_mpl_A3_Barrel_yt_v04.txt")
  Data.read_vector("pt_in_sf_A3_Barrel_yt_v04.txt")

  
  Data.report()


#-----------------------------------------------------------
#
#-----------------------------------------------------------
if __name__ == "__main__":
  parser = argparse.ArgumentParser(description='Script to compare simulation Output Vectors')
  parser.add_argument("project", help="input project name")
  parser.add_argument("-t", "--type"    , type=int  , default=0 , help="Select the type of comparision to do")
  parser.add_argument("-v", "--verbose" , type=int  , default=0 , help="Select verbosity level")
  # parser.add_argument("-w", "--where"   , default = "local"     , help= "Select if the script is run in local or in gitlab" )
  args = parser.parse_args()

  sim_options.set_verbose_level(args.verbose)
  # where = args.where

  verb(1,platform.python_version())
  verb(1,args)

  main_script(args)



  # pass
#!/usr/bin/python3
#
#
#
import platform
import argparse
import sys
import os
import csv
import hashlib


verbose_level = ()
where = ()

output_vector_path = ".sim/project_lib_sim/behav/"

#-----------------------------------------------------------
#
#-----------------------------------------------------------
def read_vectors(prj_data,sim,ov_file):

  ov_data = {}
  
  
  verb("------------------- read vectors -------------------")
  if where == "local":
    full_path = "../../VivadoProject/" + prj_data[sim]['subprj_name'] + "/"+ prj_data[sim]['subprj_name'] + output_vector_path + sim + "/" + ov_file
  else:
    full_path = ""
  verb(full_path)

  with open(full_path, newline='') as f:
    bytes = f.read() # read entire file as bytes
    ov_data['hash'] = hashlib.sha256(bytes.encode('utf-8')).hexdigest()
    verb(ov_data['hash'])

    reader = csv.reader(f)
    for l in reader:
      verb(l[0].split())

  return ov_data
    
  


#-----------------------------------------------------------
#
#-----------------------------------------------------------
def main_script(args):
  #
  verb ("main_script")
  project_name = args.project.split('_')
  # if verb(project_name[-1]) == "xsim">

  Data = {}
  Data['project_name'] = '_'.join(project_name)
  Data['xsim'] = {}
  Data['questa'] = {}

  # if project_name[-1] == "questa":
  del project_name[-1]
  Data['xsim']['subprj_name'] = '_'.join(project_name) + "_xsim"
  Data['questa']['subprj_name'] = '_'.join(project_name) + "_questa"
  verb(project_name)
  verb(Data)

  Data['xsim']['ov'] = read_vectors(Data,"xsim","hps_heg_bm_A3_Barrel_yt_v04.txt")
  Data['questa']['ov'] = read_vectors(Data,"questa","hps_heg_bm_A3_Barrel_yt_v04.txt")

  if Data['xsim']['ov']['hash'] == Data['questa']['ov']['hash'] :
    verb("same hash")
  else:
    print(exit)
    exit(1)


#-----------------------------------------------------------
#
#-----------------------------------------------------------
def verb(*print_args):
  if verbose_level == 1:
    for print_arg in print_args:
      print (print_arg)
    print

#-----------------------------------------------------------
#
#-----------------------------------------------------------
if __name__ == "__main__":
  parser = argparse.ArgumentParser(description='Script to compare simulation Output Vectors')
  parser.add_argument("project", help="input project name")
  parser.add_argument("-t", "--type"    , type=int  , default=0 , help="Select the type of comparision to do")
  parser.add_argument("-v", "--verbose" , type=int  , default=1 , help="Select verbosity level")
  parser.add_argument("-w", "--where"   , default = "local"     , help= "Select if the script is run in local or in gitlab" )
  args = parser.parse_args()

  verbose_level = args.verbose
  where = args.where

  print(platform.python_version())
  verb(args)

  main_script(args)



  # pass
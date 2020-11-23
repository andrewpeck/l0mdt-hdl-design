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


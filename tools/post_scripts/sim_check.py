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
  
#   ov_data['num_lines'] = 0
#   f_head = []
#   ov_data['headers'] = {}

#   with open(full_path, newline='') as f:
#     reader = csv.reader(f)
#     for l in reader:
#       ov_data['num_lines'] += 1
      
#       line = l[0].split()
#       # verb(1,l[0])
#       if(l[0][0] == '#'): # Read headers 
        
#         if ov_data['num_lines'] > 1: 
#           headers = []
#           # verb(1,line[0])
#           num_field = 0
#           for field in line:
#             num_field += 1
#             if num_field == 1:
#               head = field[field.find('#')+1 : field.find(':')]
#               ov_data[head] = {}
#               # verb(1,field.find("FLAG"))
#               # if field.find("FLAG") > 0:
#               #   ov_data[head]['FLAG'] = []
#               #   headers.append('FLAG')
#             else:
#               ov_data[head][field] = []
#               headers.append(field)
#             # verb(1,headers)
#           ov_data['headers'][head] = headers
#       else:
#         # verb(1,line[0])
#         for key in ov_data['headers']:
#           # verb(1,"................")
#           # verb(1,line[0].find(key))
#           if line[0].find(key) >= 0:
#             # verb(1,key)
#             field_cnt = 0
#             for head_key in ov_data['headers'][key]:
#               # verb(1,"::::::::::::::::")
#               # field_cnt += 1
#               # if field_cnt == 0:
#               #   verb(1,head_key)
#               # else:
#               # verb(1,key)
#               # verb(1,head_key)
#               # verb(1,field_cnt)
#               # verb(1,line[field_cnt])
#               ov_data[key][ov_data['headers'][key][field_cnt - 1]].append(line[field_cnt])

#               field_cnt += 1

  # verb(1," num lines : " + str(ov_data['num_lines']))
  # verb(1,ov_data)
  # for key in ov_data:
  #   ob_str = str(key).rjust(10) + " : " + str(ov_data[key])
  #   verb(1,ob_str)

  # return ov_data
    
#-----------------------------------------------------------
#
#-----------------------------------------------------------
def compare(Data):
  compared_data = 0


  return compared_data
#-----------------------------------------------------------
#
#-----------------------------------------------------------
def report(Data):
  verb(0,"====================================================")
  verb(0,"==                     REPORT                     ==")
  verb(0,"====================================================")
  verb(0,"Project Base Name : " + Data['project_name'])
  verb(0,"        Xsim file : " + Data['xsim']['ov']['full_path'])
  verb(0,"   Xsim file hash : " + Data['xsim']['ov']['hash'])
  verb(0,"        Num lines : " + str(Data['xsim']['ov']['num_lines']))

  verb(0,"      Questa file : " + Data['questa']['ov']['full_path'])
  verb(0," Questa file hash : " + Data['questa']['ov']['hash'])
  verb(0,"        Num lines : " + str(Data['questa']['ov']['num_lines']))

  if Data['xsim']['ov']['hash'] == Data['questa']['ov']['hash'] :
    verb(0,"same hash")
  else:
    verb(0,"Hash are not equal")
    exit(1)

#-----------------------------------------------------------
#
#-----------------------------------------------------------
def main_script(args):
  #
  verb (1,"main_script")
  project_name = args.project.split('_')
  # if verb(0,project_name[-1]) == "xsim">

  Data = {}
  Data['project_name'] = '_'.join(project_name)
  Data['xsim'] = {}
  Data['questa'] = {}

  # if project_name[-1] == "questa":
  del project_name[-1]
  Data['xsim']['subprj_name'] = '_'.join(project_name) + "_xsim"
  Data['questa']['subprj_name'] = '_'.join(project_name) + "_questa"
  verb(1,project_name)
  verb(1,Data)

  # Data['xsim']['ov'] = read_vectors(Data,"xsim","hps_heg_bm_A3_Barrel_yt_v04.txt")
  # Data['questa']['ov'] = read_vectors(Data,"questa","hps_heg_bm_A3_Barrel_yt_v04.txt")

  # Data['comp'] = compare(Data)

  report(Data)


#-----------------------------------------------------------
#
#-----------------------------------------------------------
def verb(v_level,*print_args):
  if verbose_level >= v_level:
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
  parser.add_argument("-v", "--verbose" , type=int  , default=0 , help="Select verbosity level")
  parser.add_argument("-w", "--where"   , default = "local"     , help= "Select if the script is run in local or in gitlab" )
  args = parser.parse_args()

  verbose_level = args.verbose
  where = args.where

  verb(1,platform.python_version())
  verb(1,args)

  main_script(args)



  # pass
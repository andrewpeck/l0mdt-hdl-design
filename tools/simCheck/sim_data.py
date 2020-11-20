#
import sys
import os
import hashlib
from sim_options import verb


output_vector_path = ".sim/project_lib_sim/behav/"

class simData:
  def __init__(self, project_name):
    """
    docstring
    """
    self.Data = {}
    self.Data['project_name'] = project_name
    self.Data['subprj_name'] = {}
    self.Data['files'] = []

    # if project_name[-1] == "questa":
    # del project_name[-1]
    self.Data['subprj_name']['xsim'] = ''.join(project_name) + "_xsim"
    self.Data['subprj_name']['questa'] = ''.join(project_name) + "_questa"
    verb(1,project_name)
    verb(1,self.Data)

  def read_vector(self,filename):
    file_data = {}
    file_data['file_name'] = filename
    file_data['xsim'] = load_vector_file(self.Data,"hash",'xsim',filename)
    file_data['questa'] = load_vector_file(self.Data,"hash",'questa',filename)
    self.Data['files'].append(file_data)

  def report(self):
    flag = 0
    verb(0,"====================================================")
    verb(0,"==                     REPORT                     ==")
    verb(0,"====================================================")
    verb(0,"Project Base Name : " + self.Data['project_name'])
    for files in self.Data['files'] :
      verb(0,"==========")
      if files['xsim']['exist'] == 1:
        verb(0,"             file : " + files['file_name'])
        verb(0,"        Xsim file : " + files['xsim']['full_path'])
        verb(0,"   Xsim file hash : " + str(files['xsim']['hash']))
        verb(0,"        Num lines : " + str(files['xsim']['num_lines']))
      else:
        verb(0,"File not found")

      if files['questa']['exist'] == 1:
        verb(0,"        Xsim file : " + files['questa']['full_path'])
        verb(0,"   Xsim file hash : " + str(files['questa']['hash']))
        verb(0,"        Num lines : " + str(files['questa']['num_lines']))
      else:
        verb(0,"File not found")
      
      if files['xsim']['exist'] + files['questa']['exist'] == 2 :
        if files['xsim']['hash'] == files['questa']['hash'] :
          verb(0,"       Hash check : " + "same hash")
        else:
          verb(0,"       Hash check : " + "Hash are not equal")
          flag += 1
      else:
        verb(0,"       Hash check : " + "Missing file")
        flag += 1
    verb(0,"====================================================")

    if flag > 0:
      verb(0,"WARNING : simulation output vectors differ between simulations")
      exit(flag)


#-----------------------------------------------------------
#
#-----------------------------------------------------------


def load_vector_file(prj_data, mode, sim, file_name):

  ov_data = {}
  verb(1,"------------------- read vectors -------------------")
  verb(1, "laod mode : " + mode)
  # if where == "local":
  full_path = "../../Projects/" + prj_data['subprj_name'][sim] + "/"+ prj_data['subprj_name'][sim] + output_vector_path + sim + "/" + file_name
  # else:
  #   full_path = ""
  verb(1,"full path  :  " + full_path)

  ov_data['full_path'] = full_path

  try:
    ov_data['exist'] = 1
    with open(full_path, newline='') as f:
      num_lines = 0
      for row in f:
        num_lines += 1
      ov_data['num_lines'] = num_lines
      verb(1," num lines : " + str(ov_data['num_lines']))

    if mode.find("hash") > -1:

      BLOCK_SIZE = 64 # The size of each read from the file

      data_hash =  hashlib.md5()
      with open(full_path, newline='') as f:
        fb = f.read(BLOCK_SIZE) # read entire file as bytes
        verb(1,fb)
        while len(fb) > 0 :
          data_hash.update(fb.encode('utf-8'))
          fb = f.read(BLOCK_SIZE) # read entire file as bytes
          verb(1,fb)
      verb(1," hash : " + str(data_hash.hexdigest()))

      ov_data['hash'] = data_hash.hexdigest()
      # ov_data['hash'] = hashlib.md5(open(ov_data['full_path'] ,'rb').read()).hexdigest()


  except IOError:
    ov_data['exist'] = 0
    verb(1," File does not exists")


  return ov_data
  
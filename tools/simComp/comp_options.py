#------------------------------------------------------------------------------
#  UMass , Physics Department
#  Guillermo Loustau de Linares
#  gloustau@cern.ch
#------------------------------------------------------------------------------
#  Project: ATLAS L0MDT Trigger 
#  Module: Simulation comparator
#  Description: global options
#------------------------------------------------------------------------------
#  Revisions: 
#    v0  - 2020.11.2 creation
#      
#------------------------------------------------------------------------------

def set_verbose_level(vl):
  print("set_verbose_level : " + str(vl))
  global verbose_level
  verbose_level = vl
  
#-----------------------------------------------------------
#
#-----------------------------------------------------------
def verb(v_level,*print_args):
  if verbose_level >= v_level:
    for print_arg in print_args:
      print (print_arg)
    print
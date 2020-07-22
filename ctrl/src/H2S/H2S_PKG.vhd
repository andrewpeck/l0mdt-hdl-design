--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;


package H2S_CTRL is
  type H2S_HPS_INNER_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
  end record H2S_HPS_INNER_MON_t;


  type H2S_HPS_INNER_CTRL_t is record
    RESET                      :std_logic;   
  end record H2S_HPS_INNER_CTRL_t;


  constant DEFAULT_H2S_HPS_INNER_CTRL_t : H2S_HPS_INNER_CTRL_t := (
                                                                   RESET => '0'
                                                                  );
  type H2S_HPS_MIDDLE_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
  end record H2S_HPS_MIDDLE_MON_t;


  type H2S_HPS_MIDDLE_CTRL_t is record
    RESET                      :std_logic;   
  end record H2S_HPS_MIDDLE_CTRL_t;


  constant DEFAULT_H2S_HPS_MIDDLE_CTRL_t : H2S_HPS_MIDDLE_CTRL_t := (
                                                                     RESET => '0'
                                                                    );
  type H2S_HPS_OUTER_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
  end record H2S_HPS_OUTER_MON_t;


  type H2S_HPS_OUTER_CTRL_t is record
    RESET                      :std_logic;   
  end record H2S_HPS_OUTER_CTRL_t;


  constant DEFAULT_H2S_HPS_OUTER_CTRL_t : H2S_HPS_OUTER_CTRL_t := (
                                                                   RESET => '0'
                                                                  );
  type H2S_HPS_EXTRA_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
  end record H2S_HPS_EXTRA_MON_t;


  type H2S_HPS_EXTRA_CTRL_t is record
    RESET                      :std_logic;   
  end record H2S_HPS_EXTRA_CTRL_t;


  constant DEFAULT_H2S_HPS_EXTRA_CTRL_t : H2S_HPS_EXTRA_CTRL_t := (
                                                                   RESET => '0'
                                                                  );
  type H2S_MON_t is record
    HPS_INNER                  :H2S_HPS_INNER_MON_t;
    HPS_MIDDLE                 :H2S_HPS_MIDDLE_MON_t;
    HPS_OUTER                  :H2S_HPS_OUTER_MON_t; 
    HPS_EXTRA                  :H2S_HPS_EXTRA_MON_t; 
  end record H2S_MON_t;


  type H2S_CTRL_t is record
    HPS_INNER                  :H2S_HPS_INNER_CTRL_t;
    HPS_MIDDLE                 :H2S_HPS_MIDDLE_CTRL_t;
    HPS_OUTER                  :H2S_HPS_OUTER_CTRL_t; 
    HPS_EXTRA                  :H2S_HPS_EXTRA_CTRL_t; 
  end record H2S_CTRL_t;


  constant DEFAULT_H2S_CTRL_t : H2S_CTRL_t := (
                                               HPS_INNER => DEFAULT_H2S_HPS_INNER_CTRL_t,
                                               HPS_MIDDLE => DEFAULT_H2S_HPS_MIDDLE_CTRL_t,
                                               HPS_OUTER => DEFAULT_H2S_HPS_OUTER_CTRL_t,
                                               HPS_EXTRA => DEFAULT_H2S_HPS_EXTRA_CTRL_t
                                              );


end package H2S_CTRL;
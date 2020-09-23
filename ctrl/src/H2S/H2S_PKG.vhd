--This file was auto-generated.
--Modifications might be lost.
library IEEE;
use IEEE.std_logic_1164.all;

library shared_lib;
use shared_lib.l0mdt_dataformats_pkg.all;

package H2S_CTRL is
  type H2S_HPS_LSF_MON_t is record
    STATUS                     :std_logic;
    --SpyBuffer
     sb_lsf_mdt_hits_rdata     :std_logic_vector(HEG2SFHIT_LEN-1 downto 0);
  end record H2S_HPS_LSF_MON_t;


  type H2S_HPS_LSF_CTRL_t is record
    RESET                      :std_logic;   
    HBA_MAX_CLOCKS             :std_logic_vector( 9 downto 0);  -- add some description
    --SpyBufer signals
    sb_lsf_mdt_hits_freeze     : std_logic;
    sb_lsf_mdt_hits_re         : std_logic;
    sb_lsf_mdt_hits_raddr      : std_logic_vector (7 downto 0);
  end record H2S_HPS_LSF_CTRL_t;


  constant DEFAULT_H2S_HPS_LSF_CTRL_t : H2S_HPS_LSF_CTRL_t := (
                                                               RESET => '0',
                                                               HBA_MAX_CLOCKS => "0010000000",
                                                               sb_lsf_mdt_hits_freeze        => '0',
                                                               sb_lsf_mdt_hits_re            => '0',
                                                               sb_lsf_mdt_hits_raddr         => "00000000"
                                                               );
  type H2S_HPS_CSF_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
  end record H2S_HPS_CSF_MON_t;


  type H2S_HPS_CSF_CTRL_t is record
    RESET                      :std_logic;   
  end record H2S_HPS_CSF_CTRL_t;


  constant DEFAULT_H2S_HPS_CSF_CTRL_t : H2S_HPS_CSF_CTRL_t := (
                                                               RESET => '0'
                                                              );
  type H2S_HPS_MON_t is record
    STATUS                     :std_logic;   
    READY                      :std_logic;   
    LSF                        :H2S_HPS_LSF_MON_t;
    CSF                        :H2S_HPS_CSF_MON_t;
  end record H2S_HPS_MON_t;
  type H2S_HPS_MON_t_ARRAY is array(0 to 3) of H2S_HPS_MON_t;

  type H2S_HPS_CTRL_t is record
    RESET                      :std_logic;   
    LSF                        :H2S_HPS_LSF_CTRL_t;
    CSF                        :H2S_HPS_CSF_CTRL_t;
  end record H2S_HPS_CTRL_t;
  type H2S_HPS_CTRL_t_ARRAY is array(0 to 3) of H2S_HPS_CTRL_t;

  constant DEFAULT_H2S_HPS_CTRL_t : H2S_HPS_CTRL_t := (
                                                       RESET => '0',
                                                       LSF => DEFAULT_H2S_HPS_LSF_CTRL_t,
                                                       CSF => DEFAULT_H2S_HPS_CSF_CTRL_t
                                                      );
  type H2S_MON_t is record
    HPS                        :H2S_HPS_MON_t_ARRAY;
  end record H2S_MON_t;


  type H2S_CTRL_t is record
    HPS                        :H2S_HPS_CTRL_t_ARRAY;
  end record H2S_CTRL_t;


  constant DEFAULT_H2S_CTRL_t : H2S_CTRL_t := (
                                               HPS => (others => DEFAULT_H2S_HPS_CTRL_t )
                                              );


end package H2S_CTRL;

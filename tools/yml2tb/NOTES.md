
Sorting out the type suffixes

_avt "array of vector type"
   type tar2hps_avt is array(integer range <>) of tar2hps_rvt;

_rvt "record (converted to) vector type"
   subtype tar2hps_rvt is std_logic_vector(TAR2HPS_LEN-1 downto 0);

_rt "record type"

Functions exist:
  function vectorify(x: tar2hps_rt) return tar2hps_rvt;
  function structify(x: tar2hps_rvt) return tar2hps_rt;


This comes from yaml:
  tar2hps_      : {array: open , type: tar2hps , _: off}

and
  tar2hps:
    - tube        : { type: unsigned , length: MDT_TUBE_LEN }
    - layer       : { type: unsigned , length: MDT_LAYER_LEN }
    - chamber_id  : { type: unsigned , length: SLC_CHAMBER_LEN}
    - time        : { type: unsigned , length: MDT_TIME_LEN }
    - data_valid  : { type: logic}

---------- Examples ----------

So if yaml just defines a record type:

  l0mdt_control:
    clk       : { type: logic}
    rst       : { type: logic}
    bx        : { type: logic}

then we get an _rt and an _rvt plus the conversion functions

  type l0mdt_control_rt is record
     clk                  :  std_logic;
     rst                  :  std_logic;
     bx                   :  std_logic;
  end record l0mdt_control_rt;
  constant L0MDT_CONTROL_LEN : integer := 3;
  subtype l0mdt_control_rvt is std_logic_vector(L0MDT_CONTROL_LEN-1 downto 0);
  function vectorify(x: l0mdt_control_rt) return l0mdt_control_rvt;
  function structify(x: l0mdt_control_rvt) return l0mdt_control_rt;
  function nullify (x: l0mdt_control_rt) return l0mdt_control_rt;

--------------------

If yaml defines an open array:

  tar2hps_      : {array: open , type: tar2hps , _: off}

then we get all this:

  type tar2hps_at is array(integer range <>) of tar2hps_rt;
  type tar2hps_avt is array(integer range <>) of tar2hps_rvt;
  function vectorify(x: tar2hps_at) return tar2hps_avt;
  function vectorify(x: tar2hps_at) return std_logic_vector;
  function structify(x: tar2hps_avt) return tar2hps_at;
  function structify(x: std_logic_vector) return tar2hps_at;
  function nullify(x: tar2hps_at) return tar2hps_at;
  function nullify(x: tar2hps_avt) return tar2hps_avt;

# YML2HDL Custom Types

YML2HDL converts HDL types described as YAML files to HDL types. Only
VHDL is supported for now due to many changes that happened recently
when the scripts were updated to support the CERN ATLAS L0MDT project.

The main feature of this project is not the generation of the HDL
types itself, but the correlated conversion functions available. For
each type created, functions to convert to and from plain bit vectors
are provided. This is useful, for example, when communicating between
blocks of different languages (usually only simple types are allowed),
and when storing structured data into memory. Implementation relies
heavily on function overload, providing a simple API: the `vectorify`,
`sctructify` and `nullify` functions, along with some types and
constants. For the later, YAML2HDL makes use of suffixes that are not
so obvious at first.

This tool also support splitting YAML source into multiple sources,
which allows separating the development into modules. If the `-o`
(output directory) option is not used, it will create the `VHDL`
package side-by-side (same directory) with the YAML types description
file, independently of the current work directory.

## YAML custom types file

YAML was chosen because of being human readable and for its natural
organizational structure. Imitating VHDL `records`, the YAML file can
have up to 2 level structures for types and re-use the types
defined. YML2HDL also allows the use of the auto-generated types and
constants implicitly, although it requires the developer to know their
names beforehand.

### Types

The YAML file should have at least a top structure to hold the list of
types, this structure is not optional. Any name containing ``type``,
``constant``, or ``hdl`` are accepted for that. Case is
ignored. Symple types can be described as:

```
<name> :
  qualifier: <qualifier>
  type: <type>
  length: <length>
  value: <value>
```

Which also can be represented in the inline form (much more clear when
using complex structures), for example:

```
<name>: [type: <type>, length: <length>]
```

As we can see from the example above, not all parameters are required,
and the script will try to guess the intention of the description. The
parameters can be:

- type: `logic`, basic types (integer, etc), or previous declared types.

  ```
  bit: [type: logic]
  ```

- qualifier: `constant`. In most case it is not required for now, but
  this can change in the future.

  ```
  MY_CONSTANT: [qualifier: constant, type: integer, length: 10]
  ```
  
- length: `open`, or an integer number. If target type was previously
  defined as `open`, it will replace that value:

  ```
  vector0: [type: logic, length: open]
  vector1: [type: vector0, length: MY_CONSTANT]
  ```

- value: some initial value. Very limited usage possible for now.

Records are recognized by its 2-level structure, for example:

  ```yaml
  record0:
    the_bit     : [type: bit]
    the_vector0 : [type: vector0, length: MY_CONSTANT]
    the_vector1 : [type: vector1]
  ```

Finally, arrays are defined by the parameter "array" as follows:

  ```
  arrayA: [array: 3, type: vector1]
  arrayB: [array: open, type: vector0, length: MY_CONSTANT]
  arrayC: [array: MY_CONSTANT, type: record0]
  ```

And as mentioned above, use of auto-generated structures are allowed:

  ```yaml
  vector2: [type: record0_rvt]
  arrayD: [type: logic, length: RECORD0_LEN]
  ```

## Extra parameters

Types can be described by some extra options:

- `~: <comment>`: allows inclusion of comments in the generated
  types. Multiple `~` can be used for multi-line comments.

- `_: <on | off>`: includes or not the underscore before the suffix of
  a type. Default is `on`.

- `dprint: <on | off>`: print some debug information about a specific
  type. It is probably less useful than you expect.

### Basic configuration of the YAML source file

An optional structure can be used with basic configuration
details. Any name containing `config` is valid, case insensitive. For
now, only two parameters are implemented:

```yaml
config:
  basic_convert_functions: on
  packages:
    lib_1:
      - package_1
      - package_2
    lib_2: the_other_package
```

- `basic_convert_functions` controls the creation of the overload
  functions for the basic types. This is needed when separating the
  files in multiple pieces.

- `packages` allows the inclusion of VHDL packages in the generated
  files, as expected. These are just descriptions of VHDL packages and
  are not used as source for the types constructions in anyway. For
  that, see the `--external` option bellow.

## Auto-generated HDL structures

To allow the conversion between the new types and logic vectors,
auxiliary types are automatically generated making use of specific
suffixes, which are added to the orignal name specified in the yml
file.

- `<element name>_t`: simple type

- `<structure name>_rt`: record type
  
- `<structure name>_LEN`: length of the record or array in bits

- `<structure name>_rvt`: bit vector type to translate from a related record type

- `<structure name>_at`: array type

- `<structure name>_avt`: array type based on bit vectors

Keep in mind that if the record has elements that are not completely
defined (open ranges) in the source YAML file, then most of the
conversion resources will not be created.


## Running the script

To execute the script, it should be as simple as:

```bash
$ python3 <yml2hdl dir path>/yml2hdl.py <yml types path>
```

To split the custom types into multiple files, the `--external` (`-e`)
option is available:

```bash
$ python3 -e <a yml path> -e <other yml path> <target yml path>
```

The output directory can be changed with the `--output` (`-o`) option:

```bash
$ python3 -o <directory path> <target yml path>
```

It is also possible to modify the defined types with a custom file
(only change types that are present in the base file):

```bash
$ python3 -c <customizing yml file path> <target yml path>
```


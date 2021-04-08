import os
import sys
import copy
import re

import _element as ele
import _record as rec
import _array as arr

from _helpers import *

from math import *

special = []
special += ['+']
special += ['*']
special += ['/']
special += ['-']
special += ['(']
special += [')']
special += [' ']
special += ['integer']
special += ['log2']
special += ['ceil']
special += ['real']

struct_names = ["type", "constant", "hdl"]

class Config:
    def __init__(self, c):
        self.write_functions = c.get('basic_convert_functions', False)
        self.pkgs = c.get('packages', dict())

class Package:
    def __init__(self, src, ext=[], parent=None):

        self.parent = parent

        tmp = type("package", (), {"name": "", "decl": [], "body":[]})

        self.db = {}
        self.bd = {}

        self.db_extra = {}
        self.bd_extra = {}

        self.len_db = {}

        self.ext = []
        for e in ext:
            self.ext += [Package(e, parent=self)]
            for x, y in self.ext[-1].db.items():
                y.format_full_type(tmp, 0, name=x)

        # Get parent items in the src structure.
        # It is case insensitive.
        # Due to compatibility, it can be written between underscore-underscore.
        
        self.conf = {}
        for s in list(src.keys()):
            if 'config' in s.lower():
                self.conf = Config(src.pop(s))

            elif any(x in s.lower() for x in struct_names):
                for z in src[s]:
                    if z is None or len(z) != 1:
                        print("ERROR: wrong format.")
                        sys.exit(1)
                    for x, y in z.items(): pass

                    d = {};
                    d["_"] = True
                    d['comments'] = []
                    d['dprint'] = False
                    
                    for item  in y:
                        if None in item:
                            d['comments'] += [item[None]]
                        elif "comment" in item:
                            d['comments'] += [item["comment"]]
                        else:
                            d.update(item)
                        
                    if d.get('array'):
                        obj = arr.Array(self, self, x, **d)
                    elif d.get('type'):
                        obj = ele.Element(self, self, x, **d)
                    else:
                        obj = rec.Record(self, self, x, d)
                    
                    self.add(x, obj)
                
                print("  ----")
                for x, y in self.db.items():
                    print("  PARSED:", str(x))

    def add(self, x, obj):
        if x in self.db:
            print(f"ERROR: {x} was already added before (name clash).")
            sys.exit(1)
        self.db[x] = obj
        self.bd[obj] = x
    
    def add_extra(self, x, obj):
        if x in self.db_extra:
            print(f"ERROR: {x} was already added before (name clash).")
            sys.exit(1)
        self.db_extra[x] = obj
        self.bd_extra[obj] = x
    
    def get(self, key, cnt=0):

        if self.parent is not None and cnt == 0:
            return self.parent.get(key, cnt)

        obj = self.db.get(key)
        if obj: return obj

        obj = self.bd.get(key)
        if obj: return obj

        obj = self.db_extra.get(key)
        if obj: return obj

        obj = self.bd_extra.get(key)
        if obj: return obj

        for e in self.ext:
            obj = e.get(key, cnt+1)
            if obj: return obj

    def add_len_db(self, key, value):
        if key in self.len_db.keys():
            print(f"ERROR: {key} already defined before (name clash).")
            sys.exit(1)
        self.len_db[key] = value

    def get_len_db(self, key):
        return self.len_db.get(key, None)

    def translate(self, v, cnt=0):

        if self.parent is not None and cnt == 0:
            return self.parent.translate(v, cnt+1)
        
        if v is None:
            return v

        if v == "open":
            return v

        if isinstance(v, int):
            return v

        try:
            return int(v)
        except:
            pass

        if ',' in v:
            return v

        if len([True for x in special if x in v]):
            items = re.split('(\W)', v)
            s = ""
            for i in items:
                if i and i not in special:
                    s += f"{self.translate(i)}"
                elif i == "integer":
                    s += f"int"
                elif i == "real":
                    s += f"float"
                else:
                    s += f"{i}"
            return eval(s)


        aux = self.get(v)
        if aux == None:
            aux = self.get_len_db(v)
            
        if aux:
            if isinstance(aux, int):
                return aux

            ret = aux.get_value()

            if ret == "open":
                return ret

            if isinstance(ret, int):
                return ret

            ret = self.translate(ret)

            if isinstance(ret, int):
                return ret

        for ext in self.ext:
            ret = ext.translate(v, cnt+1)

            if isinstance(ret, int):
                return ret

        if cnt == 0:
            print (f"ERROR: {v} not found.")
            sys.exit(1)

    def format_preamble(self, p):

        info = []
        info += ["This file was auto-generated by YML2HDL toll."]
        info += ["https://gitlab.com/tcpaiva/yml2hdl"]

        for l in info:
            p.decl += [f"-- {l}"]

        blank_line(p.decl)

        self.format_packages(p)

        flush(p.decl, f"package {p.name} is")
        blank_line(p.decl)

        flush(p.body, f"package body {p.name} is")
        blank_line(p.body)

    def format_packages(self, p):
        
        if "library ieee;" not in str(self.conf.pkgs).lower():
            p.decl += ["library ieee;"]
            p.decl += ["use ieee.std_logic_1164.all;"]
            p.decl += ["use ieee.numeric_std.all;"]
            p.decl += ["use ieee.math_real.all;"]
            blank_line(p.decl)

        if isinstance(self.conf.pkgs, list):
            for lst in self.conf.pkgs:
                for lib, pkgs in lst.items():
                    p.decl += [f"library {lib};"]
                    blank_line(p.decl)
                    for pkg in pkgs:
                        p.decl += [f"use {lib}.{pkg}.all;"]
                    blank_line(p.decl)
                    
        elif isinstance(self.conf.pkgs, dict):
            for x in [p.decl]:
                for lib in self.conf.pkgs:
                    x += [f"library {lib};"]
                    pkgs = self.conf.pkgs.get(lib)
                    pkgs = pkgs if isinstance(pkgs, list) else [pkgs]
                    for pkg in pkgs:
                        x += [f"use {lib}.{pkg}.all;"]                    
                blank_line(p.decl)

            # let's make some space (organization)
            # blank_line(p.decl)

    def format_closing(self, p):

        flush(p.decl, f"end package {p.name};")
        blank_line(p.decl)
        flush(p.decl, "-"*60)
        blank_line(p.decl)
        flush(p.body, f"end package body {p.name};")


    def format_types(self, package):
        # type to write types
        for x, y in self.db.items():
            print("  WRITING:", x)
            y.format_full_type(package, 2, name=x)

    def format_extra(self, package):
        # we need some functions involving regular types so that
        # recurring functions are allowed

        decl = package.decl
        body = package.body
        ind = 2

        if self.conf.write_functions is True:

            # structify for basic types ------------------------------------

            s = f"function structify(x: std_logic_vector) return signed"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return signed(x);"
            flush(body, s, ind)
            s = f"end function structify;"
            flush(body, s, ind)

            s = f"function structify(x: std_logic_vector) return unsigned"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return unsigned(x);"
            flush(body, s, ind)
            s = f"end function structify;"
            flush(body, s, ind)

            s = f"function structify(x: std_logic_vector) return std_logic_vector"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return std_logic_vector(x);"
            flush(body, s, ind)
            s = f"end function structify;"
            flush(body, s, ind)

            s = f"function structify(x: std_logic_vector) return integer"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return to_integer(unsigned(x));"
            flush(body, s, ind)
            s = f"end function structify;"
            flush(body, s, ind)

            s = f"function structify(x: std_logic_vector) return std_logic"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return x(x'left);"
            flush(body, s, ind)
            s = f"end function structify;"
            flush(body, s, ind)

            # vectorify for basic types ------------------------------------

            blank_line(decl)
            blank_line(body)

            s = f"function vectorify(x: signed) return std_logic_vector"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return std_logic_vector(x);"
            flush(body, s, ind)
            s = f"end function vectorify;"
            flush(body, s, ind)

            s = f"function vectorify(x: unsigned) return std_logic_vector"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return std_logic_vector(x);"
            flush(body, s, ind)
            s = f"end function vectorify;"
            flush(body, s, ind)

            s = f"function vectorify(x: std_logic_vector) return std_logic_vector"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return x;"
            flush(body, s, ind)
            s = f"end function vectorify;"
            flush(body, s, ind)

            s = f"function vectorify(x: integer) return std_logic_vector"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return std_logic_vector(to_unsigned(x, 32));"
            flush(body, s, ind)
            s = f"end function vectorify;"
            flush(body, s, ind)

            s = f"function vectorify(x: std_logic) return std_logic_vector"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"  variable y: std_logic_vector(0 downto 0);", ind)
            flush(body, f"begin", ind)
            flush(body, "  y(0) := x;", ind)
            flush(body, "  return y;", ind)
            flush(body, "end function vectorify;", ind)

            # nullify for basic types ------------------------------------

            blank_line(decl)
            blank_line(body)

            s = f"function nullify(x: std_logic) return std_logic"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"return '0';"
            flush(body, s, ind+2)
            s = f"end function nullify;"
            flush(body, s, ind)

            s = f"function nullify(x: std_logic_vector) return std_logic_vector"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"return (x'range => '0');"
            flush(body, s, ind+2)
            s = f"end function nullify;"
            flush(body, s, ind)

            s = f"function nullify(x: unsigned) return unsigned"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return to_unsigned(0, x'length);"
            flush(body, s, ind)
            s = f"end function nullify;"
            flush(body, s, ind)

            s = f"function nullify(x: signed) return signed"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return to_signed(0, x'length);"
            flush(body, s, ind)
            s = f"end function nullify;"
            flush(body, s, ind)

            s = f"function nullify(x: integer) return integer"
            flush(decl, f"{s};", ind)
            flush(body, f"{s} is", ind)
            flush(body, f"begin", ind)
            s = f"  return 0;"
            flush(body, s, ind)
            s = f"end function nullify;"
            flush(body, s, ind)

            blank_line(decl)
            blank_line(body)

    def write(self, output_dir, package_name):

        p = type("package", (), {"name": package_name, "decl": [], "body":[]})

        self.format_preamble(p)
        self.format_extra(p)
        self.format_types(p)
        self.format_closing(p)

        tgt = os.path.join(output_dir, f"{package_name}.vhd")
        with open(tgt, 'w') as f:
            for l in p.decl:
                f.write(f"{l}\n")
            for l in p.body:
                f.write(f"{l}\n")

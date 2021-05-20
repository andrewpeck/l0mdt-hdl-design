import sys

import _record as rec
import _element as ele

from _helpers import *

class Array:
    def __init__(self, parent, root, name, _, **kwargs):
        self.parent = parent
        self.root = root
        self.name = name
        self.dprint = kwargs.get("dprint", None)

        if _:
            self._ = "_"
        else:
            self._ = ""

        self.add_element(kwargs)

    def __str__(self):
        return f"A {self.name} [array: {self.array}]"

    def print(self, *args):
        if self.dprint:
            print(f"{self} >", *args)

    def add_element(self, e):
        _ = e.pop('_', True)
        self.array = e.pop("array")
        if self.array is None:
            print(f"Array cannot have array size as null")
            sys.exit(1)
        self.e = ele.Element(self, self.root, self.name+"_e", _=_, **e)

    def get(self, key=None):
        return self.e

    def bitlen(self, array=None, resolve=False):
        a = array if array else self.array

        if a == "open":
            return a
        
        re = None
        eobj = self.root.get(self.e.type)
        if eobj:
            ebl = eobj.bitlen(self.e.length, resolve)
            if ebl != "open":
                l1 = self.root.translate(a)
                l2 = self.root.translate(ebl)
                re =  l1 * l2
            else:
                re = "open"
        else:
            l1 = self.root.translate(a)
            re = l1 * self.e.bitlen(self.e.length)
            
        if isinstance(re, str) and re.count("open") > 1:
            print("ERROR: please check lengths for {self.name}.")
            sys.exit(1)

        self.print(f"bitlen {re}")
        return re

    def get_erange(self):
        if self.e.length == "open" and self.e.bitlen() == "open":
            print(f"ERROR: element length not defined in {self.name}")
            sys.exit(1)
            
        if self.e.length:
            return f"({self.e.length}-1 downto 0)"
        else:
            return ""

    def get_arange(self, array=None):
        a = array if array else self.array

        if a == "open":
            return f"(integer range <>)"
        elif a or a == 0:
            return f"({a}-1 downto 0)"

        print("ERROR: Array range not defined (probably a bug, please report).")
        sys.exit(1)

    def format_full_type(self, package, indentation, name):
        self.format_type(package, indentation, name)
        blank_line(package.decl)
        blank_line(package.body)

    def format_type(self, package, indentation, name):
        decl = package.decl
        body = package.body
        ind = indentation

        class aux: pass

        aux.e_main = self.root.get(self.e.type)
        self.print(f"format_type: aux.e_main {aux.e_main}")

        if isinstance(aux.e_main, Array):
            aux.e_name  = f"{self.e.type}{aux.e_main._}at"
            aux.e_range = self.get_erange()
            aux.ev_name = f"{self.e.type}{aux.e_main._}avt"
            aux.ev_range = self.get_erange()
        elif isinstance(aux.e_main, rec.Record):
            aux.e_name  = f"{self.e.type}{aux.e_main._}rt"
            aux.e_range = ""
            aux.ev_name = f"{self.e.type}{aux.e_main._}rvt"
            aux.ev_range = ""
        elif isinstance(aux.e_main, ele.Element):
            aux.e_name  = f"{self.e.type}{aux.e_main._}t"
            aux.e_range = self.get_erange()
            aux.ev_name = f"std_logic_vector"
            aux.ev_range = self.e.get_range()
            # aux.ev_name = f"{self.e.type}{aux.e_main._}t"
            # aux.ev_range = self.get_erange()
        else:
            aux.e_name  = f"{self.e.get_type()}"
            aux.e_range = f"{self.e.get_range()}"
            aux.ev_name = f"std_logic_vector"
            aux.ev_range = f"{self.e.get_range(vector=True)}"

        aux.a_name  = f"{name}{self._}at"
        aux.av_name = f"{name}{self._}avt"
        aux.a_range = self.get_arange()
        fmt = f"type {aux.a_name} is array{aux.a_range} of {aux.e_name}"
        if aux.e_range:
            fmt += f"{aux.e_range}"
        flush(decl, f"{fmt};", ind)

        fmt = f"type {aux.av_name} is array{aux.a_range} of {aux.ev_name}"
        if aux.ev_range:
            fmt += f"{aux.ev_range}"
        flush(decl, f"{fmt};", ind)

        self.format_vectorify(package, ind, aux)
        self.format_structify(package, ind, aux)
        self.format_nullify(package, ind, aux)

    def format_vectorify(self, package, indentation, aux):
        # array of structured data -> array of vectors

        decl = package.decl
        body = package.body
        ind = indentation

        s = f"function vectorify(x: {aux.a_name}) return {aux.av_name}"
        flush(decl, f"{s};", ind)
        flush(body, f"{s} is", ind)
        s = f"  variable y :  {aux.av_name}"
        if self.array == "open":
            s += f"(x'range)"
        flush(body, f"{s};", ind)
        s = f"begin"
        flush(body, s, ind)
        s = f"  l: for i in x'range loop"
        flush(body, s, ind)
        s = f"    y(i) := vectorify(x(i));"
        flush(body, s, ind)
        s = f"  end loop l;"
        flush(body, s, ind)
        s = f"  return y;"
        flush(body, s, ind)
        s = f"end function vectorify;"
        flush(body, s, ind)

        s = f"function vectorify(x: {aux.a_name}) return std_logic_vector"
        flush(decl, f"{s};", ind)
        flush(body, f"{s} is", ind)
        e_len = self.e.bitlen(self.e.length)
        flush(body, f"  variable msb : integer := x'length*{e_len}-1;", ind)
        flush(body, f"  variable y : std_logic_vector(msb downto 0);", ind)
        flush(body, f"begin", ind)
        flush(body, f"  l: for i in x'range loop", ind)
        flush(body, f"    y(msb downto msb-{e_len}+1) := vectorify(x(i));", ind)
        flush(body, f"    msb := msb - {e_len};", ind)
        flush(body, f"  end loop l;", ind)
        flush(body, f"  return y;", ind)
        flush(body, f"end function vectorify;", ind)

    def format_structify(self, package, indentation, aux):
        # array of vectors -> array of structured data

        decl = package.decl
        body = package.body
        ind = indentation

        s = f"function structify(x: {aux.av_name}) return {aux.a_name}"
        flush(decl, f"{s};", ind)
        flush(body, f"{s} is", ind)
        s = f"  variable y :  {aux.a_name}"
        if self.array == "open":
            s += f"(x'range)"
        flush(body, f"{s};", ind)
        s = f"begin"
        flush(body, s, ind)
        s = f"  l: for i in x'range loop"
        flush(body, s, ind)
        s = f"    y(i) := structify(x(i));"
        flush(body, s, ind)
        s = f"  end loop l;"
        flush(body, s, ind)
        s = f"  return y;"
        flush(body, s, ind)
        s = f"end function structify;"
        flush(body, s, ind)

        s = f"function structify(x: std_logic_vector) return {aux.a_name}"
        flush(decl, f"{s};", ind)
        flush(body, f"{s} is", ind)
        e_len = self.e.bitlen(self.e.length)
        s = f"  variable y :  {aux.a_name}"
        if self.array == "open":
            s += f"(x'range)"
        flush(body, f"{s};", ind)
        flush(body, f"  variable msb : integer := x'left;", ind)
        flush(body, f"begin", ind)
        flush(body, f"  l: for i in y'range loop", ind)
        flush(body, f"    y(i) := structify(x(msb downto msb-{e_len}+1));", ind)
        flush(body, f"    msb := msb - {e_len};", ind)
        flush(body, f"  end loop l;", ind)
        flush(body, f"  return y;", ind)
        flush(body, f"end function structify;", ind)

    def format_nullify(self, package, indentation, aux):
        # function to zero arrays

        decl = package.decl
        body = package.body
        ind = indentation

        s = f"function nullify(x: {aux.a_name}) return {aux.a_name}"
        flush(decl, f"{s};", ind)
        flush(body, f"{s} is", ind)
        s = f"  variable y :  {aux.a_name}"
        if self.array == "open":
            s += f"(x'range)"
        flush(body, f"{s};", ind)
        s = f"begin"
        flush(body, s, ind)
        s = f"  l: for i in y'range loop"
        flush(body, s, ind)
        s = f"    y(i) := nullify(x(i));"
        flush(body, s, ind)
        s = f"  end loop l;"
        flush(body, s, ind)
        s = f"  return y;"
        flush(body, s, ind)
        s = f"end function nullify;"
        flush(body, s, ind)

        s = f"function nullify(x: {aux.av_name}) return {aux.av_name}"
        flush(decl, f"{s};", ind)
        flush(body, f"{s} is", ind)
        s = f"  variable y :  {aux.av_name}"
        if self.array == "open":
            s += f"(x'range)"
        flush(body, f"{s};", ind)
        s = f"begin"
        flush(body, s, ind)
        s = f"  l: for i in y'range loop"
        flush(body, s, ind)
        s = f"    y(i) := nullify(x(i));"
        flush(body, s, ind)
        s = f"  end loop l;"
        flush(body, s, ind)
        s = f"  return y;"
        flush(body, s, ind)
        s = f"end function nullify;"
        flush(body, s, ind)

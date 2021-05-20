import sys

import _array as arr
import _record as rec

from _helpers import *

class Element:
    def __init__(self
                 , parent
                 , root
                 , name
                 , type
                 , _
                 , length = None
                 , qualifier = None
                 , comments = []
                 , value = None
                 , dprint = None):
        self.parent = parent
        self.root = root
        self.name = name
        self.dprint = dprint

        self.type = type
        self.length = length
        self.qualifier = qualifier
        self.comments = comments
        self.value = value

        self.subtype = True if self.root.get(self.type) else False
        self._ = "_" if _ else ""

    def __str__(self):
        return f"E {self.name} [t:{self.type}|l:{self.length}|q:{self.qualifier}|v:{self.value}]"

    def print(self, *args):
        if self.dprint:
            print(f"{self} >", *args)

    def get_value(self):
        return self.value
    
    def bitlen(self, length=None, resolve=False):

        self.print(f"Entering bitlen function l:{length} r:{resolve} s.l:{self.length}")
            
        l = length if length else self.length
        
        basic = ["logic", "signed", "unsigned"]
        if self.type in basic:
            eobj = self.root.get(l)
            self.print(f"Object related to {l} is {eobj}")
            if isinstance(eobj, rec.Record):
                l = eobj.get_value()
            elif eobj and resolve:
                l = eobj.get_value()
            re = l if l else 1
        
        elif self.type == "integer" or self.type == "natural":
            re = 32 * l if l else 32
                
        elif self.type == "real":
            re = 32 * l if l else 32

        else:
            eobj = self.root.get(self.type)
            if eobj:
                re = eobj.bitlen(l)
            else:
                re = l
            
                
        # elif isinstance(self.root.get(self.type), arr.Array):
        #     ref = self.root.get(self.type)
        #     # self.print(f"bitlen Array s.l:{self.length} {ref} {ref.e} L:{length}")
        #     l = length if length else ref.array
        #     e_len = ref.e.bitlen()
        #     if e_len == "open" and ref.array == "open":
        #         re = "open"
        #     else:
        #         re = self.root.translate(l) * self.root.translate(e_len)
        # 
        # elif isinstance(self.root.get(self.type), Element):
        #     ref = self.root.get(self.type)
        #     self.print(f"bitlen Element {ref} s.l:{self.length} l:{length}")
        #     
        #     l = length if length else self.length
        #     re = ref.bitlen(self.length)
        # 
        # elif isinstance(self.root.get(self.type), rec.Record):
        #     ref = self.root.get(self.type)
        #     re = ref.bitlen()
        # 
        # else:
        #     re = self.length
        
        self.print(f"bitlen {re}")
        return re
        
    def get_range(self, vector=False):
        self.print("get_range", self.type, self.length)
        if isinstance(self.root.get(self.type), arr.Array):
            ref = self.root.get(self.type)
            
            if self.length and ref.array == "open":
                return ref.get_arange(self.length)
            else:
                return ""

        # if element is not an array -------
            
        if self.type == "integer" or self.type == "real":
            if vector is True:
                return("(31 downto 0)");
            else:
                return ""

        l = self.bitlen(self.length)
        basic = ["logic", "signed", "unsigned"]
        if self.type in basic:
            if l == "open" or self.length is None:
                return ""
            else:
                re = f"({l}-1 downto 0)"
                return re
        
        elif l == "open":
            return f"(integer range <>)"
        elif l is not None:
            return f"({l}-1 downto 0)"

        
    def get_type(self, vector=False):
        self.print(f"Entering get_type function")
    
        if "logic" in self.type:
            aux = self.root.translate(self.bitlen())
            if aux == 0 or (self.length is None and aux == 1):
                tmp = "std_logic"
                self.print(f"get_type return: {tmp}")
                return tmp
            else:
                tmp = "std_logic_vector"
                self.print(f"get_type return: {tmp}")
                return tmp
    
        basic_types = []
        basic_types += ["integer"]
        basic_types += ["natural"]
        basic_types += ["real"]
        basic_types += ["std_logic_vector"]
        basic_types += ["std_logic"]
        basic_types += ["signed"]
        basic_types += ["unsigned"]
        
        if self.type in basic_types:
            tmp = self.type
            self.print(f"get_type return: {tmp}")
            return tmp
    
        if self.type:
            main_type = self.root.get(self.type)
            self.print(f"get_type top type: {main_type}")
            if isinstance(main_type, arr.Array):
                tmp = f"{self.type}{main_type._}at"
                self.print(f"get_type return: {tmp}")
                return tmp
            if isinstance(main_type, rec.Record):
                tmp = f"{self.type}{main_type._}rt"
                self.print(f"get_type return: {tmp}")
                return tmp
    
        if vector is False:
            tmp = f"{self.type}{self._}t"
        else:
            tmp = f"{self.type}{self._}vt"
        self.print(f"get_type return: {tmp}")
        return tmp

    def format_full_type(self, package, indentation, name):
        self.format_type(package, indentation, name)
        blank_line(package.decl)

    def format_type(self, package, indentation, name):
        decl = package.decl
        body = package.body
        i = indentation

        for c in self.comments:
            flush(decl, f'-- {name}: {c}', i)
        
        # first we create the format needed for the type itself
        fmt = ""
    
        delim = ":"
        quali = f"{''}"
        name_suffix = ""
        
        basic_types = []
        basic_types += ["integer"]
        basic_types += ["real"]
        basic_types += ["logic"]
        basic_types += ["signed"]
        basic_types += ["unsigned"]

        if self.qualifier:
            quali = f"{self.qualifier}"
        elif self.value is not None:
            quali = f"{'constant'}"
        elif self.type in basic_types and self == self.root.get(name):
            # top level user type of basic logic types
            quali = f"{'subtype'}"
            delim = "is"
            name_suffix = f"{self._}t"
        elif self.subtype == True and not isinstance(self.parent, rec.Record):
            # top level user type of basic logic types
            quali = f"{'subtype'}"
            delim = "is"
            name_suffix = f"{self._}t"
            # name_suffix = f""

        quali = f"{quali} " if quali else quali
    
        n = f"{name}{name_suffix}"
        
        t = self.get_type()

        ref_type = self.root.get(self.type)
        if(self.type in basic_types):
            r = self.get_range()
        elif isinstance(ref_type, arr.Array):
            r = self.get_range()            
        elif (isinstance(ref_type, Element)
              and ref_type.type == "logic"
              and ref_type.length == "open"):
            r = self.get_range()
        else:
            r = ""

        v = ""
        if (isinstance(self.value, int)
            or isinstance(self.value, str)
            or isinstance(self.value, float)):
            v = f" := {self.value}"
        elif isinstance(self.value, list):
            v += ' := ('
            for idx, x in enumerate(self.value):
                v += f"{idx} => {x}, "
            v = v[:-2] + ')'
            
        fmt = f"{quali}{n} {delim} {t}{r}{v};"
        
        flush(decl, f'{fmt}', i)

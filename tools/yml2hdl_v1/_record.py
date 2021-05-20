import sys

import operator
import functools

import _element as ele
import _array as arr

from _helpers import *

class Record:
    # Records represent records in VHDL. Internal types are treated as
    # elements, that is, for any internal type, an element is created
    # pointing to the target type. Internal types are stored in a
    # internal dictionary (database, db). An extra dictionary (bd )is
    # also reserved for reverse calls (when obj is used to find the
    # name)
    
    def __init__(self, parent, root, name, body):
        # Contructor.
        #
        # parent:  object that created this record.
        # root: package that is direct related to this record
        # name: name of the record
        # _: configures the use of underscores before suffixes
        # kwargs: info of the internal types
        # dprint: debug print switch, optional.
        
        self.parent = parent
        self.root = root
        self.name = name

        self.comments = body.pop('comments')
        self.dprint = body.pop('dprint')
        self._ = "_" if body.pop('_') else ""
        
        self.db = {}
        self.bd = {}
        
        for x, y in body.items():
            self.add_element(x, y)

    def __str__(self):
        # String representation of the record. Includes a label (R),
        # record name, and description of all internal types.
        return f"R {self.name} [%s]" % (
            ", ".join([f"{x}: {str(y)}" for x,y in self.db.items()]))

    def print(self, *args):
        # Print information only when the debug print switch is
        # enabled, for the scope of the record only.
        if self.dprint:
            print(f"{self} >", *args)    

    def get(self, key):
        # Provides the object related to a type in the internal data
        # base. Reverse lookup is also allowed.
        obj = self.db.get(key)
        if obj: return obj
        return self.bd.get(key)
    
    def get_elements(self):
        # return a list of all types in the internal data
        # base. Reverse database not included.
        return self.db.items()

    def add_element(self, name, e):
        # Adds type to the internal databases, including the one for
        # reverse lookup. Notice that underscore configuration is
        # separated from the main record configuration.

        if name in self.db:
            print(f"ERROR: {x} is repeated in {self.name}.")
            sys.exit(1)

        d = {};
        d["_"] = True
        d['comments'] = []
        d['dprint'] = False
        
        for item  in e:
            if None in item:
                d['comments'] += [item[None]]
            elif "comment" in item:
                d['comments'] += [item["comment"]]
            else:
                d.update(item)

        if d.get('array'):
            obj = arr.Array(self, self.root, name, **d)
        elif d.get('type'):
            obj = ele.Element(self, self.root, name, **d)
        else:
            obj = rec.Record(self, self.root, name, d)

        self.db[name] = obj
        self.bd[obj] = name
        
    def bitlen(self, null=None, resolve=False):
        # Calculates the length of the record in bits, which comes
        # from the um of the lengths of each type. Stops the program
        # if internal lengths cannot be reduced to integer values.
        #
        # null parameter is just added for call compatibility with
        # other elements. this is just ignored by the record since it
        # does not make sense for all internal types at once.

        l = []
        for n, e in self.db.items():
            x = self.root.translate(e.bitlen(resolve=True))
            l += [x]

        if any(x is None for x in l):
            print(f"ERROR: record '{self.name}' is not fully defined: {l}.")
            sys.exit(1)
        
        if any(not isinstance(x, int) for x in l):
            print(f"  Warning: record '{self.name}'"
                  + f" did not reduce to integers: {l}")
            return "open"

        self.print(f"bitlen {l}")
        return sum(l)

    def get_value(self):
        return self.bitlen()
    
    def format_full_type(self, package, indentation, name):
        # Provides format needed for a record, including constants and
        # conversion functions and extra lines for organization.
        
        decl = package.decl
        body = package.body
        i = indentation

        for c in self.comments:
            flush(decl, f"-- {c}", i)
        
        s = f"type {name}{self._}rt is record"
        flush(decl, s, i)
        for n, e in self.get_elements():
            e.format_type(package, i+2, n)
         
        s = f"end record {name}{self._}rt;"
        flush(decl, s, i)
    
        # vector type compatible to the record one
        len_const_value = self.bitlen()
        self.print(f"Length: {len_const_value}")
        if not isinstance(len_const_value, int):
            print(f"  Warning: convert functions and constants were not"
                  + f" generated for record '{name}'.")
            return
        len_const_name = f"{name.upper()}{self._}LEN"
        self.root.add_len_db(len_const_name, len_const_value)
        
        # Record vector should be constrained to be used in functions,
        # otherwise VHDL will require it to explicit defined later,
        # where it is complex to access it.
        s = f"constant {len_const_name} : integer := {len_const_value};"
        flush(decl, s, i)
        s = " ".join((f"subtype {name}{self._}rvt is",
                      f"std_logic_vector({len_const_name}-1 downto 0);"))
        flush(decl, s, i)
        
        self.root.add_extra(f"{name}{self._}rvt", ele.Element(self.parent,
                                                              self.root,
                                                              f"{name}{self._}rvt",
                                                              'logic',
                                                              False,
                                                              len_const_name))
        
        self.format_vectorify(package, i, name)
        self.format_structify(package, i, name)
        self.format_nullify(package, i, name)
         
        
        blank_line(package.decl)
        blank_line(package.body)

    def format_vectorify(self, package, indentation, name):
        # Provdides the procedure to convert a record to a vector

        decl = package.decl
        body = package.body
        ind = indentation
        
        s = f"function vectorify(x: {name}{self._}rt) return {name}{self._}rvt"
        flush(decl, f"{s};", ind)
        flush(body, f"{s} is", ind)
        s = f"  variable y : {name}{self._}rvt;"
        flush(body, s, ind)
        flush(body, "begin", ind)
        l = self.bitlen()-1
        for n, e in self.get_elements():
            if isinstance(e, ele.Element):
                m = self.root.translate(e.bitlen(e.length))
            else:
                m = self.root.translate(e.bitlen())
            r = f"({l} downto {l-m+1})"
            # if m > 1:
            #     r = f"({l} downto {l-m+1})"
            # else:
            #     r = f"({l})"
            s = f"y{r}"
            # tpl = "%s" if "logic" in e.get_type() else "vectorify(%s)"
            tpl = "vectorify(%s)"
            rside = tpl %(f"x.{n}")
            s = f"{s.ljust(30-ind-2)} := {rside};"
            flush (body, s, ind+2)
            l = l - m        
        s = f"return y;"
        flush(body, s, ind+2)
        flush(body, "end function vectorify;", ind)
            
    def format_structify(self, package, indentation, name):
        # Provides the procedure to convert a vector to a record
    
        decl = package.decl
        body = package.body
        ind = indentation
        
        s = f"function structify(x: {name}{self._}rvt) return {name}{self._}rt"
        flush(decl, f"{s};", ind)
        flush(body, f"{s} is", ind)
        s = f"variable y : {name}{self._}rt;"
        flush(body, s, ind + 2)
        flush(body, "begin", ind)
        l = self.bitlen()-1
        for n, e in self.get_elements():
            if isinstance(e, ele.Element):
                m = self.root.translate(e.bitlen(e.length))
            else:
                m = self.root.translate(e.bitlen())
            r = f"({l} downto {l - m + 1})"
            # if m > 1:
            #     r = f"({l} downto {l - m + 1})"
            # else:
            #     r = f"({l})"
            s = f"y.{n}"
            # tpl = "%s" if 'logic' in e.get_type() else "structify(%s)"
            tpl = "structify(%s)"
            rside = tpl %(f"x{r}")
            s = f"{s.ljust(30-ind-2)} := {rside};"
            flush (body, s, ind + 2)
            l = l - m        
        s = f"return y;"
        flush(body, s, ind + 2)
        flush(body, "end function structify;", ind)
    
    def format_nullify(self, package, indentation, name):
        # Provides the procedure to set all internal parameters to
        # zero, mainly used during resets.
        
        decl = package.decl
        body = package.body
        i = indentation
        
        # function to convert a vector to a record
        s = f"function nullify(x: {name}{self._}rt) return {name}{self._}rt"
        flush(decl, f"{s};", i)
        flush(body, f"{s} is", i)
        s = f"variable y : {name}{self._}rt;"
        flush(body, s, i+2)
        flush(body, "begin", i)
        for n, e in self.get_elements():
            s = f"y.{n}"
            s = f"{s.ljust(30-i-2)} := nullify(x.{n});"
            flush (body, s, i + 2)
        s = f"return y;"
        flush(body, s, i+2)
        flush(body, "end function nullify;", i)

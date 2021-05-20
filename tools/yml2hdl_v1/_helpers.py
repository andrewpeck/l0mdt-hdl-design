def blank_line(dest):
    dest += [""]

def indent(s, indentation):
    return s.rjust(len(s)+indentation)

def align(s, column):
    return s.ljust(len(s)+column)

def flush(dest, s, indentation=0):
    dest += [f"{indent(s, indentation)}"]


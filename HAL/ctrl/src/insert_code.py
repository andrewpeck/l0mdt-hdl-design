#!/usr/bin/env python3
from __future__ import unicode_literals
import io
import shutil
import tempfile


def insert_code(input_file_name,
                output_file_name,
                marker_start,
                marker_end,
                write_function,
                write_function_args=None):
    """"""

    file = io.open(input_file_name, "r", newline='', encoding='utf-8')
    lines = file.readlines()
    file.close()

    tempname = tempfile.mktemp()
    shutil.copy(input_file_name, tempname)

    start_found = False
    end_found = False

    # check for the presence of delimiters

    for line in lines:
        print(line)
        if marker_start in line:
            start_found = True
        if marker_end in line:
            end_found = True

    ok_to_write = start_found and end_found

    if not ok_to_write:
        raise ValueError(
            ("\n\tStart and end section markers not found in %s" %
             input_file_name) +
            "\n\tplease insert the following lines into the file" +
            ("\n\t%s" % marker_start) + ("\n\t%s" % marker_end))

    start_found = False
    end_found = False

    wrote_constraints = False

    file = io.open(tempname, "w", newline='')

    for line in lines:

        if not start_found:
            file.write(line)

        if (end_found or (marker_end in line)):
            file.write(line)

        if marker_start in line:
            start_found = True

        if marker_end in line:
            end_found = True

        if (start_found and not end_found and not wrote_constraints):
            wrote_constraints = True

            if write_function_args is not None:
                write_function(file, write_function_args)
            else:
                write_function(file)

    file.close()
    shutil.copy(tempname, output_file_name)
    file.close()

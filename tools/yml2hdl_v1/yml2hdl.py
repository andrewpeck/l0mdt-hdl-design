import argparse
import os
import yaml
import pathlib
import sys

import _package as hpkg

blank_line = [""]
struct_names = ["type", "constant", "hdl"]

def main(args):

    ext_db = []
    if args.ext:
        # create db for each external file
        for e in args.ext:
            tmp = None
            try:
                with open(e, 'r') as f:
                    tmp  = yaml.safe_load(f)
            except:
                print(f"WARNING: external file {e} not used.")
            if tmp:
                for m in list(tmp.keys()):
                    if 'config' in m:
                        tmp['config'] = tmp.pop(m)
                    elif any(x in m.lower() for x in struct_names):
                        tmp['hdl'] = tmp.pop(m)
                ext_db += [tmp]

    if_path = args.src
    with open(if_path, 'r') as f:
        main_db = yaml.safe_load(f)

    for m in list(main_db.keys()):
        if 'config' in m:
            main_db['config'] = main_db.pop(m)
        elif any(x in m.lower() for x in struct_names):
            main_db['hdl'] = main_db.pop(m)

    if args.custom:
        # import customizations
        for c in args.custom:
            tmp = None
            try:
                with open(c, 'r') as f:
                    tmp = yaml.safe_load(f)
            except:
                print(f"WARNING: customization file {c} not used.")

            if tmp:
                for s in list(tmp.keys()):
                    if any(x in s.lower() for x in struct_names):
                        ckeys = [x.keys() for x in tmp[s]]
                        for cidx, k in enumerate(ckeys):
                            for db in [main_db]+ext_db:
                                for idx, x in enumerate(db['hdl']):
                                    if x.keys() == k:
                                        db['hdl'][idx] = tmp[s][cidx]

    package = hpkg.Package(main_db, ext_db)
    
    if args.output_dir:
        output_dir = args.output_dir
    else:
        output_dir = pathlib.Path(if_path).parent
        
    package_name = f"{os.path.splitext(os.path.basename(if_path))[0]}_pkg"
    
    package.write(output_dir, package_name)


if __name__ == "__main__":

    h_ext = "External YAML file paths. Repeat '-e' if needed."
    h_custom = "External YAML file path for customization. Repeat '-c' as needed."
    h_out = "Path to be used for the generated file."

    parser = argparse.ArgumentParser("yml2hdl")
    parser.add_argument('-e',
                        '--external',
                        dest='ext',
                        action='append',
                        help=h_ext)
    parser.add_argument('-c',
                        '--custom',
                        dest='custom',
                        action='append',
                        help=h_custom)
    parser.add_argument('-o',
                        '--output',
                        dest='output_dir',
                        default="",
                        help=h_out)
    parser.add_argument('src', help="Sorce YAML file path")
    args = parser.parse_args()

    main(args)

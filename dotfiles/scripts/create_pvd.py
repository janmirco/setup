#!/bin/python3

"""Script for dynamically creating .pvd file for ParaView"""

import os
import sys


def main(args):
    """Main function"""

    if len(args) == 1:
        raise SystemExit("[ERROR]: Give path as argument")

    path = args[1]

    files = []
    counter = 0
    for f in os.listdir(path):
        if ".vtu" in f:
            counter += 1
            files.append(f)
    files = sorted(files)

    lines = []
    lines.append('<?xml version="1.0"?>\n')
    lines.append('<VTKFile type="Collection" version="0.1">\n')
    lines.append("    <Collection>\n")
    for i, f in enumerate(files):
        lines.append(f'        <DataSet timestep="{i}" file="{path}/{f}"/>\n')
    lines.append("    </Collection>\n")
    lines.append("</VTKFile>\n")

    with open(f"{path}/run.pvd", mode="w", encoding="utf8") as pvd_file:
        pvd_file.write("".join(lines))


if __name__ == "__main__":
    main(sys.argv)

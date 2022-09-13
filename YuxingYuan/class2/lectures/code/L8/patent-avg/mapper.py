#!/usr/bin/env python3

import sys

for line in sys.stdin:
    fields = line.split(",")
    if (fields[9] and fields[9].isdigit()):
        print(fields[5][1:-1] + "\t" + fields[9])

#!/usr/bin/env python

"""
A filter that split lines into one word per line.
"""

import fileinput


def process(line):
    """For each line of input, split it into words."""
    x=line.split()
    for i in x :
        print(i)


for line in fileinput.input():
    process(line)

#!/usr/bin/env python

"""
A filter that transforms text into lower case.
"""

import fileinput


def process(line):
    """For each line of input, transfer text into lower case."""
    print(line[:-1].lower())


for line in fileinput.input():
    process(line)

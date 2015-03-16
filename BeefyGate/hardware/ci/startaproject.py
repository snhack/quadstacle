#!/usr/bin/env python

# Utility script to start a new project, using the current project as a template

import sys
import os
import string


def startaproject(n):

    # TODO: build directory structure, copy key files, use template for root scad file
    


if __name__ == '__main__':
    if len(sys.argv) == 2:
        startaproject(sys.argv[1])
    else:
        print("Usage: ./startaproject.py <name>")
        print("NB: <name> is used for the top-level directory and for the root scad file")

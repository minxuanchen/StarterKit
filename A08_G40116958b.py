# -*- coding: utf-8 -*-
"""
Created on Fri Oct 27 00:36:04 2017

@author: Administrator
"""

import moduleB as mb
import collections

mytext=mb.get_text("script01.txt","script02.txt")

mylist=mb.process_data(mytext)

mydict=collections.Counter(mylist)

mb.print_output(mydict)
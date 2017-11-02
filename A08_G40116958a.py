# -*- coding: utf-8 -*-
"""
Created on Thu Oct 26 19:02:34 2017

@author: Administrator
"""

import moduleA as ma

import collections

mytext=ma.get_text("script01.txt","script02.txt")

mylist=ma.process_data(mytext)

mydict=collections.Counter(mylist)

ma.print_output(mydict)
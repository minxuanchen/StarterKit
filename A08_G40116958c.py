# -*- coding: utf-8 -*-
"""
Created on Fri Oct 27 01:40:11 2017

@author: Administrator
"""

import moduleC as mc
import collections

mytext=mc.get_text("script01.txt","script02.txt")

mylist=mc.process_data(mytext[0])
mylist2=mc.process_data(mytext[1])

mydict=collections.Counter(mylist)
mydict2=collections.Counter(mylist2)

mc.print_output(mydict,mydict2)


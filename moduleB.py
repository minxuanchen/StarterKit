# -*- coding: utf-8 -*-
"""
Created on Fri Oct 27 00:37:15 2017

@author: Administrator
"""


def get_text(file1, *otherfiles):
    myText = ""
    with open(file1) as f:
        myText = f.read()
    for everyfile in otherfiles:
        with open(everyfile) as f:
            myText = myText + f.read()
    return myText
    
def process_data(text):
    punctuation="!\"#$%&'()*+,-./:;<=>?@[\]^_`{|}~"
    text=text.lower()
    text=text.replace("\n"," ")
    for p in punctuation:
        text=text.replace(p," ")
    text=text.split(" ")
    return text
    
def print_output(dictionary):
    for key in sorted(dictionary.keys()):
        if key.isalpha():
            print ("{:<18s}{:3d}".format(key,dictionary[key]))
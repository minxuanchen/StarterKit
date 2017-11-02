# -*- coding: utf-8 -*-
"""
Created on Thu Oct 26 16:12:03 2017

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
    myLetter = []
    text=text.lower()
    for letter in text:
        if letter.isalpha():
            myLetter.append(letter)
    return myLetter
    
def print_output(dictionary):
    for key in sorted(dictionary.keys()):
        print ("{:<1s} {:4d}".format(key,dictionary[key]))
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 27 01:40:13 2017

@author: Administrator
"""


def get_text(file1, *otherfiles):
    myText = ""
    myText2 = ""
    with open(file1) as f:
        myText = f.read()
    for everyfile in otherfiles:
        with open(everyfile) as f:
            myText2 = myText2 + f.read()
    return [myText,myText2]
    
def process_data(text):
    
    punctuation="!\"#$%&'()*+,-./:;<=>?@[\]^_`{|}~"
    
    with open("stopwords.csv") as f:
        stopwords = f.read().replace("\n"," ").strip().split(" ")

    text=text.lower()
    text=text.replace("\n"," ")
    for p in punctuation:
        text=text.replace(p," ")
    text=text.split(" ")
    
    n=0
    for words in text:
        if (words in stopwords):
            text[n] = ""
        n=n+1
        
    return text
    
def print_output(dictionary,dictionary2):
    print ("WORD    Count 1   Count 2")
    print ("---------------------------")
    i=0
    
    x=sorted(dictionary.items(), key=lambda x:x[1],reverse=True)
    
    for key in x:
        if i==10:
            break
        if key[0].isalpha():
            i=i+1
            print ("{:<10s}{:5d}{:10d}".format(key[0],dictionary[key[0]],dictionary2.get(key[0],0)))
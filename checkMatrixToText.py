#!/usr/bin/python

#arguments are : input file, output file, number of columns

import sys
import re

fIn=open(sys.argv[1],'r')
fOut=open(sys.argv[2],'w')

fIn.readline()
fIn.readline()
fIn.readline()
for line in fIn:
	splitted=str.split(line)
	lineOut=""
	for i in splitted:
		lineOut=lineOut+i+","
	lineOut=lineOut[:-1]
	lineOut=lineOut+"\n"
	if len(lineOut)>3:
		fOut.write(lineOut)

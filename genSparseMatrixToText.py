#!/usr/bin/python

#arguments are : input file, output file, number of columns


import sys
import re

fIn=open(sys.argv[1],'r')
nameOut=str.split(sys.argv[2],".")
fOutL=open(nameOut[0]+"L."+nameOut[1],'w')
fOutU=open(nameOut[0]+"U."+nameOut[1],'w')


foundL=False
foundU=False
for line in fIn:
	if line=="L:\n":
		foundL=True
		print "found L"
		continue
	if line=="U:\n":
		foundU=True
		print "found U"
		continue
		
	if foundL and not foundU and not line=="\n":
		splitted=str.split(line)
		lineOut=""
		for i in splitted:
			lineOut=lineOut+i+","
		lineOut=lineOut[:-1]
		lineOut=lineOut+"\n"
		if len(lineOut)>3:
			fOutL.write(lineOut)

	if foundL and foundU and not line=="\n":
		splitted=str.split(line)
		lineOut=""
		for i in splitted:
			lineOut=lineOut+i+","
		lineOut=lineOut[:-1]
		lineOut=lineOut+"\n"
		if len(lineOut)>3:
			fOutU.write(lineOut)

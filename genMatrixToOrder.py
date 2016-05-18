#!/usr/bin/python

import sys

fIn=open(sys.argv[1],'r')

for i in range(5):
	line=fIn.readline()

strCol=""
while True:
	line=fIn.readline()
	splitted=str.split(line)
	if len(splitted)>0:
		for i in splitted:
			strCol=strCol+i+","
	else:
		break

strCol=strCol[:-1]
strCol=strCol+"\n"

fOut=open(sys.argv[2],'w')
fOut.write(strCol)

line=fIn.readline()
if line[0:3]=="Row":
	line=fIn.readline()
	strLine=""
	while True:
		line=fIn.readline()
		splitted=str.split(line)
		if len(splitted)>0:
			for i in splitted:
				strLine=strLine+i+","
		else:
			break
	strLine=strLine[:-1]
	strLine=strLine+"\n"
	fOut.write(strLine)

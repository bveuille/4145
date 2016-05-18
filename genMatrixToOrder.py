#!/usr/bin/python

import sys

fIn=open(sys.argv[1],'r')

for i in range(6):
	line=fIn.readLine()
splited=str.split(line)
strCol=""
for i in splitted:
	strCol=strCol+i+","
strCol=strCol[:-1]
strCol=strCol+"\n"

line=fIn.readLine()
line=fIn.readLine()
if line[0:2]="Row":
	line=fIn.readLine()
	line=fIn.readLine()
	splited=str.split(line)
	strLine=""
	for i in splitted:
		strLine=strLine+i+","
	strLine=strLine[:-1]
	strLine=strLine+"\n"
	nameOut=str.split(sys.argv[2],".")
	fOutLine=open(nameOut[0]+"Line."+nameOut[1])
	fOutCol=open(nameOut[0]+"Col."+nameOut[1])
	fOutLine.write(strLine)
	foutCol.write(strCol)
else:
	fOutCol=open(nameOut[0]+"Col."+nameOut[1])
	foutCol.write(strCol)

import sys
import re

fIn=open(sys.argv[1],'r')
fOut=open(sys.argv[2],'w')

fIn.readline()
fIn.readline()
fIn.readline()
for line in fIn:
	print line
	splitted=str.split(line)
	splitted=splitted[1:]
	print splitted
	lineOut=""
	for i in range(0,int(sys.argv[3])):
		if str(i) in splitted:
			lineOut=lineOut+"1,"
		else:
			lineOut=lineOut+"0,"
	lineOut=lineOut[:-1]
	lineOut=lineOut+"\n"
	print lineOut
	fOut.write(lineOut)

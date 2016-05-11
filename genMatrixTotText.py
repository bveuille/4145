import sys
import re

fIn=open(sys.argv[1],'r')
fOutL=open(sys.argv[2]+"L",'w')
fOutU=open(sys.argv[2]+"U",'w')


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
		
	print line
	if foundL and not foundU and not line=="\n":
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
		fOutL.write(lineOut)

	if foundL and foundU and not line=="\n":
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
		fOutU.write(lineOut)

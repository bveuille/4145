#!/usr/bin/python

import sys
import copy

fIn=open(sys.argv[1],'r')
fOut=open(sys.argv[1]+"Inv",'w')

line=fIn.readline()
mIn=str.split(line,',')
mIn=[int(char) for char in mIn]
mOut=copy.deepcopy(mIn)
for i in range(len(mIn)):
	for j in range (len(mIn)):
		if mIn[j]==i:
			mOut[i]=j
			break
lOut=""
for i in mOut:
	lOut=lOut+str(i)+","
lOut=lOut[:-1]+"\n"
fOut.write(lOut)

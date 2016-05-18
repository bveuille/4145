#!/usr/bin/python

import sys
import copy

fIn=open(sys.argv[1],'r')
fOrder=open(sys.argv[2],'r')
fOut1=open(sys.argv[3]+'1','w')
fOut2=open(sys.argv[3]+'2','w')


#import the matrix mIn to be reordered
mIn=[]
for line in fIn:
	l=[line[i:i+1] for i in range(0,len(line))]
	l=l[0:-1]
        mIn.append(l)

#import the order of the columns orderCol
orderCol=str.split(fOrder.readline()[:-1],',')
for i in range(len(orderCol)):
	orderCol[i]=int(orderCol[i])

mOut1=copy.deepcopy(mIn)
mOut2=copy.deepcopy(mIn)
for line in range(len(mIn)):
	for col in range(len(mIn[line])):
		mOut1[line][col]=mIn[line][orderCol[col]]
		mOut2[line][orderCol[col]]=mIn[line][col]

for line in mOut1:
	lOut=""
	for char in line:
		lOut=lOut+char+","
	lOut=lOut[:-1]
	lOut=lOut+"\n"
	fOut1.write(lOut)

for line in mOut2:
	lOut=""
	for char in line:
		lOut=lOut+char+","
	lOut=lOut[:-1]
	lOut=lOut+"\n"
	fOut2.write(lOut)

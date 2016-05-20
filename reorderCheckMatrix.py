#!/usr/bin/python

import sys
import copy

#open the files
fIn=open(sys.argv[1],'r')
fOrder=open(sys.argv[2],'r')
fOut=open(sys.argv[3],'w')

#import the matrix mIn to be reordered
mIn=[]
for line in fIn:
	mIn.append(str.split(line[:-1],','))

#import the order of the columns orderCol
orderCol=str.split(fOrder.readline()[:-1],',')
for i in range(len(orderCol)):
	orderCol[i]=int(orderCol[i])

#import the order of the lines orderLine
orderLine=str.split(fOrder.readline()[:-1],',')

if len(orderLine)>3:
	for i in range(len(orderLine)):
		orderLine[i]=int(orderLine[i])
	swapLine=True
else:
	swapLine=False

#swap the columns of mIn accordind to orderCol
#swap the lines of mIn according to orderLine if it is non empty
mOut = copy.deepcopy(mIn)
for line in range(len(mIn)):
	mInLine="  "
	mOutLine="  "
	for i in range(len(mIn[line])):
		mInLine=mInLine+str(i)+":"+mIn[line][i]+"  "
		mOutLine=mOutLine+str(i)+":"+mIn[line][orderCol[i]]+"  "
	for col in range(len(mIn[line])):
		if swapLine:
			mOut[line][col]=mIn[orderLine[line]][orderCol[col]]
		else:
			mOut[line][col]=mIn[line][orderCol[col]]
	mInLine="  "
	mOutLine="  "
	for i in range(len(mIn[line])):
		mInLine=mInLine+str(i)+":"+mIn[line][i]+"  "
		mOutLine=mOutLine+str(i)+":"+mIn[line][orderCol[i]]+"  "


#write the reordered matrix mOut in fOut
for line in mOut:
	lOut=""
	for char in line:
		lOut=lOut+char+","
	lOut=lOut[:-1]
	lOut=lOut+"\n"

	fOut.write(lOut)

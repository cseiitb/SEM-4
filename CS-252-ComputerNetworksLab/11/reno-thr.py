#!/usr/bin/python

filerow = []
rowline = []
crimefile = open("reno-r.txt", 'r')
for line in crimefile.readlines():
	line = line.strip()
	rowline = line.split(" ")	
	filerow.append(rowline)
filerwo_len = len(filerow)

filerow2 = []
rowline2 = []

for i in range(len(filerow)):
	rowline2 = []
	if( i > 9):
		rowline2.append(filerow[i][1])
		duration = (80000/(float(filerow[i][1]) -float(filerow[i - 10][1])))
		rowline2.append(duration)
		filerow2.append(rowline2)

output = open("reno-thr.txt", 'w')

string =""
for item in filerow2:
	string = str(item[0]) +" " + str(item[1]) 	
	output.write("%s\n" % string)

print (filerow)

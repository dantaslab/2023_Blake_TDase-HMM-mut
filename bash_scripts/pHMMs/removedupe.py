import sys,glob
import os
import pathlib

filename=sys.argv[1]
file=open(filename, "r")
print('successfully opened ' + filename)
nameList=[]
for line in file:
        tag=line.rstrip('\n')
        nameList.append(tag)
seen= set()
uniqName=[]
print('finished step 1')

for x in nameList:
    if x not in seen:
        uniqName.append(x)
        seen.add(x)
print('finished step 2')

#finalName='nodupe_' + filename
finalname = f"nodupe_{os.path.basename(filename)}"
full_finalname = f"{os.path.dirname(filename)}/" + finalname
newFile=open(full_finalname,"w")
for x in uniqName:
    newFile.write('\n' + x)
a = len(nameList)
b = len(uniqName)
print('successfully created unique list of tags in ' + finalname)
print(str(a-b) + ' duplicate(s) were removed.')

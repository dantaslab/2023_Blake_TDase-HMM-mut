import sys,glob
import os
import pathlib

hmm_name = sys.argv[1]
hmm = open(hmm_name, 'r')
finalname = f"pre-parsed_{os.path.basename(hmm_name)}"
full_finalname = f"{os.path.dirname(hmm_name)}/" + finalname
#finalname = "pre-parsed_" + hmm_name
final = open(full_finalname, 'w')
x=0
for line in hmm:
        x+=1
        if x>3003: # Top X HMM hit sequences + 3 for the header
                break
        else:
                final.write(line)
final.close()
 #change HMM output
File = open(full_finalname,'r')
output_name = f"parsed_{os.path.basename(hmm_name)}"
full_output_name = f"{os.path.dirname(hmm_name)}/" + output_name
#output_name= "parsed_" + hmm_name
newFasta= open(full_output_name,'w')


print(finalname + " is opened")

for line in File:
        if not line.startswith(" "):
            tag=line[0:16]+'\n' #change number of char for tag
            newFasta.write(tag)
print("finished creating " + output_name)

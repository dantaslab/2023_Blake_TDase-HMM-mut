import sys

fasta = open(sys.argv[1] ,'r')
output = open(sys.argv[2],'w')
titles = open(sys.argv[3],'r')



x=0
fasta_dict = {}
currentline = ""
key = ""
hitlist = []
full_hitlist = []


for line in titles:
    strippedtitle = line.rstrip('\n')
    hitlist.append(strippedtitle)

print("length of titles list" + str(len(hitlist)))

keys = []

for line in fasta:
    if line[0]==">":
        if currentline != "":
            fasta_dict[key] = currentline
        stripped = line.rstrip('\n')
        key = stripped
        keys.append(stripped)
        currentline = ""
    else:
        strippedline = line.rstrip('\n')
        currentline += line

fasta_dict[key] =currentline

for key in fasta_dict:
    for hit in hitlist:
        if hit in key:
            full_hitlist.append(key)

    
print('matching length = ' + str(len(full_hitlist)))

parsed_dict = {key: value for key, value in fasta_dict.items() if key in full_hitlist}

print("Parsed dictionary length" + str(len(parsed_dict)))

for keys,values in parsed_dict.items():
    output.write(keys + '\n')
    output.write(values)

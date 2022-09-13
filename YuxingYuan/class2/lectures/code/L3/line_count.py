import sys
count = 0
data = []
for line in sys.stdin:
    count += 1
    data.append(line)

print("Total ",count, "lines read.") # print goes to sys.stdout
#print(data)

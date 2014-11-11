import os, sys

#------- HELPERS --------------------------------------------------------------
def strDistance(s0, s1):
    d = 0
    for i in xrange(len(s0)):
        d += 0 if s0[i] == s1[i] else 1
    return d

def modelCount(s0):
    return s0.count("1")
    
def convertName(n0):
    l = []
    for i in xrange(len(n0)):
        if n0[i] == "1":
            l.append(str(i+1))
    return ",".join(l)
#------------------------------------------------------------------------------
    
INPUT_FILE_NAME = "ens_mae_s1.csv"
VALUE_COLUMN_INDEX = 2
    
#------------------------------------------------------------------------------
points = []
fpoints = open("points.txt", "wt")
for line in open(INPUT_FILE_NAME, "rt"):
    vals = filter(lambda x: not x == "", map(lambda y: y.strip(), line.split(" ")))
    descriptor = vals[0]
    value = float(vals[VALUE_COLUMN_INDEX])
    print >> fpoints, modelCount(descriptor), value, "\"%s\""%(convertName(descriptor))
    points.append( (descriptor, modelCount(descriptor), value, convertName(descriptor)) )
fpoints.close()
#------------------------------------------------------------------------------
template = "%f %f\n%f %f\n\n"
edges = open("edges.txt", "wt")
tag = 1
for point in points:
    for point1 in points:
        if strDistance(point[0], point1[0]) == 1 and point[0] < point1[0]:
            print >> edges, template%(point[1], point[2], point1[1], point1[2])
            tag += 1
edges.close()
#------------------------------------------------------------------------------
#set object 70 rect from 0.95, 8.5, 0 to 1.05, 12.4, 0
#set object 70 back lw 1.0 fc lt 1 fillstyle transparent solid 0.2 noborder
template = "set object %d rect from %f, %f, 0 to %f, %f, 0\nset object %d back lw 1.0 fc lt 1 fillstyle transparent solid 0.2 noborder"

beauty = open("beauty.txt", "wt")
maxs = [0]*5
mins = [1000]*5
for point in points:
    i = point[1] - 1
    v = point[2]
    maxs[i] = v if v > maxs[i] else maxs[i]
    mins[i] = v if v < mins[i] else mins[i]

for i in xrange(5):
    tag = i+1
    print >> beauty, template%(tag, 1+i-0.05, mins[i], 1+i+0.05, maxs[i], tag)
    
beauty.close()
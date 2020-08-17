import sys

pred1 = 0
total = 0
for line in open(sys.argv[1]):
    if not line:
        break
    c0, c1 = line.strip().split('\t')
    c1 = float(c1)
    if c1 >= 0.5:
        pred1 += 1
    total += 1

print("%.4f%%" % (pred1/total*100))
print("Inv. %.4f%%" % (100-pred1/total*100))


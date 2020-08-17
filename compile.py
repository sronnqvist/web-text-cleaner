import sys

for input, pred in zip(open(sys.argv[1]), open(sys.argv[2])):
    if not input:
        break
    input = input.strip()
    #print(pred.strip().split('\t'))
    c0, c1 = pred.strip().split('\t')
    if input.startswith('#'):
        print(input)
    else:
        c0 = float(c0)
        c1 = float(c1)
        if c1 >= c0:
            cl = 1
        else:
            cl = 0
        print("#%s#%.5f#%s" % (cl, c1, input))

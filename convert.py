
def main():
    filename = raw_input("Filename: ")

    f = open(filename, "r")
    i = 0
    for line in f:
        l = list(line.split(","))
        i+=1
        if (i > 50):
            break
        # if (len(l) == 2):
        #     print("({0}, '{1}'),".format(l[0], l[1].rstrip()))
        
        # elif (len(l) == 3):
        #     print("('{0}', '{1}', {2}),".format(l[0], l[1], l[2].rstrip()))

        # elif (len(l) == 4):
        print("({0}, '{1}', {2}, {3}),".format(l[0], l[1], l[2], l[3]))
        
        # elif (len(l) == 5):
        #     print("({0}, '{1}', {2}, '{3}', '{4}'),".format(l[0], l[1], l[2], l[3], l[4].rstrip()))
            

if __name__ == '__main__':
    main()

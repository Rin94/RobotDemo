#open a txt file using python


def readFile(filePath):
    #put the path file
    file = open(filePath)
    #read n of characters
    print(file.read(5))
    #close the file
    file.close()
#only use one of then in a function
def readLines(filePath):
    file = open(filePath)
    #one single line at a time readLine()
    print(file.readline())
    print(file.readline())

    file.close()

#print line by line
def readLinesForLoop(filePath):
    file = open(filePath)
    #print(type(file.readline()))
    line = file.readline()
    while line!="":
        print(line)
        line = file.readline()
    file.close()

def readLinesMethod(filePath):
    file = open(filePath)
    #readLines read all the txt but it stores in a list
    listOfLines = file.readlines()
    [print (x) for x in listOfLines]
    file.close()



#readFile("test.txt")
#readLines("test.txt")
#readLinesForLoop("test.txt")

readLinesMethod("test.txt")

#readLines return a list with the elements


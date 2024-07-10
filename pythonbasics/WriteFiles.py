#write files in python

def readAFileAndReverse(filePath):

    #open and close the file
    with open(filePath, 'r') as reader:
        content= reader.readlines()
        rvrList =reversed(content)

    return rvrList


def writeAFile(filePath, content):

    with open(filePath,'w') as writer:
        [writer.write(x) for x in content]


reverseList=readAFileAndReverse("test.txt")
writeAFile("test.txt",reverseList)


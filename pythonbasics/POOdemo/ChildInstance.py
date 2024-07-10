from pythonbasics.POOdemo.OopsDemo import Calculator

class ChildImplementation (Calculator):

    num2= 200

    def __init__(self):
      print("child heritance")
      Calculator.__init__(self,2,10)

    def getCompleteData(self):
        return self.num + self.num2 + self.summation()


#obj= ChildImplementation(5,4)
#print(obj.getCompleteData())

obj= ChildImplementation()
print(obj.getCompleteData())



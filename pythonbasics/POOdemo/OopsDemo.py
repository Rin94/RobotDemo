#classer are user defined blueprint

#self keyword is mandatory for calling variables in a method
#instance and class variables has diferents porpuses
#constructor should be __init__
# new keyword is not required when you created an object

class Calculator:

    num= 100

    def __init__(self, a, b):
        self.a= a
        self.b= b
        print("i'm call with the objects is created")

    def getData(self):
        print(self.num)

    def summation(self):

        #return self.a + self.b + Calculator.num
        return self.a + self.b + self.num




#cal = Calculator(5,6)

#cal.getData()
#print(cal.summation())
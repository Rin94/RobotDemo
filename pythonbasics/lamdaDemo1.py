"""Lambda is a way for creating an object that represent a function

anonymous function

lamda param1, param2, param3, .... N : expression


"""

f = lambda num1, num2: num1 + num2


def sum(num1, num2):
    result = num1 + num2
    return result


print(type(f), 'lambda')
print(type(sum), 'sum')

print(f(1, 2))
print(sum(2, 3))

d = lambda val1, val2: True if val1>val2 else False

print(d(2, 3))
print(d(8,1))




filtrado = [x for x in range(1,11) if x%2 !=0]
print(filtrado)

filtradoMejorado = filter(lambda x:x%2==0, range(1, 100))
l = list(filtradoMejorado)
print(l)
print(type(l))


""" lambda with default values"""
f = lambda a, b=10 : a * b

print(f(2))

"""lambda expression ca have a parameter that will be assigned with a ref for a tuple that 
holds values that were passed over"""

#el antedisco le denota que son varios valores los que se van a mandar como tupla
f = lambda *numbers : len(numbers)

print (f(2,5,44,10,3))


#el doble antedisco denota que se va a mandar un diccionario

f = lambda **data: data['width'] * data['height']

print (f(width=4, height=5))


""" High order functions """

def convert ( items: list, f: callable):
    result: list = list()
    for item in items:
        result.append(f(item))

    return result

def fun(num):
    return  10*num

numbers1= [1, 4, 9]

#numbers2 = convert(numbers1, fun)

numbers2 =convert(numbers1, lambda x: x*10)

print(numbers2)
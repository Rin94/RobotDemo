""" Returns the great numbers in a list """

numbers = (123, 65,903, 1003, 800)

number = max (numbers)

students = [
    ("mosh", 12345, 89),
    ("Jared", 45678, 92),
    ("John", 10293, 100)

]

#def f (std):
    #return std[2]


print(max(students,key= lambda x: x[2]))
print(min(students,key= lambda x: x[2]))

#products min in a tuple lsit
products = [
    ('carpeta', 990),
    ('tabola', 200),
    ('chairex', 880)
]

f = lambda products: min (products, key= lambda product: product[1])

print("new exercise")
print (f(products))

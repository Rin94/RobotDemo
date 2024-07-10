
my_list = [12, 65, 54, 39, 102, 339, 221, 50, 70, ]

result = list(filter(lambda x: (x % 2 == 0), my_list))
# result = list(filter(lambda x: (x % 13 == 0), my_list))
print(result)
print(type(result))

"""Filter regresa un objeto de tipo filtro y lo que hace es hacer una coleccion 
de elementos que cumplen un criterio
Se pasan dos argumentos la función de filtro y un objeto iterable
"""

numbers = (12, 65, 54, 39, 102, 339, 221, 50, 70)

def f(num):

    return num % 2 == 0

def printNumbers(listofnumbers):
    print(type(listofnumbers))
    for num in listofnumbers:
        print(num)

numbers2 = filter(lambda x:x%2==0, numbers)
printNumbers(numbers2)








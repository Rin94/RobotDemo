greeting = "Good Morning"

greeting2 = 'Good Morning'

print("case 1")
if greeting == 'Morning':
    print(True)

else:
    print(False)

print("case 2")
if greeting.__contains__('Morning'):
    print(True)
else:
    print(False)

print("case 3")
if greeting.__eq__(greeting2):
    print(True)
else:
    print(False)

print("case 4")
if greeting.__eq__('Morning'):
    print(True)
elif greeting.__eq__(greeting2):
    print("same string")
else:
    print("break")

print("Process finished with exit code 0")


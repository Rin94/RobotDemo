a = [1, 2, 3, 4, 5]

print(a)

b = ["jared", "angele", "laeken"]

c = a + b

print(b)
print(b[0])
print(c)
#the last element of the list
c.pop()
print(c)
c.remove("jared")
print(c)
print(c[2:4])
c.insert(7,"Daniel")
print(c)
#append in the last index
c.append("the last value")

c[2]="this is updated"

print(c)

del c[0]

print(c)

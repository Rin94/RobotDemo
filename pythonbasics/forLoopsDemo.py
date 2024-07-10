#iterate every value in a list

#foor loop
N=21
obj = list(range(1,N , 2))
print(obj)

for i in obj:
    print(i*2)

#Sum of first natural numbers 1+2+3+4+5
N=5
obj2 = list(range(1,N+1))
print (obj2)

sum = 0
for i in obj2:
    sum = sum + i

print(sum)

sum =0
#increments of 2
for i in range(1, 10, 2):
    print(i)
    sum = sum + i

print(sum)


sum =0
for i in range(10):
    print(i)
    print(sum)
    sum = sum + i

print(sum)

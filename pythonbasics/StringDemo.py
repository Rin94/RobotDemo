str = "JaredSalinasSDET.com"
str1 = "Consulting firm"
str3 = "JaredSalinas"
print(str[1]) #a

print(str[0:5]) # if you want to get a substring in python

print(str + str1) # Concatenate two strings

print(True if str.__contains__(str3) else False) #check if a string is in another string

print(str3 in str)

list =str.split(".") # split a string given a condition

[print(x) for x in list] # print the list in a single line
"""only the fist part of the string"""
print(list[0])

"""remove white spaces"""
str4= " great "
print(str4.strip())

"""remove only left white spaces"""
print(str4.lstrip())

"""remove only right white spaces"""
print(str4.rstrip())





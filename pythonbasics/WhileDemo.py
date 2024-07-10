it = 10
#no stop until conditions fails
while it>=1:

    if it == 9:
        it = it - 1
        continue
    if it == 3:
        break
    print(it)
    it = it-1

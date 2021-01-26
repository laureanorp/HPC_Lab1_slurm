from time import time

def fibonacci(termino):
    if termino <= 2:
        return 1
    else:
        return fibonacci(termino - 1) + fibonacci(termino - 2)

for i in range(1, 40):
    print(i)
    inicio= time()
    print(fibonacci(i))
    fin = time()
    print(fin-inicio)

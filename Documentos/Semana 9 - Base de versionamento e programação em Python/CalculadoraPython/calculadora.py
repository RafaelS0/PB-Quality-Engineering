
def soma(a, b):
    return a + b

def subtrai(a, b):
    return a - b

def multiplica(a, b):
    return a * b

def divide(a, b):
    if b == 0:
        return None
    return a / b

def potencia(base, expoente):
    return base ** expoente

def fatorial(n):
    if n == 0:
        return 1
    else:
        return n * fatorial(n-1)

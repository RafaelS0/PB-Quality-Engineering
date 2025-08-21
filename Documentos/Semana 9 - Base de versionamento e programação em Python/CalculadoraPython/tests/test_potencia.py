from calculadora import potencia

def test_potencia():
    assert potencia(2, 3) == 8
    assert potencia(3, 2) == 9
    assert potencia(5, 0) == 1
    assert potencia(0, 5) == 0
    assert potencia(2, -1) == 0.5
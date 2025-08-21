from calculadora import fatorial

def test_fatorial():
    assert fatorial(1) == 1
    assert fatorial(2) == 2
    assert fatorial(3) == 6
    assert fatorial(4) == 24
    assert fatorial(5) == 120

def test_fatorial_de_zero():
    assert fatorial(0) == 1
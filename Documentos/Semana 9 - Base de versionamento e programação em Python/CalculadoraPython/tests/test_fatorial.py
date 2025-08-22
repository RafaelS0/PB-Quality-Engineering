import calculadora

def test_fatorial():
    calc = calculadora.CalculadoraPython(1, 1)
    assert calc.fatorial(1) == 1
    assert calc.fatorial(2) == 2
    assert calc.fatorial(3) == 6
    assert calc.fatorial(4) == 24
    assert calc.fatorial(5) == 120

def test_fatorial_de_zero():
    calc = calculadora.CalculadoraPython(0, 0)
    assert calc.fatorial(0) == 1
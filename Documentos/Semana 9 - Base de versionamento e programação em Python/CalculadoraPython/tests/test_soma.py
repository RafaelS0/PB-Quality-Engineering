import calculadora

def test_soma():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(2, 3) == 5
    assert calc.soma(-1, 1) == 0
    assert calc.soma(0, 0) == 0

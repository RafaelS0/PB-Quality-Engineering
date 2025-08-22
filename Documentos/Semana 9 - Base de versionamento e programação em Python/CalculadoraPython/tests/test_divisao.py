import calculadora

def test_divide():
    calc = calculadora.CalculadoraPython(6, 3)
    assert calc.divide() == 2
    calc = calculadora.CalculadoraPython(-1, 1)
    assert calc.divide() == -1
    calc = calculadora.CalculadoraPython(0, 1)
    assert calc.divide() == 0

def test_divisao_por_zero():
    calc = calculadora.CalculadoraPython(1, 0)
    assert calc.divide() == None
    calc = calculadora.CalculadoraPython(0, 0)
    assert calc.divide() == None
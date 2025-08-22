import calculadora

def test_potencia():
    calc = calculadora.CalculadoraPython(2, 3)
    assert calc.potencia() == 8
    calc = calculadora.CalculadoraPython(3, 2)
    assert calc.potencia() == 9
    calc = calculadora.CalculadoraPython(5, 0)
    assert calc.potencia() == 1
    calc = calculadora.CalculadoraPython(0, 5)
    assert calc.potencia() == 0
    calc = calculadora.CalculadoraPython(2, -1)
    assert calc.potencia() == 0.5
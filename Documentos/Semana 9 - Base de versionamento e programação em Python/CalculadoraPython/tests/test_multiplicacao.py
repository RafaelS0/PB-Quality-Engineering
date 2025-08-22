import calculadora

def test_multiplica():
    calc = calculadora.CalculadoraPython(2, 3)
    assert calc.multiplica() == 6
    calc = calculadora.CalculadoraPython(-1, 1)
    assert calc.multiplica() == -1
    calc = calculadora.CalculadoraPython(0, 0)
    assert calc.multiplica() == 0

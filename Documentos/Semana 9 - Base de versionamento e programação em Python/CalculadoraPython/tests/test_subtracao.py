import calculadora

def test_subtrai():
    calc = calculadora.CalculadoraPython(5, 3)
    assert calc.subtrai() == 2
    calc = calculadora.CalculadoraPython(-1, 1)
    assert calc.subtrai() == -2
    calc = calculadora.CalculadoraPython(0, 0)
    assert calc.subtrai() == 0
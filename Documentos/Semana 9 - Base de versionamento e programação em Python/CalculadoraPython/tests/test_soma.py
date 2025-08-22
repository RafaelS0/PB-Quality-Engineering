import calculadora

def test_soma():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(2, 3) == 5


def test_soma_null():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(None, None) is None
    assert calc.soma(None, 5) is None
    assert calc.soma(5, None) is None

def test_soma_invalido():
    calc = calculadora.CalculadoraPython()
    assert calc.soma("a", 5) is None
    assert calc.soma(5, "b") is None
    assert calc.soma(None, None) is None
    calc = calculadora.CalculadoraPython()
    assert calc.soma("a", "b") is None
    assert calc.soma("#2@$!@", 5) is None

def test_soma_fracionaria():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(1.5, 2.5) == 4.0
    calc = calculadora.CalculadoraPython()
    assert calc.soma(1.5, 2) == 3.5

def test_soma_negativo():
    calc = calculadora.CalculadoraPython(-1, -1)
    assert calc.soma() == -2
    calc = calculadora.CalculadoraPython(-1, 1)
    assert calc.soma() == 0
    calc = calculadora.CalculadoraPython(1, -1)
    assert calc.soma() == 0
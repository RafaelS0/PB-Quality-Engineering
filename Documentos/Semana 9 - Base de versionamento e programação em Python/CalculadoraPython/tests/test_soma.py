import calculadora
import pytest

@pytest.mark.parametrize(
    "valor1, valor2, esperado",
    [
        (2, 3, 5),
        (0, 0, 0),
        (100, 200, 300),
        (-5, 5, 0),
        (1.5, 2.5, 4.0),
        (-1, -1, -2),
        (1, -1, 0),
        (-1, 1, 0),
    ]
)
def test_soma(valor1, valor2, esperado):
    calc = calculadora.CalculadoraPython()
    assert calc.soma(valor1, valor2) == esperado

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
    assert calc.soma("a", "b") is None
    assert calc.soma("#2@$!@", 5) is None

def test_soma_fracionaria():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(1.5, 2.5) == 4.0
    assert calc.soma(1.5, 2) == 3.5

def test_soma_negativo():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(-1, -1) == -2
    assert calc.soma(-1, 1) == 0
    assert calc.soma(1, -1) == 0

def test_soma_fracionaria():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(1.5, 2.5) == 4.0
    assert calc.soma(1.5, 2) == 3.5

def test_soma_negativo():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(-1, -1) == -2
    assert calc.soma(-1, 1) == 0
    assert calc.soma(1, -1) == 0
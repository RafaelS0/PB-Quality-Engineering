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
@pytest.mark.soma
def test_soma(valor1, valor2, esperado):
    calc = calculadora.CalculadoraPython()
    assert calc.soma(valor1, valor2) == esperado

@pytest.mark.soma
def test_soma_null():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(None, None) is None
    assert calc.soma(None, 5) is None
    assert calc.soma(5, None) is None

@pytest.mark.soma
def test_soma_invalido():
    calc = calculadora.CalculadoraPython()
    assert calc.soma("a", 5) is None
    assert calc.soma(5, "b") is None
    assert calc.soma(None, None) is None
    assert calc.soma("a", "b") is None
    assert calc.soma("#2@$!@", 5) is None

@pytest.mark.soma
def test_soma_fracionaria():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(1.5, 2.5) == 4.0
    assert calc.soma(1.5, 2) == 3.5

@pytest.mark.soma
def test_soma_negativo():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(-1, -1) == -2
    assert calc.soma(-1, 1) == 0
    assert calc.soma(1, -1) == 0

@pytest.mark.soma
def test_soma_fracionaria():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(1.5, 2.5) == 4.0
    assert calc.soma(1.5, 2) == 3.5

@pytest.mark.soma
def test_soma_negativo():
    calc = calculadora.CalculadoraPython()
    assert calc.soma(-1, -1) == -2
    assert calc.soma(-1, 1) == 0
    assert calc.soma(1, -1) == 0

@pytest.mark.subtracao
def test_subtrai():
    calc = calculadora.CalculadoraPython()
    assert calc.subtrai(5, 3) == 2
    assert calc.subtrai(-1, 1) == -2
    assert calc.subtrai(0, 0) == 0

@pytest.mark.multiplicacao
def test_multiplica():
    calc = calculadora.CalculadoraPython()
    assert calc.multiplica(2, 3) == 6
    assert calc.multiplica(-1, 1) == -1
    assert calc.multiplica(0, 0) == 0

@pytest.mark.divisao
def test_divide():
    calc = calculadora.CalculadoraPython()
    assert calc.divide(6, 3) == 2
    assert calc.divide(-1, 1) == -1
    assert calc.divide(0, 1) == 0

@pytest.mark.divisao
def test_divisao_por_zero():
    calc = calculadora.CalculadoraPython()
    assert calc.divide(1, 0) == None
    assert calc.divide(0, 0) == None


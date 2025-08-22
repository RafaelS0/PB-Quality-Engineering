import calculadora
import pytest

def test_fatorial():
    calc = calculadora.CalculadoraPython()
    assert calc.fatorial(1) == 1
    assert calc.fatorial(2) == 2
    assert calc.fatorial(3) == 6
    assert calc.fatorial(4) == 24
    assert calc.fatorial(5) == 120

def test_fatorial_de_zero():
    calc = calculadora.CalculadoraPython()
    assert calc.fatorial(0) == 1

def test_potencia():
    calc = calculadora.CalculadoraPython()
    assert calc.potencia(2, 3) == 8
    assert calc.potencia(3, 2) == 9
    assert calc.potencia(5, 0) == 1
    assert calc.potencia(0, 5) == 0
    assert calc.potencia(2, -1) == 0.5

def test_logaritmo_natural():
    calc = calculadora.CalculadoraPython()
    assert calc.log_natural(3) == pytest.approx(1.0986, 0.0001)
    assert calc.log_natural(1) == 0
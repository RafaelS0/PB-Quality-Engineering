import calculadora
import pytest

def test_divide():
    calc = calculadora.CalculadoraPython()
    assert calc.divide(6, 3) == 2
    assert calc.divide(-1, 1) == -1
    assert calc.divide(0, 1) == 0

def test_divisao_por_zero():
    calc = calculadora.CalculadoraPython()
    assert calc.divide(1, 0) == None
    assert calc.divide(0, 0) == None

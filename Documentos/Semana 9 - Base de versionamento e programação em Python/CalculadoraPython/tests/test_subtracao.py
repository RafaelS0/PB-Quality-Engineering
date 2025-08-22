import calculadora
import pytest

def test_subtrai():
    calc = calculadora.CalculadoraPython()
    assert calc.subtrai(5, 3) == 2
    assert calc.subtrai(-1, 1) == -2
    assert calc.subtrai(0, 0) == 0
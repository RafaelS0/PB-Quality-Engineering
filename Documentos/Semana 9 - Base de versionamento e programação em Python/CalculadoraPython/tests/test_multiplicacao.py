import calculadora
import pytest

def test_multiplica():
    calc = calculadora.CalculadoraPython()
    assert calc.multiplica(2, 3) == 6
    assert calc.multiplica(-1, 1) == -1
    assert calc.multiplica(0, 0) == 0

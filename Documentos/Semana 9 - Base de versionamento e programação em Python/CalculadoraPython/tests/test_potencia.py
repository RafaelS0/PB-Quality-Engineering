import calculadora
import pytest

def test_potencia():
    calc = calculadora.CalculadoraPython()
    assert calc.potencia(2, 3) == 8
    assert calc.potencia(3, 2) == 9
    assert calc.potencia(5, 0) == 1
    assert calc.potencia(0, 5) == 0
    assert calc.potencia(2, -1) == 0.5
from calculadora import multiplica

def test_multiplica():
    assert multiplica(2, 3) == 6
    assert multiplica(-1, 1) == -1
    assert multiplica(0, 0) == 0

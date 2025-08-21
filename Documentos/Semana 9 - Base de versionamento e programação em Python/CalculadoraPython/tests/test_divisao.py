from calculadora import divide

def test_divide():
    assert divide(6, 3) == 2
    assert divide(-1, 1) == -1
    assert divide(0, 1) == 0

def test_divisao_por_zero():
    assert divide(1, 0) == None
    assert divide(0, 0) == None
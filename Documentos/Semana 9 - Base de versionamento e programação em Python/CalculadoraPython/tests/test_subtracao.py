from calculadora import subtrai

def test_subtrai():
    assert subtrai(5, 3) == 2
    assert subtrai(-1, 1) == -2
    assert subtrai(0, 0) == 0
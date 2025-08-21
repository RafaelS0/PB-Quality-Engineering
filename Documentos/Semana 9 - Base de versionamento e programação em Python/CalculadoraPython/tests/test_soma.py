from calculadora import soma
def test_soma():
    assert soma(2, 3) == 5
    assert soma(0, 0) == 0

def test_soma_null():
    assert soma(None, None) is None
    assert soma(None, 5) is None
    assert soma(5, None) is None

def test_soma_invalido():
    assert soma("a", 5) == None
    assert soma(5, "b") == None
    assert soma("a", "b") == None
    assert soma("#2@$!@", 5) == None

def test_soma_fracionaria():
    assert soma(1.5, 2.5) == 4.0
    assert soma(1.5, 2) == 3.5
    assert soma(2, 2.5) == 4.5

def test_soma_negativo():
    assert soma(-1, -1) == -2
    assert soma(-1, 1) == 0
    assert soma(1, -1) == 0
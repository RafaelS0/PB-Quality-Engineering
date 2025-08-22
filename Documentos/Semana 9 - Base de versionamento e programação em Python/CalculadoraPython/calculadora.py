class CalculadoraPython:

  def __init__(self):
    self.valor1 = 0
    self.valor2 = 0

  def soma(self, valor1, valor2):
    if valor1 is not None and valor2 is not None:
      if isinstance(valor1, str) or isinstance(valor2, str):
        return None
      return valor1 + valor2

  def subtrai(self, valor1, valor2):
    if valor1 is not None and valor2 is not None:
      if isinstance(valor1, str) or isinstance(valor2, str):
        return None
      return valor1 - valor2

  def multiplica(self, valor1, valor2):
    if valor1 is not None and valor2 is not None:
      if isinstance(valor1, str) or isinstance(valor2, str):
        return None
      return valor1 * valor2

  def divide(self, valor1, valor2):
    if valor2 == 0:
      return None
    return self.valor1 / self.valor2

  def potencia(self, valor1, valor2):
    if valor1 is not None and valor2 is not None:
      if isinstance(valor1, str) or isinstance(valor2, str):
        return None
      return valor1 ** valor2

  def fatorial(self, n):
    if n == 0:
      return 1
    else:
      return n * self.fatorial(n-1)

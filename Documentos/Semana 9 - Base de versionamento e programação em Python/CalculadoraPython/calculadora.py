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
    return valor1 / valor2

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

  def log_natural(self, n, precisao=100):
    """
    Calcula ln(x) usando série de Taylor
    ln(x) = 2 * [(x-1)/(x+1) + 1/3*(x-1)/(x+1))^3 + 1/5*(x-1)/(x+1))^5 + ...]
    """
    if n <= 0:
        raise ValueError("numero deve ser positivo")

    # Para melhor convergência, trabalhamos com valores próximos de 1
    if n > 2:
        return self.log_natural(n/2) + self.log_natural(2)
    if n < 0.5:
        return self.log_natural(n*2) - self.log_natural(2)

    termo = (n - 1) / (n + 1)
    resultado = 0
    termo_atual = termo

    for i in range(1, precisao, 2):
        resultado += termo_atual / i
        termo_atual *= termo * termo  # termo^(2n+1)
    
    return 2 * resultado

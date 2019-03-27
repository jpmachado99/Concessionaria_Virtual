class Relatorio
  def initialize(loja)
    @loja = loja
  end
  
  def total
    soma = 0.0
  
    @loja.carros.map(&:preco).inject(:+)
  end
  
  def marcas
    marcas = []
  
    @loja.carros.map &:marca
  end
end
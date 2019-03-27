class Relatorio
  def initialize(loja)
    @loja = loja
  end
  
  def total
    soma = 0.0
  
    @loja.veiculos.map(&:preco).inject(:+)
  end
  
  def marcas
    marcas = []
  
    @loja.veiculos.map &:marca
  end
end
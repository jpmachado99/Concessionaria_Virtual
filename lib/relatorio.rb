# encoding: Windows-1252
class Relatorio
  def initialize(loja)
    @loja = loja
  end
  
  def total
    soma = 0.0
  
    "Preço de todos os veículos: R$#{@loja.veiculos.map(&:preco).inject(:+)}"
  end
  
  def marcas
    marcas = []
  
    @loja.veiculos.map &:marca
  end
end
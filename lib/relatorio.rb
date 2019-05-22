# encoding: Windows-1252
class Relatorio
  def initialize(loja)
    @loja = loja
  end
  
  def total
    soma = 0.0
  
    "Pre�o de todos os ve�culos: R$#{@loja.veiculos.map(&:preco).inject(:+)}"
  end
  
  def marcas
    marcas = []
  
    @loja.veiculos.map &:marca
  end
end
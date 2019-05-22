# encoding: Windows-1252
class Moto < Veiculo
	attr_reader :marca

  def initialize(id, marca, modelo, cor, ano, preco, categoria)
    super()
    @id = id
    @marca = marca
    @modelo = modelo
    @cor = cor
    @ano = ano
    @preco = preco
    @categoria = categoria
  end

  def to_s
    %Q{MOTO -> Modelo: #{@modelo}, Cor: #{@cor}, Ano: #{@ano}, Preco: #{@preco}, Categoria: #{@categoria}\n}
  end

end
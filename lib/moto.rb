class Moto < Veiculo
	attr_reader :modelo
	include FormatadorMoeda
  formata_moeda :preco, :preco_com_desconto,

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
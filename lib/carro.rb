class Carro < Veiculo
	# todos os métodos de instância são
	# incluídos nos objetos Carro

	extend FormatadorMoeda
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
    %Q{CARRO -> Modelo: #{@modelo}, Cor: #{@cor}, Ano: #{@ano}, Preco: #{@preco}, Categoria: #{@categoria}\n}
  end
    
  def eql?(outro_carro)
    @id == outro_carro.id
  end
    
  def hash
    @id.hash
  end
end
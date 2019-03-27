class Bike < Veiculo
  def initialize(id, modelo, cor, preco, categoria)
		super()
		@id = id
    @modelo = modelo
    @cor = cor
    @preco = preco
    @categoria = categoria
  end

  def to_s
    %Q{BIKE -> Modelo: #{@modelo}, Cor: #{@cor}, Preco: R$#{@preco}, Categoria: #{@categoria}}
  end
end
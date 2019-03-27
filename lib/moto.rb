class Moto < Veiculo
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
    %Q{MOTO -> Marca: #{@marca}, Modelo: #{@modelo}, Preço: R$#{@preco}, Categoria: #{@categoria} }
  end
  
  def hash
    @id.hash
end
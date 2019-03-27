class Loja
  def initialize
    @veiculos = {}
  end
    
  def adiciona(veiculo)
    @veiculos[veiculo.categoria] ||= []
    @veiculos[veiculo.categoria] << veiculo
  end
    
  def veiculos
    @veiculos.values.flatten
  end
    
  def veiculos_por_categoria(categoria)
    @veiculos[categoria].each do |veiculo|
      yield veiculo if block_given?
    end
  end
end
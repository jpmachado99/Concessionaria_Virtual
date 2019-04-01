class Veiculo
  attr_accessor :preco
  attr_reader :categoria, :marca
    
  def initialize
    @desconto = 0.1
  end
    
  def preco_com_desconto
    @preco - desconto
  end

  def marca
    "Marca -> #{@marca}"
  end
    
  private
  def desconto
    @preco * @desconto
  end
	
end
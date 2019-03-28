class Veiculo
  attr_accessor :preco
  attr_reader :categoria, :modelo
  
  def initialize
    @desconto = 0.1
  end
  
  def valor_com_desconto
    @preco - desconto
  end
    
  private
  def desconto
    @valor * desconto
  end

  module FormatadorMoeda
    def valor_formatado
      "R$ #{@preco}"
    end
  end
end

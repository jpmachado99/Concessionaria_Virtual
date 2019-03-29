class Veiculo
  attr_accessor :preco
  attr_reader :categoria, :modelo
    
  def initialize
    @desconto = 0.1
  end
    
  def preco_com_desconto
    @preco - desconto
  end
    
  private
  def desconto
    @preco * @desconto
  end

	module FormatadorMoeda
  	def self.formata_moeda(*vars_met)
    	vars_met.each do |name|
      	define_method("#{name}_formatado") do
        	preco = respond_to?(name) ? send(name) : instance_variable_get("@#{name}")
        	"R$ #{preco}"
      	end
    	end
  	end
	end
	
end
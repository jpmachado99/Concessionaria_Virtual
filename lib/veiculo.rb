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
<<<<<<< HEAD:lib/veiculos.rb

    module FormatadorMoeda
      def valor_formatado
        "R$ #{@preco}"
      end
    end
end
=======
end
>>>>>>> 2ba55b2a2402043d50189b454c2e5b81de90a7ff:lib/veiculo.rb

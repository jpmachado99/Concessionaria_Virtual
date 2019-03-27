module VendaFacil
  class Set
    def initialize
      @arquivos = BancoDeArquivos.new 
    end
      
    def adiciona(veiculo)
      salva veiculo do
        veiculos << veiculo
      end
    end
      
    def veiculos
      @veiculos ||= @arquivos.carrega
    end
      
    def veiculos_por_categoria(categoria)
      veiculos.select {|veiculo| veiculo.categoria == categoria}
    end

		def each
			veiculos.each{|veiculo| yield veiculo}
		end
    
    private
    def salva(veiculo)
      @arquivos.salva veiculo
      yield
    end
  end
end
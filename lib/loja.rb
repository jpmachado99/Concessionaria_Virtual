# encoding: Windows-1252
module VendaFacil
  class Set
    include Enumerable

    def initialize
      @veiculos = ::Array.new
      @arquivos = BancoDeArquivos.new 
    end
      
    def adiciona(veiculo)
      salva(veiculo) do
        veiculos << veiculo
      end if veiculo.kind_of? Veiculo #-> O método kind_of? retorna true se o objeto for um tipo ou subtipo da constante passado como argumento
    end
      
    def veiculos
      @veiculos ||= @arquivos.carrega
    end
      
    def veiculos_por_categoria(categoria)
      veiculos.select do |veiculo| 
	      veiculo.categoria == categoria if veiculo.respond_to? :categoria # Retorna true se o objeto(veiculo) responder ao método dado(:categoria)
      end
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
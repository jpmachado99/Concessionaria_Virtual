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

class Carro < Veiculo
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
      %Q{CARRO -> Modelo: #{@modelo}, Cor: #{@cor}, Ano: #{@ano}, 
       Preco: #{@preco}, Categoria: #{@categoria}\n}
    end
      
    def eql?(outro_carro)
      @id == outro_carro.id
    end
      
    def hash
      @id.hash
    end
end

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
      %Q{MOTO -> Marca: #{@marca}, Modelo: #{@modelo}, Preço: #{@preco}, Categoria: #{@categoria} }
    end
    
    def hash
      @id.hash
    end
end

class Bike < Veiculo
  def initialize(modelo, cor, preco, categoria)
    super()
    @modelo = modelo
    @cor = cor
    @preco = preco
    @categoria = categoria
  end

  def to_s
    %Q{BIKE -> Modelo: #{@modelo}, Cor: #{@cor}, Preco: R$#{@preco}, Categoria: #{@categoria}}
  end
end

require "yaml"
class BancoDeArquivos
	def salva(veiculo)
		File.open("veiculos.yml", "a") do |arquivo|
			arquivo.puts YAML.dump(veiculo)
			arquivo.puts ""
		end
	end
	def carrega
		$/ = "\n\n"
		File.open("veiculos.yml", "r").map do |livro_serializado|
			YAML.load livro_serializado
		end
	end
end

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
    
    private
    def salva(veiculo)
      @arquivos.salva veiculo
      yield
    end
  end
end

class Relatorio
  def initialize(loja)
    @loja = loja
  end
    
  def total
    soma = 0.0
  
    @loja.veiculos.map(&:preco).inject(:+)
  end
    
  def marcas
    marcas = []
   
    @loja.veiculos.map &:marca
  end
end

loja = VendaFacil::Set.new

loja.adiciona Carro.new("1", "Fiat", "Tempra", "Azul", 2002, 5000, :hatch)
loja.adiciona Moto.new("1", "Honda", "Hornet", "Fuscia", 2017, 30000, :sport)
loja.adiciona Bike.new("1", "Caloi 100", "Cinza", 500, :urbana)

puts loja.inject(0) {|tot, veiculo| tot += veiculo.preco}
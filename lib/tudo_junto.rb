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

class Carro < Veiculo
	# todos os métodos de instância são
	# incluídos nos objetos Carro

	extend FormatadorMoeda
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
    %Q{CARRO -> Modelo: #{@modelo}, Cor: #{@cor}, Ano: #{@ano}, Preco: #{@preco}, Categoria: #{@categoria}\n}
  end
    
  def eql?(outro_carro)
    @id == outro_carro.id
  end
    
  def hash
    @id.hash
  end
end

class Moto < Veiculo
	attr_reader :modelo
	include FormatadorMoeda
  formata_moeda :preco, :preco_com_desconto,

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
    %Q{MOTO -> Modelo: #{@modelo}, Cor: #{@cor}, Ano: #{@ano}, Preco: #{@preco}, Categoria: #{@categoria}\n}
  end
  
end

class Bike < Veiculo
	extend FormatadorMoeda
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

class Pneu
	@id = 0

	def self.id
		@id += 1
	end
	
	def initialize(marca, dimensao)
		@id = self.class.id
		@marca = marca
		@dimensao = dimensao
	end

	def id
		@id
	end

	def marca
		"Marca: #{@marca}"
	end

	def to_s
		%Q{Marca: #{@marca}, Dimensão: #{@dimensao}}
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
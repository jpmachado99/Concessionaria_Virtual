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

loja = Loja.new

tempra = Carro.new("1", "Fiat", "Tempra", "Azul", 2002, 10000.0, :hatch)
amarok = Carro.new("2", "Volks", "Amarok", "Cinza", 2018, 90000.0, :suv)
loja.adiciona(tempra)
loja.adiciona(amarok)

hornet = Moto.new("1", "Honda", "Hornet", "Fúscia", 2017, 30000.0, :sport)
loja.adiciona(hornet)

puts loja.veiculos
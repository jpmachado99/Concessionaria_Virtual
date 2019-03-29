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
class Pneu
	def initialize(id, marca, dimensao)
		@id = id
		@marca = marca
		@dimensao = dimensao
	end

	def to_s
		%Q{Marca: #{@marca}, Dimensão: #{@dimensao}}
	end
end
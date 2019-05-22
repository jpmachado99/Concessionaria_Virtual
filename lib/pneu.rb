# encoding: Windows-1252
require "yaml"
class Pneu
	attr_reader :marca, :id
	attr_accessor :preco

	@id = 0

	def initialize(marca, preco)
		@marca = marca
		@preco = preco
		@id = self.class.next_id
	end

	def save
		File.open("veiculos.yml", "w") { |file| file.puts serialize}
	end

	def self.find(id)
		raise DocumentNotFound, "Arquivo veiculo.yml não encontrado.", caller unless File.exists?("veiculos.yml")

		YAML.load File.open("veiculos.yml", "r")
	end

	private
	def serialize
		YAML.dump self
	end

	def self.next_id
		Dir.glob("veiculos.yml").size + 1
	end
end
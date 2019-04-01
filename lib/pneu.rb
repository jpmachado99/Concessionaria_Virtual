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
		File.open("db/pneus/#{@id}.yml", "w") { |file| file.puts serialize}
	end

	def self.find(id)
		raise DocumentNotFound, "Arquivo db/pneus/#{id}.yml não encontrado.", caller unless File.exists?("db/pneus/#{id}.yml")

		YAML.load File.open("db/pneus/#{id}.yml", "r")
	end

	private
	def serialize
		YAML.dump self
	end

	def self.next_id
		Dir.glob("db/pneus/*.yml").size + 1
	end
end
require "yaml"
class BancoDeArquivos
	def salva(veiculo)
		File.open("veiculos.yml", "a") do |arquivo|
			arquivo.puts YAML.dump(veiculo)
			arquivo.puts ""
			arquivo.close unless file.closed?
		end
	end
	
	def carrega
		$/ = "\n\n"
		File.open("veiculos.yml", "r").map do |livro_serializado|
			YAML.load livro_serializado
		end
	end
end
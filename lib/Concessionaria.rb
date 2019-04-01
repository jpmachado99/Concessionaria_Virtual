load "veiculo.rb"
load "arquivos.rb"
load "loja.rb"
load "relatorio.rb"
load "moto.rb"
load "carro.rb"
load "bike.rb"
load "pneu.rb"
load "formatador_moeda.rb"
extend FormatadorMoeda
formata_moeda :preco, :preco_com_desconto

loja = VendaFacil::Set.new

hornet = Moto.new("1", "Honda", "Modelo", "Preta", 2017, 30000, :sport)

puts hornet.marca
puts hornet.preco_formatado
puts hornet.preco_com_desconto_formatado
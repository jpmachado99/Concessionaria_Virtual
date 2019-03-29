load "veiculo.rb"
load "arquivos.rb"
load "loja.rb"
load "relatorio.rb"
load "moto.rb"
load "carro.rb"
load "bike.rb"
load "pneu.rb"

loja = VendaFacil::Set.new

hornet = Moto.new("1", "Honda", "Modelo", "Preta", 2017, 30000, :sport)

puts hornet.preco_formatado
puts hornet.preco_com_desconto_formatado
load "veiculo.rb"
load "arquivos.rb"
load "loja.rb"
load "relatorio.rb"
load "moto.rb"
load "carro.rb"
load "bike.rb"

loja = VendaFacil::Set.new

loja.adiciona Carro.new("1", "Fiat", "Tempra", "Azul", 2002, 5000, :hatch)
loja.adiciona Moto.new("1", "Honda", "Hornet", "Fuscia", 2017, 30000, :sport)
loja.adiciona Bike.new("1", "Caloi 100", "Cinza", 500, :urbana)

puts loja.inject(0) {|tot, veiculo| tot += veiculo.preco}
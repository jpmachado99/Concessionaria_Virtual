load "veiculo.rb"
load "loja.rb"
load "relatorio.rb"
load "arquivos.rb"
load "moto.rb"
load "carro.rb"
load "bike.rb"

loja = VendaFacil::Set.new
rel = Relatorio.new loja

tempra = Carro.new("1", "Fiat", "Tempra", "Azul", 2002, 5000.0, :hatch)
amarok = Carro.new("2", "Volks", "Amarok", "Cinza", 2018, 90000.0, :suv)
loja.adiciona(tempra)
loja.adiciona(amarok)

hornet = Moto.new("1", "Honda", "Hornet", "Fuscia", 2017, 30000.0, :sport)
loja.adiciona(hornet)

caloi100 = Bike.new("1", "Caloi 100", "Cinza", 500.0, :urbana)
loja.adiciona(caloi100)

puts loja.veiculos
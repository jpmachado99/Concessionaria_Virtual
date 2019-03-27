require File.expand_path("veiculos.rb")
require File.expand_path("loja.rb")
require File.expand_path("relatorio.rb")
require File.expand_path("moto.rb")
require File.expand_path("carro.rb")

loja = Loja.new

tempra = Carro.new("1", "Fiat", "Tempra", "Azul", 2002, 10000.0, :hatch)
amarok = Carro.new("2", "Volks", "Amarok", "Cinza", 2018, 90000.0, :suv)
loja.adiciona(tempra)
loja.adiciona(amarok)

hornet = Moto.new("1", "Honda", "Hornet", "Fúscia", 2017, 30000.0, :sport)
loja.adiciona(hornet)

puts loja.veiculos
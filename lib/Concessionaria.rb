# encoding: Windows-1252

load "veiculo.rb"
load "arquivos.rb"
load "loja.rb"
load "relatorio.rb"
load "moto.rb"
load "carro.rb"
load "bike.rb"
load "pneu.rb"
load "formatador_moeda.rb"

loja = VendaFacil::Set.new
loja.adiciona Carro.new("2", "Volks", "Gol", "Preto", 2017, 30000, :hatch)
puts loja.veiculos 

multiplicador =  lambda {|x,y| x*y}.curry
dobro = multiplicador.call 2

p dobro.call
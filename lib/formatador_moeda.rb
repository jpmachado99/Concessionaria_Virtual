# encoding: Windows-1252

module FormatadorMoeda
  def metodo_de_instancia
    "Um metodo de instância qualquer"
  end
  
  # adicionado o caractere * antes
  # do nome do argumento
  # define que este argumento recebe N valores
  # separados por vírgula
  module ClassMethods
    def self.formata_moeda(*vars_met)
      vars_met.each do |name|
        define_method("#{name}_formatado") do
          preco = respond_to?(name) ? send(name) : instance_variable_get("@#{name}")
          "R$ #{preco}"
        end
      end
    end

    # hook method que é executado quando incluímos o módulo
    # dentro de alguma classe, recebendo no argumento
    # classe_que_incluiu_modulo o objeto %%Class%% que
    # representa a classe que incluiu o módulo

    def self.included(classe_que_incluiu_modulo)
      classe_que_incluiu_modulo.extends ClassMethods
    end
  end

end
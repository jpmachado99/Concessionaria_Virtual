module FormatadorMoeda
  def self.formata_moeda(*vars_met)
    vars_met.each do |name|
      define_method("#{name}_formatado") do
        preco = respond_to?(name) ? send(name) : instance_variable_get("@#{name}")
        "R$ #{preco}"
      end
    end
  end
end
class Bebida
  attr_reader :titulo
  
  def initialize(titulo, preco_inicial)
    @titulo = titulo
    self.preco_inicial = preco_inicial
  end
  
  def preco_inicial
    @preco_inicial
  end

  def preco_inicial=(valor)
    if valor > 0
      @preco_inicial = valor
    else
      raise "O preço precisa ser maior que zero!"
    end
  end

  def valor_total
    @preco_inicial
  end

  def to_s
    "Bebida: #{@titulo} | Preço base: R$#{@preco_inicial}"
  end
end

class BebidaRara < Bebida
  def initialize(titulo, preco_inicial, anos_experiencia)
    super(titulo, preco_inicial)
    @anos_experiencia = anos_experiencia
  end

  def valor_total
    @preco_inicial + (4.5 * @anos_experiencia)
  end

  def to_s
    "Bebida Rara: #{@titulo} | Preço base: R$#{@preco_inicial} | " \
    "Anos desde criação: #{@anos_experiencia} | Valor final: R$#{valor_total}"
  end
end

print "Informe o nome da bebida: "
titulo = gets.chomp
print "Digite o preço base: "
preco = gets.chomp.to_f
print "Há quantos anos ela foi criada? "
anos = gets.chomp.to_i

bebida = BebidaRara.new(titulo, preco, anos)
puts "\n#{bebida}"

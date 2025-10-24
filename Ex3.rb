
class Artista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def executar_musica(titulo)
    raise NotImplementedError, "Subclasse deve definir este método!"
  end

  def to_s
    "#{@nome} toca #{@instrumento}"
  end
end


class Pianista < Artista
  def initialize(nome)
    super(nome, "Piano")
  end

  def executar_musica(titulo)
    puts "#{@nome} interpreta '#{titulo}' com suavidade ao piano!"
  end
end


class Violinista < Artista
  def initialize(nome)
    super(nome, "Violino")
  end

  def executar_musica(titulo)
    puts "#{@nome} apresenta '#{titulo}' com técnica no violino!"
  end
end


class Regente
  def initialize(artistas)
    @artistas = artistas
  end

  def iniciar_treino(titulo)
    puts "\n🎶 Ensaio da música '#{titulo}' iniciado!"
    @artistas.each { |a| a.executar_musica(titulo) }
  end

  def alterar_clima(estado)
    puts "\nAlterando o clima da orquestra para: #{estado}"
    @artistas.each { |a| puts "#{a.nome} está agora #{estado.downcase}." }
  end
end


print "Informe o nome da música a ser ensaiada: "
titulo = gets.chomp

a1 = Pianista.new("Arima")
a2 = Violinista.new("Kaori")
a3 = Pianista.new("Reina")

regente = Regente.new([a1, a2, a3])
regente.iniciar_treino(titulo)
regente.alterar_clima("Focado")

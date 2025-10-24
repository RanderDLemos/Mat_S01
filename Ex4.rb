
module Localizavel
  def obter_posicao(horario)
    "Local detectado às #{horario}: #{@posicao}"
  end
end


module Ameaçador
  def avaliar_perigo
    "⚠️ Perigo elevado! #{@apelido} é uma ameaça!"
  end
end


class Pessoa
  attr_reader :apelido, :posicao

  def initialize(apelido)
    @apelido = apelido
  end

  def definir_posicao(local)
    @posicao = local
  end

  def to_s
    "#{@apelido} (#{self.class})"
  end
end


class Inspetor < Pessoa
  include Localizavel

  def obter_posicao(horario)
    "Inspetor #{@apelido} está em #{@posicao} às #{horario}."
  end
end


class Vilao < Pessoa
  include Localizavel
  include Ameaçador

  def obter_posicao(horario)
    "Vilão #{@apelido} foi visto em #{@posicao} às #{horario}!"
  end

  def avaliar_perigo
    "#{@apelido} representa perigo máximo à sociedade!"
  end
end


class Investigacao
  def initialize(pessoas)
    @pessoas = pessoas
  end

  def buscar_ameacas
    @pessoas.select { |p| p.respond_to?(:avaliar_perigo) }
  end

  def relatorio_ameacas
    suspeitos = buscar_ameacas
    puts "\n🚨 Suspeitos Perigosos Detectados:"
    if suspeitos.empty?
      puts "Nenhuma ameaça registrada."
    else
      suspeitos.each { |s| puts s.avaliar_perigo }
    end
  end
end


print "Informe a localização atual de Conan (Inspetor): "
local_conan = gets.chomp
print "Informe a localização de Kaito (Vilão): "
local_kaito = gets.chomp

conan = Inspetor.new("Conan")
conan.definir_posicao(local_conan)

kaito = Vilao.new("Kaito Kid")
kaito.definir_posicao(local_kaito)

caso = Investigacao.new([conan, kaito])

puts "\n=== RELATÓRIO DE LOCALIZAÇÕES ==="
puts conan.obter_posicao("09:00")
puts kaito.obter_posicao("09:00")

caso.relatorio_ameacas


class ComponenteAquecedor
  def ativar_por(segundos)
    puts "Aquecendo por #{segundos} segundos..."
  end
end


class MensagemTemporal
  attr_reader :texto, :horario_envio

  def initialize(texto, horario_envio)
    @texto = texto
    @horario_envio = horario_envio
  end

  def to_s
    "Mensagem Temporal: '#{@texto}' enviada às #{@horario_envio}"
  end
end


class CronoTelefone
  def initialize
    @aquecedor = ComponenteAquecedor.new
    @mensagens = []
  end

  def enviar_mensagem
    puts "\nEscreva o conteúdo da mensagem:"
    conteudo = gets.chomp

    puts "Informe o horário de envio (ex: 11:45):"
    horario = gets.chomp

    puts "Quantos segundos de aquecimento deseja?"
    tempo = gets.chomp.to_i

    @aquecedor.ativar_por(tempo)

    nova_mensagem = MensagemTemporal.new(conteudo, horario)
    @mensagens << nova_mensagem

    puts "Mensagem enviada com sucesso!"
  end

  def listar_mensagens(horario_referencia)
    puts "\n📩 Mensagens enviadas após #{horario_referencia}:"
    recentes = @mensagens.select { |m| m.horario_envio > horario_referencia }

    if recentes.empty?
      puts "Nenhuma mensagem após esse horário."
    else
      recentes.each { |m| puts m }
    end
  end
end


app = CronoTelefone.new

loop do
  puts "\n=== MENU DO CRONOTELEFONE ==="
  puts "1. Enviar Mensagem Temporal"
  puts "2. Listar Mensagens após horário"
  puts "3. Encerrar"
  print "Opção: "
  escolha = gets.chomp.to_i

  case escolha
  when 1
    app.enviar_mensagem
  when 2
    print "Digite o horário limite (ex: 08:30): "
    limite = gets.chomp
    app.listar_mensagens(limite)
  when 3
    puts "Encerrando programa..."
    break
  else
    puts "Opção inválida!"
  end
end

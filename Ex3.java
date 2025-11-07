import java.util.HashMap;

interface Localizavel {
    String coordenadas();
}

class Habilidade {
    private String titulo;

    public Habilidade(String titulo) {
        this.titulo = titulo;
    }

    public String getTitulo() {
        return titulo;
    }
}

abstract class Criatura implements Localizavel {
    protected String apelido;
    protected String posicao;
    protected Habilidade habilidade;

    public Criatura(String apelido, String posicao, Habilidade habilidade) {
        this.apelido = apelido;
        this.posicao = posicao;
        this.habilidade = habilidade;
    }

    @Override
    public abstract String coordenadas();
}

class Espirito extends Criatura {
    public Espirito(String apelido, String posicao, Habilidade habilidade) {
        super(apelido, posicao, habilidade);
    }

    @Override
    public String coordenadas() {
        return "Espírito " + apelido + " visto em " + posicao;
    }
}

class Visitante extends Criatura {
    private String origem;
    private String transporte;

    public Visitante(String apelido, String origem, String transporte, Habilidade habilidade) {
        super(apelido, origem, habilidade);
        this.origem = origem;
        this.transporte = transporte;
    }

    @Override
    public String coordenadas() {
        return "Visitante " + apelido + " veio de " + origem + " em " + transporte;
    }
}

class Arquivo {
    private String nomeGrupo;
    private HashMap<String, Criatura> avistamentos;

    public Arquivo(String nomeGrupo) {
        this.nomeGrupo = nomeGrupo;
        this.avistamentos = new HashMap<>();
    }

    public boolean adicionarRegistro(Criatura criatura) {
        if (avistamentos.containsKey(criatura.apelido)) {
            return false;
        }
        avistamentos.put(criatura.apelido, criatura);
        return true;
    }

    public void exibirRegistros() {
        System.out.println("\n--- ARQUIVO DA EQUIPE " + nomeGrupo + " ---");
        for (Criatura c : avistamentos.values()) {
            System.out.println(c.coordenadas() + " | Habilidade: " + c.habilidade.getTitulo());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Habilidade invis = new Habilidade("Camuflagem");
        Habilidade telep = new Habilidade("Leitura Mental");

        Criatura kappa = new Espirito("Kappa", "Templo Submerso", invis);
        Criatura xeno = new Visitante("Xeno", "Órion", "Cápsula Luminosa", telep);

        Arquivo registros = new Arquivo("Caçadores do Desconhecido");

        registros.adicionarRegistro(kappa);
        registros.adicionarRegistro(xeno);
        registros.adicionarRegistro(kappa); // não duplica

        registros.exibirRegistros();
    }
}

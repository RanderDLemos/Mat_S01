import java.util.LinkedHashSet;
import java.util.HashMap;

class Golpe {
    private String descricao;
    private int dano;

    public Golpe(String descricao, int dano) {
        this.descricao = descricao;
        this.dano = dano;
    }

    public String getDescricao() {
        return descricao;
    }

    public int getDano() {
        return dano;
    }

    @Override
    public String toString() {
        return descricao + " (Dano: " + dano + ")";
    }
}

class Chefe {
    protected String nome;
    protected String codigo;
    protected String fraqueza;
    protected LinkedHashSet<Golpe> golpes;

    public Chefe(String nome, String codigo, String fraqueza) {
        this.nome = nome;
        this.codigo = codigo;
        this.fraqueza = fraqueza;
        this.golpes = new LinkedHashSet<>();
    }

    public void adicionarGolpe(Golpe golpe) {
        golpes.add(golpe);
    }

    public void iniciarCombate() {
        System.out.println("Enfrentando o chefe " + nome + "!");
        System.out.println("Fraqueza: " + fraqueza);
        System.out.println("Ataques conhecidos:");
        for (Golpe g : golpes) {
            System.out.println(" - " + g);
        }
    }

    public String getCodigo() {
        return codigo;
    }
}

class ChefeElemental extends Chefe {

    public ChefeElemental(String nome, String codigo, String fraqueza) {
        super(nome, codigo, fraqueza);
    }

    @Override
    public void iniciarCombate() {
        System.out.println(" === CHEFE ELEMENTAL ENCONTRADO === ");
        super.iniciarCombate();
        System.out.println("Este inimigo domina forças mágicas da natureza!");
    }
}

class Arena {
    private HashMap<String, Chefe> inimigos;

    public Arena() {
        this.inimigos = new HashMap<>();
    }

    public void registrarChefe(Chefe chefe) {
        inimigos.put(chefe.getCodigo(), chefe);
    }

    public void iniciarDuelo(String codigo) {
        Chefe chefe = inimigos.get(codigo);
        if (chefe != null) {
            chefe.iniciarCombate();
        } else {
            System.out.println("Nenhum chefe encontrado com o código '" + codigo + "'.");
        }
    }
}

public class Main {
    public static void main(String[] args) {
        ChefeElemental fenix = new ChefeElemental("Fênix Solar", "E001", "Água");
        fenix.adicionarGolpe(new Golpe("Chamas Eternas", 60));
        fenix.adicionarGolpe(new Golpe("Explosão Solar", 90));

        Chefe ogro = new Chefe("Ogro Rochoso", "G015", "Raio");
        ogro.adicionarGolpe(new Golpe("Pancada Terrestre", 40));

        Arena arena = new Arena();
        arena.registrarChefe(fenix);
        arena.registrarChefe(ogro);

        arena.iniciarDuelo("E001");
        System.out.println("-------");
        arena.iniciarDuelo("G015");
    }
}

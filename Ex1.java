import java.util.ArrayList;

class Ser {
    private String apelido;
    private int anos;

    public Ser(String apelido, int anos) {
        this.apelido = apelido;
        this.anos = anos;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

    public String getApelido() {
        return this.apelido;
    }

    public int getAnos() {
        return this.anos;
    }
}

class Feiticeiro extends Ser {
    private String encanto;

    public Feiticeiro(String apelido, int anos, String encanto) {
        super(apelido, anos);
        this.encanto = encanto;
    }

    public String conjurar() {
        return getApelido() + " conjurou o encanto: " + encanto + "!";
    }

    public String getEncanto() {
        return encanto;
    }

    public void setEncanto(String encanto) {
        this.encanto = encanto;
    }
}

class Ala {
    private String titulo;

    public Ala(String titulo) {
        this.titulo = titulo;
    }

    public String getTitulo() {
        return titulo;
    }
}

class Fortaleza {
    private String nomeFortaleza;
    private ArrayList<Ala> alas;

    public Fortaleza(String nomeFortaleza) {
        this.nomeFortaleza = nomeFortaleza;
        this.alas = new ArrayList<>();
    }

    public void incluirAla(Ala ala) {
        alas.add(ala);
    }

    public void exibirAlas() {
        System.out.println("Alas da fortaleza " + nomeFortaleza + ":");
        for (Ala a : alas) {
            System.out.println("- " + a.getTitulo());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Feiticeiro merlin = new Feiticeiro("Merlin", 200, "Chama dos Céus");

        Fortaleza torre = new Fortaleza("Torre de Avalon");

        torre.incluirAla(new Ala("Salão de Cristal"));
        torre.incluirAla(new Ala("Sala das Poções"));
        torre.incluirAla(new Ala("Arquivo Antigo"));

        System.out.println(merlin.conjurar());
        torre.exibirAlas();
    }
}

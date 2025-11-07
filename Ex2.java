import java.util.ArrayList;

class Bebida {
    private String titulo;
    private double valorBase;

    public Bebida(String titulo, double valorBase) {
        this.titulo = titulo;
        this.valorBase = valorBase;
    }

    public double precoFinal() {
        return valorBase;
    }

    public String getTitulo() {
        return titulo;
    }
}

class BebidaEspecial extends Bebida {
    private double adicionalSabor;

    public BebidaEspecial(String titulo, double valorBase, double adicionalSabor) {
        super(titulo, valorBase);
        this.adicionalSabor = adicionalSabor;
    }

    @Override
    public double precoFinal() {
        return super.precoFinal() + adicionalSabor;
    }
}

class Cardapio {
    private ArrayList<Bebida> opcoes;

    public Cardapio() {
        this.opcoes = new ArrayList<>();
    }

    public void incluirItem(Bebida bebida) {
        opcoes.add(bebida);
    }

    public void mostrarCardapio() {
        System.out.println("Cardápio da Cafeteria Solaris:");
        for (Bebida b : opcoes) {
            System.out.println("- " + b.getTitulo() + " | Valor: R$ " + b.precoFinal());
        }
    }
}

class CafeteriaSolaris {
    private Cardapio cardapio;

    public CafeteriaSolaris(Cardapio cardapio) {
        this.cardapio = cardapio;
    }

    public void fazerPedido(Bebida bebida) {
        System.out.println("Pedido feito: " + bebida.getTitulo() +
                " | Total: R$ " + bebida.precoFinal());
    }

    public void exibirCardapio() {
        cardapio.mostrarCardapio();
    }
}

public class Main {
    public static void main(String[] args) {
        Cardapio lista = new Cardapio();

        Bebida cha = new Bebida("Chá Preto", 5.50);
        BebidaEspecial mocha = new BebidaEspecial("Mocha Especial", 9.90, 2.60);

        lista.incluirItem(cha);
        lista.incluirItem(mocha);

        CafeteriaSolaris solaris = new CafeteriaSolaris(lista);

        solaris.exibirCardapio();
        solaris.fazerPedido(mocha);
    }
}

import java.util.*;

class Servico {
    private String nomeServico;
    private String tipoServico;
    private double preco;

    public Servico(String nomeServico, String tipoServico, double preco) {
        this.nomeServico = nomeServico;
        this.tipoServico = tipoServico;
        this.preco = preco;
    }

    public String getNomeServico() {
        return nomeServico;
    }

    public String getTipoServico() {
        return tipoServico;
    }

    public double getPreco() {
        return preco;
    }

    @Override
    public String toString() {
        return nomeServico + " (" + tipoServico + ") - R$" + preco;
    }
}

enum Status {
    EmAndamento, Finalizado, Cancelado
}

class Atendimento {
    private List<Servico> servicos;
    private Status statusAt;

    public Atendimento(List<Servico> servicos, Status statusAt) {
        this.servicos = servicos;
        this.statusAt = statusAt;
    }

    public List<Servico> getServicos() {
        return servicos;
    }

    public Status getStatusAt() {
        return statusAt;
    }

    @Override
    public String toString() {
        return "Serviços: " + servicos + " | Status: " + statusAt;
    }
}

public class Main {

    public static double bonusEspiritual(List<Servico> lista) {
        double somaBase = lista.stream().mapToDouble(Servico::getPreco).sum();
        int qtd = lista.size();
        double extraBonus = qtd > 3 ? somaBase * 0.25 : 0;
        double valorComBonus = somaBase + extraBonus;
        if (valorComBonus > 500) return valorComBonus * 0.90;
        return valorComBonus;
    }

    public static double valorFinalAtendimento(Atendimento a) {
        if (a.getStatusAt() == Status.Cancelado) return 0;
        double total = bonusEspiritual(a.getServicos());
        if (total > 500) return total;
        return total;
    }

    public static String descricaoServico(Atendimento a) {
        if (a.getServicos().isEmpty()) return "Nenhum serviço foi registrado.";
        Servico s = a.getServicos().get(0);
        return "Primeiro serviço: " + s.getNomeServico() + " (" + s.getTipoServico() + ")";
    }

    public static void main(String[] args) {
        Servico banho    = new Servico("Banho purificador", "Banho", 120);
        Servico massagem = new Servico("Massagem espiritual", "Massagem", 200);
        Servico banquete = new Servico("Banquete dos Espiritos", "Banquete", 350);
        Servico aroma    = new Servico("Aromaterapia celestial", "Relaxamento", 90);

        Atendimento at1 = new Atendimento(Arrays.asList(banho, massagem), Status.EmAndamento);
        Atendimento at2 = new Atendimento(Arrays.asList(banho, massagem, banquete, aroma), Status.Finalizado);
        Atendimento at3 = new Atendimento(Arrays.asList(banquete, massagem), Status.Cancelado);

        System.out.println("======= CASA DE BANHOS DA YUBABA =======");

        System.out.println("\nAtendimento 1:");
        System.out.println(at1);
        System.out.println(descricaoServico(at1));
        System.out.println("Valor final: R$ " + valorFinalAtendimento(at1));

        System.out.println("\nAtendimento 2:");
        System.out.println(at2);
        System.out.println(descricaoServico(at2));
        System.out.println("Valor final: R$ " + valorFinalAtendimento(at2));

        System.out.println("\nAtendimento 3 (Cancelado):");
        System.out.println(at3);
        System.out.println(descricaoServico(at3));
        System.out.println("Valor final: R$ " + valorFinalAtendimento(at3));
    }
}

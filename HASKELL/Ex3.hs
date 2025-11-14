import java.util.*;

class Banda {
    private String nomeBanda;
    private String genero;
    private double cache;

    public Banda(String nomeBanda, String genero, double cache) {
        this.nomeBanda = nomeBanda;
        this.genero = genero;
        this.cache = cache;
    }

    public String getNomeBanda() {
        return nomeBanda;
    }

    public double getCache() {
        return cache;
    }

    @Override
    public String toString() {
        return nomeBanda + " (" + genero + ") - R$" + cache;
    }
}

enum Status {
    Ativo, Encerrado, Cancelado
}

class Evento {
    private List<Banda> bandas;
    private Status status;

    public Evento(List<Banda> bandas, Status status) {
        this.bandas = bandas;
        this.status = status;
    }

    public List<Banda> getBandas() {
        return bandas;
    }

    public Status getStatus() {
        return status;
    }

    @Override
    public String toString() {
        return "Bandas: " + bandas + " | Status: " + status;
    }
}

public class Main {
    public static double custoTotalEvento(Evento e) {
        if (e.getStatus() == Status.Cancelado) return 0;
        double totalCaches = e.getBandas().stream().mapToDouble(Banda::getCache).sum();
        double taxaProducao = totalCaches * 0.20;
        return totalCaches + taxaProducao;
    }

    public static String bandaAbertura(Evento e) {
        if (e.getBandas().isEmpty()) return "Nenhuma banda abriu o evento.";
        return "Abertura: " + e.getBandas().get(0).getNomeBanda();
    }

    public static String bandaEncerramento(Evento e) {
        if (e.getBandas().isEmpty()) return "Nenhuma banda encerrou o evento.";
        List<Banda> lista = e.getBandas();
        return "Encerramento: " + lista.get(lista.size() - 1).getNomeBanda();
    }

    public static void main(String[] args) {
        Banda rock = new Banda("FireRock", "Rock", 5000);
        Banda pop = new Banda("StarPop", "Pop", 3000);
        Banda indie = new Banda("IndieVibes", "Indie", 2500);
        Banda metal = new Banda("SteelStorm", "Metal", 4500);

        Evento eventoAtivo = new Evento(Arrays.asList(rock, pop, indie), Status.Ativo);
        Evento eventoEncerrado = new Evento(Arrays.asList(indie, metal), Status.Encerrado);
        Evento eventoCancelado = new Evento(Arrays.asList(rock, metal), Status.Cancelado);

        System.out.println("======= EVENTOS — CASA DE SHOWS =======");

        System.out.println("\nEvento Ativo:");
        System.out.println(eventoAtivo);
        System.out.println(bandaAbertura(eventoAtivo));
        System.out.println(bandaEncerramento(eventoAtivo));
        System.out.println("Custo total: R$ " + custoTotalEvento(eventoAtivo));

        System.out.println("\nEvento Encerrado:");
        System.out.println(eventoEncerrado);
        System.out.println(bandaAbertura(eventoEncerrado));
        System.out.println(bandaEncerramento(eventoEncerrado));
        System.out.println("Custo total: R$ " + custoTotalEvento(eventoEncerrado));

        System.out.println("\nEvento Cancelado:");
        System.out.println(eventoCancelado);
        System.out.println(bandaAbertura(eventoCancelado));
        System.out.println(bandaEncerramento(eventoCancelado));
        System.out.println("Custo total: R$ " + custoTotalEvento(eventoCancelado));
    }
}

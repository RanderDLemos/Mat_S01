using System;

// 1. Crie a classe HabitanteDoReino.
public class HabitanteDoReino
{
    // 2. Defina atributos para o nome, a espécie e o cargo do habitante. (todos privados)
    private string identificacao;
    private string especie;
    private string cargo;

    // 3. Crie um Construtor que obrigue a inicialização desses três atributos ao criar um novo habitante.
    public HabitanteDoReino(string identificacao, string especie, string cargo)
    {
        this.identificacao = identificacao;
        this.especie = especie;
        this.cargo = cargo;
    }

    // 4. Crie um método ExibirDados() que imprima as informações completas do habitante.
    public void ExibirDados()
    {
        Console.WriteLine($"Nome: {identificacao}, Espécie: {especie}, Cargo: {cargo}");
    }
}

public class Aplicacao
{
    public static void Main(string[] args)
    {
        // 5. No main, crie as instâncias de Boromir (Humano, Guerreiro) e Thranduil (Elfo, Rei) usando o construtor
        HabitanteDoReino boromir = new HabitanteDoReino("Boromir", "Humano", "Guerreiro");
        HabitanteDoReino thranduil = new HabitanteDoReino("Thranduil", "Elfo", "Rei");

        // e chame o método ExibirDados() em ambos.
        boromir.ExibirDados();
        thranduil.ExibirDados();
    }
}

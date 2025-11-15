using System;

public class HabitanteDoReino
{
  
    private string identificacao;
    private string especie;
    private string cargo;

  
    public HabitanteDoReino(string identificacao, string especie, string cargo)
    {
        this.identificacao = identificacao;
        this.especie = especie;
        this.cargo = cargo;
    }
    
    public void ExibirDados()
    {
        Console.WriteLine($"Nome: {identificacao}, Espécie: {especie}, Cargo: {cargo}");
    }
}
public class Aplicacao
{
    public static void Main(string[] args)
    {
      
        HabitanteDoReino boromir = new HabitanteDoReino("Boromir", "Humano", "Guerreiro");
        HabitanteDoReino thranduil = new HabitanteDoReino("Thranduil", "Elfo", "Rei");

        boromir.ExibirDados();
        thranduil.ExibirDados();
    }
}

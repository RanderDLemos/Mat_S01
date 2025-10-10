using System;
using System.Collections.Generic;

public class Magia
{
    public string Titulo { get; set; }
    public string Descricao { get; set; }
}

public class Item
{
    public string Titulo { get; set; }
}

public class LivroDeEncantos
{
    private List<Magia> magias = new List<Magia>();

    public void InserirMagia(Magia magia)
    {
        magias.Add(magia);
        Console.WriteLine($"Magia '{magia.Titulo}' adicionada ao livro de encantos.");
    }
}

public class Feiticeira
{
    public string Identidade { get; }
    public LivroDeEncantos Livro { get; } = new LivroDeEncantos();
    public List<Item> Itens { get; }

    public Feiticeira(string identidade, List<Item> itens)
    {
        Identidade = identidade;
        Itens = itens;
    }
}

public class Aplicacao
{
    public static void Main(string[] args)
    {
        List<Item> equipamentosIniciais = new List<Item>
        {
            new Item { Titulo = "Pedra de Foco" },
            new Item { Titulo = "Adaga" },
            new Item { Titulo = "Tocha" }
        };

        Feiticeira lunara = new Feiticeira("Lunara", equipamentosIniciais);
      
        lunara.Livro.InserirMagia(new Magia { Titulo = "Chama Ardente", Descricao = "Invoca fogo para causar dano." });
        lunara.Livro.InserirMagia(new Magia { Titulo = "Luz Curativa", Descricao = "Recupera energia vital." });

        Console.WriteLine($"\nItens de {lunara.Identidade}:");
        foreach (var item in lunara.Itens)
        {
            Console.WriteLine($"- {item.Titulo}");
        }
    }
}

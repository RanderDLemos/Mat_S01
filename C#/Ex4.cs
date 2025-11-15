using System;

public abstract class CriaturaSombria
{
    public string Identificador { get; set; }

    public abstract void Deslocar();
}

public class Carnical : CriaturaSombria
{
    public override void Deslocar()
    {
        Console.WriteLine($"{Identificador} cambaleia lentamente pelas sombras...");
    }
}

public class Aparicao : CriaturaSombria
{
    public override void Deslocar()
    {
        Console.WriteLine($"{Identificador} atravessa as paredes em silêncio mortal!");
    }
}

public class Aplicacao
{
    public static void Main(string[] args)
    {
        CriaturaSombria[] legiao = new CriaturaSombria[]
        {
            new Carnical { Identificador = "Carniçal Faminto" },
            new Aparicao { Identificador = "Aparição do Vento" },
            new Carnical { Identificador = "Carniçal Errante" }
        };

        Console.WriteLine("A legião se aproxima!");
        foreach (var criatura in legiao)
        {
            criatura.Deslocar();
        }
    }
}

using System;
using System.Collections.Generic;

public class CriaturaElemental
{
    public string Identificador { get; set; }

    public virtual void Golpear()
    {
        Console.WriteLine($"{Identificador} realizou um golpe básico!");
    }
}

public class CriaturaDeLava : CriaturaElemental
{
   
    public override void Golpear()
    {
        Console.WriteLine($"{Identificador} lançou uma rajada de chamas!");
    }
}

public class CriaturaDoOceano : CriaturaElemental
{
   
    public override void Golpear()
    {
        Console.WriteLine($"{Identificador} disparou um jato de água!");
    }
}

public class Aplicacao
{
    public static void Main(string[] args)
    {
       
        List<CriaturaElemental> criaturas = new List<CriaturaElemental>();

      
        CriaturaDeLava ignar = new CriaturaDeLava { Identificador = "Ignar" };
        CriaturaDoOceano aquaris = new CriaturaDoOceano { Identificador = "Aquaris" };

        criaturas.Add(ignar);
        criaturas.Add(aquaris);

        foreach (var criatura in criaturas)
        {
            criatura.Golpear();
        }
    }
}

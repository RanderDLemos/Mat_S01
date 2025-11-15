use std::io;

fn verificar_se_eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    let mut entrada_escolha = String::new();
    let mut entrada_numero_jogador1 = String::new();
    let mut entrada_numero_jogador2 = String::new();

    // Jogador 1 escolhe "par" ou "ímpar"
    println!("Jogador 1, escolha 'par' ou 'ímpar':");
    io::stdin().read_line(&mut entrada_escolha).unwrap();
    let escolha_jogador1 = entrada_escolha.trim().to_lowercase();

    // Jogador 1 digita um número
    println!("Jogador 1, digite um número:");
    io::stdin().read_line(&mut entrada_numero_jogador1).unwrap();
    let numero_jogador1: i32 = entrada_numero_jogador1.trim().parse().unwrap();

    // Jogador 2 digita um número
    println!("Jogador 2, digite um número:");
    io::stdin().read_line(&mut entrada_numero_jogador2).unwrap();
    let numero_jogador2: i32 = entrada_numero_jogador2.trim().parse().unwrap();

    // Calcula a soma
    let soma_numeros = numero_jogador1 + numero_jogador2;
    println!("A soma dos números é: {}", soma_numeros);

    // Verifica se a soma é par
    let soma_eh_par = verificar_se_eh_par(soma_numeros);

    // Decide o vencedor
    if soma_eh_par && escolha_jogador1 == "par" {
        println!("Jogador 1 venceu!");
    } else if !soma_eh_par && escolha_jogador1 == "ímpar" {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}

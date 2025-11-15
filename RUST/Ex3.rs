use std::io;

// Função que imprime a tabuada
fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for multiplicador in limite_inferior..=limite_superior {
        let resultado_multiplicacao = numero * multiplicador;
        println!("{} x {} = {}", numero, multiplicador, resultado_multiplicacao);
    }
}

fn main() {
    let mut buffer_entrada = String::new();

    // Número da tabuada
    println!("Digite o número da tabuada:");
    buffer_entrada.clear();
    io::stdin().read_line(&mut buffer_entrada).unwrap();
    let numero_tabuada: i32 = buffer_entrada.trim().parse().unwrap();

    // Limite inferior
    println!("Digite o limite inferior:");
    buffer_entrada.clear();
    io::stdin().read_line(&mut buffer_entrada).unwrap();
    let inicio_intervalo: i32 = buffer_entrada.trim().parse().unwrap();

    // Limite superior
    println!("Digite o limite superior:");
    buffer_entrada.clear();
    io::stdin().read_line(&mut buffer_entrada).unwrap();
    let fim_intervalo: i32 = buffer_entrada.trim().parse().unwrap();

    // Chama a função
    imprimir_tabuada(numero_tabuada, inicio_intervalo, fim_intervalo);
}

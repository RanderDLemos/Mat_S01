use std::io;

fn verificar_senha(senha: &str) -> bool {
    
    if senha.len() < 8 {
        return false; // Tem pelo menos 8 caracteres
    }

    let mut possui_numero = false; // Verifica se tem pelo menos um número
    let mut possui_maiuscula = false; // Verifica se tem pelo menos uma letra maiúscula

    for caractere in senha.chars() {
        if caractere.is_ascii_digit() {
            possui_numero = true;
        }
        if caractere.is_ascii_uppercase() {
            possui_maiuscula = true;
        }
        
        // Otimização: sai do loop mais cedo se ambos critérios forem atendidos
        if possui_numero && possui_maiuscula {
            break;
        }
    }

    possui_numero && possui_maiuscula
}

fn main() {
    let mut entrada_senha = String::new();

    loop {
        println!("Digite uma senha:");

        entrada_senha.clear(); // Limpa o buffer antes de ler novamente
        io::stdin()
            .read_line(&mut entrada_senha)
            .expect("Erro ao ler a entrada");

        // Remove espaços em branco e quebras de linha
        let senha_digitada = entrada_senha.trim();

        if verificar_senha(senha_digitada) {
            println!("Senha válida! Acesso concedido.");
            break; // Sai do loop quando a senha é válida
        } else {
            println!("Senha inválida. Tente novamente.");
            println!("Requisitos: mínimo 8 caracteres, pelo menos 1 número e 1 letra maiúscula");
        }
    }
}

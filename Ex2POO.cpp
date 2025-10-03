#include <iostream>
#include <string>
using namespace std;

// Classe base
class Individuo {
private:
    string apelido;
    int anos;

public:
    Individuo(const string& nome, int idade) : apelido(nome), anos(idade) {}

    string obterNome() const {
        return apelido;
    }

    void alterarNome(const string& nome) {
        apelido = nome;
    }

    int obterIdade() const {
        return anos;
    }

    void alterarIdade(int idade) {
        if (idade >= 0) anos = idade;
    }
};

// Classe derivada: herói
class Heroi : public Individuo {
private:
    int experiencia;

public:
    Heroi(const string& nome, int idade, int xp) 
        : Individuo(nome, idade), experiencia(xp) {}

    int obterXP() const {
        return experiencia;
    }

    void alterarXP(int xp) {
        if (xp >= 0) experiencia = xp;
    }
};

// Classe derivada: aliado
class Companheiro : public Individuo {
private:
    int confianca; // de 0 a 10

public:
    Companheiro(const string& nome, int idade, int c) 
        : Individuo(nome, idade) {
        if (c < 0) c = 0;
        if (c > 10) c = 10;
        confianca = c;
    }

    int obterConfianca() const {
        return confianca;
    }

    void alterarConfianca(int c) {
        if (c >= 0 && c <= 10) confianca = c;
    }
};

int main() {
    Heroi protagonista("Akira", 16, 4);
    Companheiro parceiro("Yusuke", 18, 8);

    cout << ">>> Personagens registrados <<<" << endl;
    cout << "Herói: " << protagonista.obterNome()
         << " | Idade: " << protagonista.obterIdade()
         << " | Experiência: " << protagonista.obterXP() << endl;

    cout << "Companheiro: " << parceiro.obterNome()
         << " | Idade: " << parceiro.obterIdade()
         << " | Nível de confiança: " << parceiro.obterConfianca() << endl;

    return 0;
}

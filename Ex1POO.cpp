#include <iostream>
#include <string>
using namespace std;

class Lutador {
private:
    string apelido;
    int level;
    int poder;
    int hp;

public:
    // Construtor
    Lutador(const string& nome, int lv, int atk, int vida)
        : apelido(nome), level(lv), poder(atk), hp(vida) {}

    // Função para atacar outro lutador
    void golpear(Lutador& adversario) {
        cout << apelido << " deu um golpe em " << adversario.apelido
             << " causando " << poder << " de dano!" << endl;
        adversario.hp -= poder;
        if (adversario.hp < 0) adversario.hp = 0;
    }

    // Mostrar status do lutador
    void status() const {
        cout << "[ " << apelido 
             << " | Nivel: " << level
             << " | Ataque: " << poder
             << " | Vida: " << hp << " ]" << endl;
    }
};

int main() {
    Lutador heroi("Aragorn", 5, 20, 100);
    Lutador monstro("Goblin", 2, 10, 60);

    cout << ">>> Estado inicial <<<" << endl;
    heroi.status();
    monstro.status();

    cout << "\n>>> Batalha em andamento <<<" << endl;
    heroi.golpear(monstro);
    monstro.golpear(heroi);

    cout << "\n>>> Estado final <<<" << endl;
    heroi.status();
    monstro.status();

    return 0;
}

#include <iostream>
#include <string>
#include <vector>
using namespace std;

// Classe base
class Criatura {
protected:
    string nome;

public:
    Criatura(const string& n) : nome(n) {}

    virtual void introduzir() {
        cout << "Saudações, eu sou " << nome << " e pertenço ao reino das criaturas." << endl;
    }

    virtual ~Criatura() {}
};

// Subclasse Humanoide
class Humanoide : public Criatura {
public:
    Humanoide(const string& n) : Criatura(n) {}

    void introduzir() override {
        cout << "Olá, meu nome é " << nome << " e faço parte da espécie Humana." << endl;
    }
};

// Subclasse Élfico
class Elfico : public Criatura {
public:
    Elfico(const string& n) : Criatura(n) {}

    void introduzir() override {
        cout << "Ave, nomen mihi est " << nome 
             << " et sum Elficus silvarum." << endl;
        // (tradução: "Salve, meu nome é X e sou um Elfo das florestas")
    }
};

// Subclasse Encantada
class Encantada : public Criatura {
public:
    Encantada(const string& n) : Criatura(n) {}

    void introduzir() override {
        cout << "Beannachtaí draíochta! Mise " << nome 
             << ", bandraoi na coille." << endl;
        // (tradução: "Saudações mágicas! Eu sou X, uma fada da floresta.")
    }
};

int main() {
    vector<Criatura*> seres;

    Humanoide h("Leonardo");
    Elfico e("Thranduil");
    Encantada f("Morgana");

    seres.push_back(&h);
    seres.push_back(&e);
    seres.push_back(&f);

    cout << ">>> Apresentação das Criaturas <<<" << endl;
    for (Criatura* c : seres) {
        c->introduzir();
    }

    return 0;
}

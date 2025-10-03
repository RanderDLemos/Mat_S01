#include <iostream>
#include <string>
using namespace std;

// Classe base SerHumano
class SerHumano {
protected:
    string identificador;

public:
    SerHumano(const string& nome) : identificador(nome) {}

    virtual void introduzir() {
        cout << "Oi, eu sou " << identificador << " e faço parte da comunidade." << endl;
    }

    virtual ~SerHumano() {}
};

// Classe derivada Docente
class Docente : public SerHumano {
private:
    string materia;

public:
    Docente(const string& nome, const string& m) 
        : SerHumano(nome), materia(m) {}

    void introduzir() override {
        cout << "Oi, meu nome é " << identificador 
             << " e eu leciono a disciplina de " << materia << "." << endl;
    }
};

// Classe derivada Estudante
class Estudante : public SerHumano {
private:
    string formacao;

public:
    Estudante(const string& nome, const string& curso) 
        : SerHumano(nome), formacao(curso) {}

    void introduzir() override {
        cout << "Oi, meu nome é " << identificador 
             << " e eu curso " << formacao << "." << endl;
    }
};

int main() {
    Docente professor("Ana Paula", "Inteligência Artificial");
    Estudante universitario("Rafael", "Ciência da Computação");

    SerHumano* pessoa1 = &professor;
    SerHumano* pessoa2 = &universitario;

    cout << ">>> Apresentações <<<" << endl;
    pessoa1->introduzir();
    pessoa2->introduzir();

    return 0;
}

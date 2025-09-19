#include <iostream>
using namespace std;

int main() {
    int totalPontuacoes;
    float pontuacao, somatorio = 0;

    cout << "Numero de pontuacoes a serem inseridas: ";
    cin >> totalPontuacoes;

    for (int indice = 0; indice < totalPontuacoes; indice++) {
        cout << "Pontuacao " << indice + 1 << ": ";
        cin >> pontuacao;

        while (pontuacao < 0 || pontuacao > 10) {
            cout << "Pontuacao invalida! Digite entre 0 e 10: ";
            cin >> pontuacao;
        }

        somatorio += pontuacao;
    }

    float mediaCalculada = somatorio / totalPontuacoes;

    cout << "\nMedia final = " << mediaCalculada << endl;

    if (mediaCalculada >= 7.0) {
        cout << "Situacao academica: Aprovado" << endl;
    } else {
        cout << "Situacao academica: Reprovado" << endl;
    }

    return 0;
}

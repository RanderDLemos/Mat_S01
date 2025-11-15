#include <iostream>
using namespace std;

float calcularSomaVetorial(float lista[], int tamanho) {
    float total = 0;

    for (int contador = 0; contador < tamanho; contador++) {
        total += lista[contador];
    }

    return total;
}

int main() {
    int qtd;

    cout << "Informe o tamanho da lista: ";
    cin >> qtd;

    float valores[qtd];

    for (int pos = 0; pos < qtd; pos++) {
        cout << "Informe o valor " << pos + 1 << ": ";
        cin >> valores[pos];
    }

    cout << "Soma total dos valores: " << calcularSomaVetorial(valores, qtd);

    return 0;
}

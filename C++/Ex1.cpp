#include <iostream>
using namespace std;

int calcularFibonacci(int posicao) {
    if (posicao == 0) {
        return 0;
    } else if (posicao == 1) {
        return 1;
    } else {
        return calcularFibonacci(posicao - 1) + calcularFibonacci(posicao - 2);
    }
}

int main() {
    int valorEntrada;

    cout << "Informe um numero inteiro: ";
    cin >> valorEntrada;

    cout << "O " << valorEntrada << " termo da sequencia de Fibonacci e: " 
         << calcularFibonacci(valorEntrada) << endl;

    return 0;
}

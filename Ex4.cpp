#include <iostream>
using namespace std;

double transformarFahrenheit(double grausCelsius) {
    return (grausCelsius * 9.0 / 5.0) + 32.0;
}

double transformarKelvin(double grausCelsius) {
    return grausCelsius + 273.15;
}

int main() {
    int selecao;
    double entradaTemperatura;

    do {
        cout << "=== CONVERSOR DE TEMPERATURA ===\n";
        cout << "1. Celsius → Fahrenheit\n";
        cout << "2. Celsius → Kelvin\n";
        cout << "3. Terminar\n";
        cout << "Digite sua escolha: ";
        cin >> selecao;

        switch (selecao) {
            case 1:
                cout << "Valor em Celsius: ";
                cin >> entradaTemperatura;
                cout << "Convertido: " << transformarFahrenheit(entradaTemperatura) << " °F\n\n";
                break;

            case 2:
                cout << "Valor em Celsius: ";
                cin >> entradaTemperatura;
                cout << "Convertido: " << transformarKelvin(entradaTemperatura) << " K\n\n";
                break;

            case 3:
                cout << "Encerrando conversor...\n";
                break;

            default:
                cout << "Selecao invalida! Escolha 1, 2 ou 3.\n\n";
        }

    } while (selecao != 3);

    return 0;
}

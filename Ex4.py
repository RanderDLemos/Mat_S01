from abc import ABC, abstractmethod
from typing import List

class InterfaceCibernetica(ABC):
    @abstractmethod
    def hackear(self) -> None:
        """Executa o hack da entidade cibernética."""
        pass


class Chip:
    def __init__(self, preco: float, capacidade: str):
        self.preco = preco
        self.capacidade = capacidade

    def __str__(self):
        return f"Chip(capacidade='{self.capacidade}', preco={self.preco})"


class Hacker(InterfaceCibernetica):
    def __init__(self, codinome: str, chip: Chip):
        self.codinome = codinome
        # Composição
        self.chip = chip

    def hackear(self) -> None:
        print(f"{self.codinome} está invadindo sistemas com {self.chip.capacidade} "
              f"(custo {self.chip.preco}).")

    def __str__(self):
        return f"Hacker {self.codinome} utilizando {self.chip}"


class GrupoCibernetico:
    def __init__(self, integrantes: List[InterfaceCibernetica] | None = None):
        # Agregação
        self.integrantes = integrantes if integrantes is not None else []

    def adicionar_integrante(self, novo_membro: InterfaceCibernetica) -> None:
        self.integrantes.append(novo_membro)

    def acionar_hacks(self) -> None:
        print("Grupo Cibernético iniciando invasões!")
        for membro in self.integrantes:
            membro.hackear()

    def __str__(self):
        return f"Grupo com {len(self.integrantes)} hackers ativos"


if __name__ == "__main__":
    chip1 = Chip(1200.0, "Exploração de Firewalls")
    chip2 = Chip(2100.5, "Roubo de dados bancários")
    chip3 = Chip(980.0, "Controle remoto de câmeras")

    h1 = Hacker("Cipher", chip1)
    h2 = Hacker("Rogue", chip2)
    h3 = Hacker("Nova", chip3)

    grupo = GrupoCibernetico()
    grupo.adicionar_integrante(h1)
    grupo.adicionar_integrante(h2)
    grupo.adicionar_integrante(h3)

    print(grupo)
    grupo.acionar_hacks()

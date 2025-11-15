from abc import ABC, abstractmethod

class Campeao(ABC):
    def __init__(self, nome: str, classe: str):
        self.nome = nome
        self.classe = classe

    @abstractmethod
    def habilidade_suprema(self):
        pass


class Guardiao(Campeao):
    def __init__(self, nome: str):
        super().__init__(nome, "Guardião")

    def habilidade_suprema(self):
        print(f"{self.nome} ergue uma muralha protetora imbatível!")


class Atacante(Campeao):
    def __init__(self, nome: str):
        super().__init__(nome, "Atacante")

    def habilidade_suprema(self):
        print(f"{self.nome} dispara uma rajada devastadora de energia!")


if __name__ == "__main__":
    equipe = [
        Guardiao("Brutus"),
        Atacante("Fênix"),
        Guardiao("Titan"),
        Atacante("Sombra")
    ]

    for c in equipe:
        c.habilidade_suprema()

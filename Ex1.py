class Guerreiro:
    def __init__(self, energia: int, defesa: int):
        self._energia = energia
        self._defesa = defesa

    @property
    def energia(self):
        return self._energia

    @energia.setter
    def energia(self, valor):
        if valor < 0:
            print("A energia não pode ser menor que zero!")
        else:
            self._energia = valor

    def __str__(self):
        return f"Guerreiro com {self._energia} de energia e {self._defesa} de defesa."


class Paladino(Guerreiro):
    def __init__(self, energia: int, defesa: int, usa_armadura_pesada: bool):
        super().__init__(energia, defesa)
        self.usa_armadura_pesada = usa_armadura_pesada

    def __str__(self):
        tipo = "armadura pesada equipada" if self.usa_armadura_pesada else "sem armadura pesada"
        return f"Paladino {tipo}, energia {self._energia}, defesa {self._defesa}."


# Demonstração
if __name__ == "__main__":
    g = Guerreiro(90, 40)
    print(g)

    p = Paladino(160, 70, True)
    print(p)

    # Testando o setter
    p.energia = -15
    p.energia = 110
    print(p)

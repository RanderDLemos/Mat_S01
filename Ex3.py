class ArmaBranca:
    def __init__(self, descricao: str):
        self.descricao = descricao

    def __str__(self):
        return f"Arma corpo a corpo: {self.descricao}"


class MembroEquipe:
    def __init__(self, nome: str, equipamento: str):
        self.nome = nome
        self.equipamento = equipamento

    def __str__(self):
        return f"{self.nome} empunhando {self.equipamento}"


class Lider:
    def __init__(self, aliados: list[MembroEquipe]):
        # Composição
        self.arma = ArmaBranca("Punhal de aço")
        # Agregação
        self.aliados = aliados

    def exibir_grupo(self):
        print(f"O líder está portando uma {self.arma.descricao}.")
        print("Equipe aliada:")
        for aliado in self.aliados:
            print(f"- {aliado}")


if __name__ == "__main__":
    # Criação dos membros
    yusuke = MembroEquipe("Yusuke", "Katana")
    makoto = MembroEquipe("Makoto", "Luva Energizada")
    futaba = MembroEquipe("Futaba", "Laptop Hacker")

    grupo = [yusuke, makoto, futaba]
    joker = Lider(grupo)

    joker.exibir_grupo()

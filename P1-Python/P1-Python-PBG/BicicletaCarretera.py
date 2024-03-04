import copy

from Bicicleta import Bicicleta


class BicicletaCarretera(Bicicleta):
    def __init__(self,identificador):
        super().__init__("C"+str(identificador))

    def correr(self):
        print(f"Bicicleta de carretera (Id:{self.identificador}) corre")

    def terminar(self):
        print(f"Bicicleta de carretera (Id:{self.identificador}) termina")

    def clone(self):
        return copy.deepcopy(self)
from Bicicleta.Bicicleta import Bicicleta


class BicicletaMontana(Bicicleta):
    def __init__(self,identificador):
        super().__init__("M"+str(identificador))

    def correr(self):
        print(f"Bicicleta de montaña (Id:{self.identificador}) corre")

    def terminar(self):
        print(f"Bicicleta de montaña (Id:{self.identificador}) termina")
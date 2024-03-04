import random
import time

from Carrera import Carrera

class CarreraMontana(Carrera):
    def __init__(self):
        super().__init__()

    def iniciar(self):
        print("Iniciando carrera de Montaña")
        for bicicleta in self.bicicletas:
            bicicleta.correr()

        time.sleep(5)

        eliminadas = len(self.bicicletas) * 0.2

        for i in range(int(eliminadas)):
            eliminada = self.bicicletas[random.randint(0, len(self.bicicletas) - 1)]
            self.bicicletas.remove(eliminada)

        for bicicleta in self.bicicletas:
            bicicleta.terminar()
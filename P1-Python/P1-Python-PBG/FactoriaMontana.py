from FactoriaCarreraYBicicleta import FactoriaCarreraYBicicleta
import random

from BicicletaMontana import BicicletaMontana
from CarreraMontana import CarreraMontana


class FactoriaMontana(FactoriaCarreraYBicicleta):
    def crearCarrera(self, participantes):
        #Definir aqui la carrera
        #print("Creando carrera de Montaña")
        carrera = CarreraMontana()
        for i in range(participantes):
            carrera.bicicletas.append(self.crearBicicleta())
        return carrera


    def crearBicicleta(self):
        #Definir aqui la bicicleta
        #print("Creando bicicleta de Montaña")
        id = str(random.randint(0,1000)).zfill(4)
        return BicicletaMontana(id)
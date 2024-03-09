import random
from Factoria.FactoriaCarreraYBicicleta import FactoriaCarreraYBicicleta
from Bicicleta.BicicletaCarretera import BicicletaCarretera
from Carrera.CarreraCarretera import CarreraCarretera


class FactoriaCarretera(FactoriaCarreraYBicicleta):
    def crearCarrera(self, participantes):
        #Definir aqui la carrera
        #print('Creando carrera de Carretera')
        carrera = CarreraCarretera()

        for i in range(participantes):
            carrera.bicicletas.append(self.crearBicicleta())

        return carrera


    def crearBicicleta(self):
        #Definir aqui la bicicleta
        #print("Creando bicicleta de Carretera")
        id = str(random.randint(0,1000)).zfill(4)
        return BicicletaCarretera(id)
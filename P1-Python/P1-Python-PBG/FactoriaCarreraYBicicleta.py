from abc import ABC, abstractmethod

class FactoriaCarreraYBicicleta(ABC):
    @abstractmethod
    def crearCarrera(self, participantes):
        pass

    @abstractmethod
    def crearBicicleta(self):
        pass
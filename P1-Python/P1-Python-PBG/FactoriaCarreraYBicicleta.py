from abc import ABC, abstractmethod

class FactoriaCarreraYBicicleta(ABC):
    @abstractmethod
    def crearCarrera(self):
        pass


    @abstractmethod
    def crearBicicleta(self):
        pass
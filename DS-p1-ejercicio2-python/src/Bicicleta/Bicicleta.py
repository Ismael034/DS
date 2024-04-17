import copy
from abc import ABC, abstractmethod
from Prototype import Prototype

class Bicicleta(Prototype, ABC):

    def __init__(self, identificador):
        self.identificador = identificador

    @abstractmethod
    def correr(self):
        pass

    @abstractmethod
    def terminar(self):
        pass

    def clone(self):
        return copy.copy(self)

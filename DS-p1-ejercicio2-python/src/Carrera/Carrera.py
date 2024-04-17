from abc import ABC, abstractmethod

class Carrera(ABC):
    def __init__(self):
        self.bicicletas = []

    @abstractmethod
    def iniciar(self):
        pass
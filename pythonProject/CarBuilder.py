from abc import ABC, abstractmethod
from Car import Car

class CarBuilder(ABC):
    def __init__(self):
        self.car = None

    def create_new_car(self):
        self.car = Car()

    @abstractmethod
    def add_fuel_type(self):
        pass

    @abstractmethod
    def add_autonomia(self):
        pass

    @abstractmethod
    def add_coste_recarga(self):
        pass

    @abstractmethod
    def add_tiempo_recarga(self):
        pass
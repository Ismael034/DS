from CarBuilder import CarBuilder

class ClassicCarBuilder(CarBuilder):
    def add_fuel_type(self):
        self.car.fuel_type = "Gasolina"

    def add_autonomia(self):
        self.car.autonomia = "600 KM"

    def add_coste_recarga(self):
        self.car.coste_recarga = "2 eur"

    def add_tiempo_recarga(self):
        self.car.tiempo_recarga = "2 minutos"
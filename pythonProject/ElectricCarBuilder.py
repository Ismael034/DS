from CarBuilder import CarBuilder

class ElectricCarBuilder(CarBuilder):
    def add_fuel_type(self):
        self.car.fuel_type = "Electrico"

    def add_autonomia(self):
        self.car.autonomia = "300 KM"

    def add_coste_recarga(self):
        self.car.coste_recarga = "0,5 eur"

    def add_tiempo_recarga(self):
        self.car.tiempo_recarga = "4 horas"
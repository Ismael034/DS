class Director:
    def __init__(self, builder):
        self._builder = builder

    def builder_car(self):
        self._builder.create_new_car()
        self._builder.add_autonomia()
        self._builder.add_fuel_type()
        self._builder.add_coste_recarga()
        self._builder.add_tiempo_recarga()
class ElectricCarBuilder < CarBuilder
    def set_fuel_type
        @car.fuel_type = 'Electric'
    end

    def set_autonomy(capacity, consumption)
        @car.autonomy = capacity * consumption
    end

    def set_refuel_time(capacity)
        @car.refuel_time = capacity / 3
    end

    def set_refuel_cost(capacity)
        @car.refuel_cost = capacity * 0.1
    end

    def set_model(model)
        @car.model = model
    end

end
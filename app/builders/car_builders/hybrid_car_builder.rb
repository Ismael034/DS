class HybridCarBuilder < CarBuilder
    def set_fuel_type
        @car.fuel_type = 'Hybrid'
    end

    def set_autonomy(capacity, autonomy)
        @car.autonomy = (capacity * autonomy) + ((10 * (capacity * autonomy)) / 100)
    end

    def set_refuel_time(capacity)
        @car.refuel_time = capacity / 3
    end

    def set_refuel_cost(capacity)
        @car.refuel_cost = capacity * 1.2
    end

    def set_model(model)
        @car.model = model
    end
end
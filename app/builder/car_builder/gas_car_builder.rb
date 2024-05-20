class GasCarBuilder < CarBuilder
    def set_fuel_type
        @car.fuel_type = 'Gas'
    end
    
    def set_autonomy(capacity, consumption)
        @car.autonomy = capacity * consumption
    end
    
    def set_refuel_time(capacity)
        rails NotImplementedError, "Cannot set refuel time to gas car."
    end
    
    def set_refuel_cost(capacity)
        @car.refuel_cost = capacity * 1.2
    end
    
    def set_model(model)
        @car.model = model
    end
end

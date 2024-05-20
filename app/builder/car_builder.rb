# app/builders/car_builder.rb
class CarBuilder
    def initialize
      @car = Car.new
    end
  
    def get_result
      @car
    end
  
    def set_fuel_type
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  
    def set_autonomy(capacity, consumption)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  
    def set_refuel_time(capacity)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  
    def set_refuel_cost(capacity)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  
    def set_model(model)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
  
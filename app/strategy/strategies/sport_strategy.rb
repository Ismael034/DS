require_relative '../car_strategy'

class SportStrategy
  include CarStrategy

  def modify(car)
    car.model += " Sport"
    car.autonomy *= 0.8
    car.refuel_cost += 10
    car.is_modified = true
  end
end
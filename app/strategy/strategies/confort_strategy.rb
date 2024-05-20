require_relative '../car_strategy'

class ConfortStrategy
  include CarStrategy

  def modify(car)
    car.model += " Confort"
    car.autonomy *= 1.2
    car.refuel_cost += 0
    car.is_modified = true
  end
end
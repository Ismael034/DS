require_relative '../car_strategy'

class FamilyStrategy
  include CarStrategy

  def modify(car)
    car.model += " Family"
    car.autonomy *= 1.5
    car.refuel_cost *= 0.5
    car.is_modified = true
  end
end
require "test_helper"

class OwnershipTest < ActiveSupport::TestCase
  test "crear una nueva propiedad de coche con todos los atributos válidos" do
    user = User.create(name: "Usuario")
    car = user.cars.create(
      model: "Modelo",
      gas_type: "Gasolina",
      autonomy: 600,
      refuel_time: 10,
      refuel_cost: 50
    )
    ownership = Ownership.new(user: user, car: car)
    assert ownership.valid?
  end

  test "crear una nueva propiedad de coche sin usuario debería ser inválido" do
    car = Car.create(
      model: "Modelo",
      gas_type: "Gasolina",
      autonomy: 600,
      refuel_time: 10,
      refuel_cost: 50
    )
    ownership = Ownership.new(car: car)
    assert_not ownership.valid?
  end

  test "crear una nueva propiedad de coche sin coche debería ser inválido" do
    user = User.create(name: "Usuario")
    ownership = Ownership.new(user: user)
    assert_not ownership.valid?
  end
end

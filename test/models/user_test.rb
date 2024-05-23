require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "crear un nuevo usuario con nombre válido" do
    user = User.new(name: "Nombre de Usuario")
    assert user.valid?
  end

  test "no deja crear un nuevo usuario sin nombre" do
    user = User.new
    assert_not user.valid?
  end

  test "asociar un coche con un usuario" do
    user = User.create(name: "Usuario")
    car = Car.create(
      model: "Modelo",
      gas_type: "Gasolina",
      autonomy: 600,
      refuel_time: 10,
      refuel_cost: 50
    )
    user.cars << car
    assert user.cars.include?(car)
  end
end

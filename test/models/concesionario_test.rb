require "test_helper"

class ConcesionarioTest < ActiveSupport::TestCase
  test "crear un nuevo coche con todos los atributos válidos" do
    car = Car.new(
      model: "Modelo",
      gas_type: "Gasolina",
      autonomy: 600,
      refuel_time: 10,
      refuel_cost: 50
    )
    assert car.valid?
  end

  test "crear un nuevo coche sin modelo debería ser inválido" do
    car = Car.new(
      gas_type: "Gasolina",
      autonomy: 600,
      refuel_time: 10,
      refuel_cost: 50
    )
    assert_not car.valid?
  end

  test "crear un nuevo coche sin tipo de combustible debería ser inválido" do
    car = Car.new(
      model: "Modelo",
      autonomy: 600,
      refuel_time: 10,
      refuel_cost: 50
    )
    assert_not car.valid?
  end

  test "crear un nuevo coche sin autonomía debería ser inválido" do
    car = Car.new(
      model: "Modelo",
      gas_type: "Gasolina",
      refuel_time: 10,
      refuel_cost: 50
    )
    assert_not car.valid?
  end

  test "crear un nuevo coche sin tiempo de recarga debería ser inválido" do
    car = Car.new(
      model: "Modelo",
      gas_type: "Gasolina",
      autonomy: 600,
      refuel_cost: 50
    )
    assert_not car.valid?
  end

  test "crear un nuevo coche sin costo de recarga debería ser inválido" do
    car = Car.new(
      model: "Modelo",
      gas_type: "Gasolina",
      autonomy: 600,
      refuel_time: 10
    )
    assert_not car.valid?
  end
end

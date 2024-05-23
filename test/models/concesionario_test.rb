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

  test "no deja crear un nuevo coche sin modelo" do
    car = Car.new(
      gas_type: "Gasolina",
      autonomy: 600,
      refuel_time: 10,
      refuel_cost: 50
    )
    assert_not car.valid?
  end

  test "no deja crear un nuevo coche sin tipo de combustible" do
    car = Car.new(
      model: "Modelo",
      autonomy: 600,
      refuel_time: 10,
      refuel_cost: 50
    )
    assert_not car.valid?
  end

  test "no deja crear un nuevo coche sin autonomía" do
    car = Car.new(
      model: "Modelo",
      gas_type: "Gasolina",
      refuel_time: 10,
      refuel_cost: 50
    )
    assert_not car.valid?
  end

  test "no deja crear un nuevo coche sin tiempo de recarga" do
    car = Car.new(
      model: "Modelo",
      gas_type: "Gasolina",
      autonomy: 600,
      refuel_cost: 50
    )
    assert_not car.valid?
  end

  test "no deja crear un nuevo coche sin costo de recarga" do
    car = Car.new(
      model: "Modelo",
      gas_type: "Gasolina",
      autonomy: 600,
      refuel_time: 10
    )
    assert_not car.valid?
  end
end

require "test_helper"

class CarFacadeTest < ActiveSupport::TestCase
  setup do
    @facade = CarFacade.new
    @car_data = {
      model: 'Modelo',
      gas_type: 'Gasolina',
      autonomy: 100.0,
      refuel_cost: 10.0
    }
    @facade.build_car(@car_data)
    @car_data[:model] = 'Modelo2'
    @facade.build_car(@car_data)
  end

  test "modificación de coche" do
    car = @facade.get_cars.first
    autonomy = car.autonomy
    recharge_cost = car.refuel_cost

    @facade.modify_car(0, 0)

    assert @facade.get_cars.first.model.include?(" Sport")
    assert_equal autonomy * 0.8, @facade.get_cars.first.autonomy
    assert_equal recharge_cost + 10, @facade.get_cars.first.refuel_cost
    assert @facade.get_cars.first.modified
  end

  test "doble modificación de coche" do
    @facade.modify_car(0, 0)
    assert_raises(Exception) { @facade.modify_car(0, 0) }
  end

  test "eliminación de coche" do
    @facade.delete_car(0)
    assert_equal 1, @facade.get_cars.length
  end

  test "eliminación de coche inexistente" do
    assert_raises(Exception) { @facade.delete_car(2) }
  end

  test "filtrado de coches" do
    filtered_cars = @facade.filter_cars('Modelo2')
    assert_equal 1, filtered_cars.length
    assert_equal 'Modelo2', filtered_cars.first.model
  end

  test "ordenación de coches" do
    @facade.sort_cars(false)
    assert_equal 'Modelo2', @facade.get_cars.first.model
    @facade.sort_cars(true)
    assert_equal 'Modelo', @facade.get_cars.first.model
  end
end

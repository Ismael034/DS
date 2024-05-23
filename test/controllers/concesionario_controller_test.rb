require 'test_helper'

class ConcesionarioControllerTest < ActionDispatch::IntegrationTest
  test "crea el coche" do
    assert_difference('Car.count') do
      post cars_url, params: { car: { model: 'Test Model', gas_type: 'Test Gas Type', autonomy: 100, refuel_time: 10, refuel_cost: 50, is_modified: false, user_id: users(:one).id } }, as: :json
    end

    assert_response :success
  end

  test "muestra el coche" do
    get car_url(cars(:one)), as: :json
    assert_response :success
  end

  test "actualiza el coche" do
    patch car_url(cars(:one)), params: { car: { model: 'Updated Model' } }, as: :json
    assert_response :success
  end

  test "elimina coche" do
    assert_difference('Car.count', -1) do
      delete car_url(cars(:one)), as: :json
    end

    assert_response :success
  end

  test "muestra el coche del usuario" do
    get user_cars_url(users(:one)), as: :json
    assert_response :success
  end
end

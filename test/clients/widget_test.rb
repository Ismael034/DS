require "application_system_test_case"

class VehicleCreationTest < ApplicationSystemTestCase
  test "creación de vehículo" do
    visit root_path

    # Verificar que el título se muestra.
    assert_selector "h1", text: "Concesionario Tunning"

    click_on "Add vehicle"

    # Verificar que el diálogo de creación de vehículo se muestra.
    assert_selector "h2", text: "Compra tu coche"

    click_on "Cancelar"

    # Verificar que el diálogo de creación de vehículo se cierra.
    assert_no_selector "h2", text: "Compra tu coche"
  end
end

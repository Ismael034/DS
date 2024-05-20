class CarController < ApplicationController
  def create
    builder = case car_data['tipoCombustible']
              when 'Gasolina'
                BuilderGasolina.new
              when 'Hibrido'
                BuilderHibrido.new
              when 'Electrico'
                BuilderElectrico.new
              else
                message = "Wrong fuel type: #{car_data['tipoCombustible']}"
                raise Exception.new(message)
              end

    if car_data['capacidad'] < 0 || car_data['gastoKm'] < 0
      raise Exception.new('Incorrect model values')
    end

    director = Director.new(builder)
    director.construir(car_data['modelo'], car_data['capacidad'], car_data['gastoKm'])
    @cars << builder.get_resultado
  end

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  private

  def car_params
    params.require(:car).permit(:model, :gas_type, :capacity, :autonomy)
  end
end
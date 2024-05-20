require_relative '../builder/car_builder/gas_car_builder'
require_relative '../builder/car_builder/hybrid_car_builder'
require_relative '../builder/car_builder/electric_car_builder'

class CarController < ApplicationController
  def create
    builder = case car_params['gas_type']
              when 'Gas'
                GasCarBuilder.new
              when 'Hybrid'
                HybridCarBuilder.new
              when 'Electric'
                ElectricCarBuilder.new
              else
                message = "Wrong fuel type: #{car_params['gas_type']}"
                render json: { error: message }, status: :unprocessable_entity
                return
              end

    if car_params['capacity'] < 0 || car_params['autonomy'] < 0
      raise Exception.new('Incorrect model values')
    end

    director = Director.new(builder)
    director.construir(car_data['model'], car_data['capacity'], car_data['autonomy'])
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
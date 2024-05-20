class CarController < ApplicationController
  def create
    @car = Car.new(car_params)
    if @car.save
      logger.info "Car with id #{@car.id} created"
      render json: @car.id
    else
      render json: @car.errors, status: :unprocessable_entity
    end
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
    params.require(:car).permit(:model, :gas_type, :autonomy, :refuel_time, :refuel_cost, :is_modified)
  end
end
class CarController < ApplicationController
  def create
    @car = Car.new(car_params)
    if @car.save
      logger.info "Car with id #{@car.id} created"
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def index
    @cars = Car.all
    render json: @cars
  end

  def show
    @car = Car.find(params[:id])
    render json: @car
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    render json: @car
  end

  private

  def car_params
    params.require(:car).permit(:model, :gas_type, :autonomy, :refuel_time, :refuel_cost, :is_modified)
  end
end
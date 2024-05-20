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

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end
end
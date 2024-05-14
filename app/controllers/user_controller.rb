class UserController < ApplicationController
    def create 
        @user = User.new
        if @user.save
            logger.info "User with id #{@user.id} created"
            render json: @user.id
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def index
        @users = User.all
        render json: @users
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: @user
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end
end
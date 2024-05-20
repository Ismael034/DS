class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound do |exception|
        render json: { error: exception.message }, status: :not_found
    end
    rescue_from ActionController::ParameterMissing do |exception|
        render json: { error: exception.message }, status: :unprocessable_entity
    end
end

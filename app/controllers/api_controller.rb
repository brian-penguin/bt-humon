class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { errors: exception.message }, status: :bad_request
  end
end

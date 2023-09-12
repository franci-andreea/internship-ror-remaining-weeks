class Api::V1::BaseController < ActionController::API
  include ActiveStorage::SetCurrent
  include SessionsHelper

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = ::JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => exception
      render json: { errors: exception.message }, status: :unauthorized
    rescue JWT::DecodeError => exception
      render json: { errors: exception.message }, status: :unauthorized
    end
  end

  def has_role_admin?
    head :unauthorized unless @current_user.admin?
  end

  def has_role_user?
    head :unauthorized unless @current_user.user?
  end
end

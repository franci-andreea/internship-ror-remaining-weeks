class Api::V1::AuthenticationController < Api::V1::BaseController
  before_action :authorize_request, except: :login
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def login
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # login user and redirect to the user's show page
      token = JsonWebToken.encode(user_id: user.id)
      time = Time.now + 24.hours.to_i
      
      render json: {token: token, exp: time.strftime("%m-%d-%Y %H:%M"), email: user.email}, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private
    def login_params
      params.permit(:email, :password)
    end

    def parameter_missing(e)
      render json: { error: e.message }, status: :unprocessable_entity
    end

end

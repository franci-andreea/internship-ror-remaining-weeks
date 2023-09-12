class Api::V1::SessionsController < BaseController
  def new
    @login = true
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # login user and redirect to the user's show page
      reset_session
      login user
      remember user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      session[:session_token] = user.session_token
      
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'

      render 'new'
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_path
  end
end

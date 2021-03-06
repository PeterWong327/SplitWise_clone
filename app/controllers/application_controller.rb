class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token

  helper_method :current_user, :logged_in?

  def login(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      render json: { base: ['invalid credentials'] }, status: 401
    end
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

end

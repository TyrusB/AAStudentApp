module ApplicationHelper

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def current_user=(user)
    @current_user = user
  end

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token

    current_user = user
  end

  def logout_user!(user)
    user.reset_session_token!
    session[:session_token] = nil

    current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    current_user.is_admin
  end

end

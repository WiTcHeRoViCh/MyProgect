class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

  private

  def require_login
    redirect_to mains_path unless login?
  end	

  def login?
    redirect_to user_path(current_user) if current_user
  end	

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end	

  helper_method :current_user
end

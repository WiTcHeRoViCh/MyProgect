class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :login?, only: [:show, :edit]
  load_and_authorize_resource
  

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to main_app.root_path
  end

  private

  def login?
    redirect_to root_path unless current_user
  end

  def current_user
  	#session[:user_id] = nil
  		
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end

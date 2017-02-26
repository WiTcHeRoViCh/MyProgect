class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :login?, only: [:show, :edit]

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to main_app.root_path
  end

  private

  def login?
    redirect_to root_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user.admin? unless current_user.blank?
  end

  def authenticate_admin_user!
    if current_user
      redirect_to root_path, flash[:error] = 'Unauthorized.' unless current_admin?
    else
      flash[:error] = "You must authorizing!"
      redirect_to root_path
    end
  end

  helper_method :current_user, :current_admin?
end

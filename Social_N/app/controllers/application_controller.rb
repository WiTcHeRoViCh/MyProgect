class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :login?, only: [:show, :edit]

  private

  def login?
    redirect_to root_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end

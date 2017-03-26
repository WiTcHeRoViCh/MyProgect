class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to main_app.root_path, status: 403
  end

  private

  def login?
    
    unless current_user
      flash[:error] = "You must be authorizing!"
      redirect_to root_path, status: 403 
    end
      
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  def current_admin?
    current_user.admin? unless current_user.blank?
  end

  def authenticate_admin_user!
    if current_admin?

    else
      flash[:error] = "You don't have rights!"
      redirect_to root_path, status: 403
    end
  end

  def friendships_size
    @friendships_size = current_user.friendships.where(accepted:false).size unless current_user.blank?
  end 

  def invite_size
    @invite_size = current_user.invites.where(access: false).size unless current_user.blank?
  end 

  def sender (id_sender)
    User.find(id_sender)
  end 

  def check_on_friend?(friend_id)
    return true if current_user.friendships.find_by(friend_id: friend_id, accepted: true)
  end 

  helper_method :current_user, :current_admin?, :friendships_size, :sender, :invite_size, :check_on_friend?
end

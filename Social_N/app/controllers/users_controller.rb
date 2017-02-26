class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  	if current_user
      @users = User.all - [current_user]
    else
      @users = User.all
    end    
  end	
  
  def show
    @user = User.find(params[:id])
    @comments = Comment.where(commentable_id: @user.id)
    @comment = Comment.new

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def friend_params
    params.require(:friendship).permit(:user_id, :friend_id, :accepted)
  end  
end

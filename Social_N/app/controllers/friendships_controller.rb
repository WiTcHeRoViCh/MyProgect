class FriendshipsController < ApplicationController
  before_action :current_friendship, only: [:destroy]
  before_action :current_id, only: [:index, :new]
  load_and_authorize_resource only: :index
  
  def index
    @friendships = @user.friendships.where(accepted: false)
  end	

  def new
    if @friend = current_user.friendships.create(friend_id: @user.id)
      @user.invites.create(sender_id: current_user.id)
    	flash[:success] = "Request has been sent"
    else
      flash[:error]   = "Something going wrong"
    end

    redirect_to @user
  end	

  def destroy
    @invite.delete_all
    @friendship.delete
    redirect_back fallback_location: root_path
  end  

  private

  def current_friendship
    @friendship = current_user.friendships.find(params[:friendship_id])
    user = User.find(@friendship.friend_id)
    @invite = user.invites.where(user_id: user.id, sender_id: @friendship.user_id)
  end 

  def current_id
    @user = User.find(params[:user_id])
  end  

end	
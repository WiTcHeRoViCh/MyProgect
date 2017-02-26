class FriendshipsController < ApplicationController
  
  def index
    @friendships = current_user.friendships.where(accepted: false)
  end	

  def new
  	@user = User.find(params[:user_id])
    
    if @friend = current_user.friendships.create(friend_id: @user.id)
    	flash[:success] = "Request has been sent"
    else
      flash[:error]   = "Something going wrong"
    end

    redirect_to @user
  end	

end	
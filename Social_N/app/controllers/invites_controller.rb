class InvitesController < ApplicationController
  before_action :current_invite, only: [:update, :destroy]	
  before_action :invite_params, only: [:update]	

  def index
    @invite = current_user.invites.where(access: false)
  end	

  def update
    if @current_invite.update(invite_params) == true
      
      current_user.friendships.create(friend_id: @invite_sender.id, accepted: true)
      @invite_sender.friendships.where(friend_id: current_user.id).update(accepted: true)
      flash[:success] = 'You add #{@invite_sender.name} to friend list' if @current_invite.access == true
      redirect_to :back
    else	
      flash[:error] = "You don't add #{@invite_sender.name} to friend list" 
      redirect_to :back
    end    
  end

  def destroy
    @current_invite.delete
    @invite_sender.friendships.where(friend_id: current_user.id).delete_all
    current_user.friendships.where(friend_id: @invite_sender.id).delete_all if current_user.friendships.where(friend_id: @invite_sender.id)  

    redirect_to :back
  end	

  private
 
  def current_invite
    @current_invite = current_user.invites.find(params[:id])
    @invite_sender = User.find(@current_invite.sender_id)
  end 

  def invite_params
    params.require(:invite).permit(:access)
  end	

end

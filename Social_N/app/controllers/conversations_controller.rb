class ConversationsController < ApplicationController
  before_action :conversations, only: :index

  def index
  end  

  def show
    @conversation = Conversation.find(params[:id])
  end

  def create
		if Conversation.between(params[:conversation][:sender_id], params[:conversation][:recipient_id]).present?
    	@conversation = Conversation.between(params[:conversation][:sender_id], params[:conversation][:recipient_id]).first
  	else
  		@conversation = Conversation.create!(conversation_params)
 	  end

 	redirect_to conversations_path
  end

  private

  def conversations
    @conversations = Conversation.select {
      Conversation.where(sender_id: current_user.id) || Conversation.where(recipient_id: current_user.id) 
    }    
  end

  def conversation_params
    params.require(:conversation).permit(:sender_id, :recipient_id, :conversation)
  end	

  def room
    @room ||= Conversation.find(params[:id])
  end

  def messages
    @messages ||= room.messages.all
  end

  def message
    @message ||= Message.new
  end

  helper_method :room, :messages, :message

end	
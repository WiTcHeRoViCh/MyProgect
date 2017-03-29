class ConversationsController < ApplicationController

  def create
		if Conversation.between(params[:conversation][:sender_id], params[:conversation][:recipient_id]).present?
    	@conversation = Conversation.between(params[:conversation][:sender_id], params[:conversation][:recipient_id]).first
  	else
  		@conversation = Conversation.create!(conversation_params)
 	  end

 	redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.require(:conversation).permit(:sender_id, :recipient_id, :conversation)
  end	

end	
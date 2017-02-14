class CommentsController < ApplicationController 

  def create
    Comment.create(params_comment)
    redirect_back fallback_location: root_path
  end	

  def destroy
    Comment.find(params[:id]).delete
    redirect_back fallback_location: root_path
  end	

  private

  def params_comment
    params.require(:comment).permit(:user_id, :body, :commentable_type, :commentable_id, :sender)
  end	

end	
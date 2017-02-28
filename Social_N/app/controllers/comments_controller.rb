class CommentsController < ApplicationController 
  before_action :current_comment, only: [:update, :destroy]

  def create
    Comment.create(params_comment)
    redirect_back fallback_location: root_path
  end	

  def update
    @comment.update(params_comment)
    redirect_back fallback_location: root_path
  end

  def destroy
    @comment.delete
    redirect_back fallback_location: root_path
  end	

  private

  def current_comment
    @comment = Comment.find(params[:id])
  end  

  def params_comment
    params.require(:comment).permit(:user_id, :body, :commentable_type, :commentable_id, :sender)
  end	

end	
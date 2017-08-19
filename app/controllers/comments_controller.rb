class CommentsController < ApplicationController
  def new
  end

  def create 
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    unless @comment.save 
      flash[:error] = "#{@comment.errors.full_messages.to_sentence}"
    end 
    redirect_to posts_path
  end 

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end

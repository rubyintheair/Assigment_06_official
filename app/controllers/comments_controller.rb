class CommentsController < ApplicationController
  def new
  end

  def create 
    @comment = Comment.new(comment_params)
    if @comment.save
      if @comment.photo 
        flash[:success] = "Success in creating comment and uploading photo"
      else 
        flash[:success] = "Success in creating comment only"
      end  
    else
      flash[:error] = "#{@comment.errors.full_messages.to_sentence}"
    end 
    redirect_back fallback_location: root_path
  end 

  def destroy
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :photo)
  end
end

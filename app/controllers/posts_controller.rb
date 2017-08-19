class PostsController < ApplicationController
  def index
    @posts = Post.all.order("updated_at DESC")
  end

  def new
  end 

  def create
    @post = Post.new post_params
    @post.poster = current_user
    if @post.save
      flash[:success] = "Success in creating post"
    else
      flash[:error] = "#{@post.errors.full_messages.to_sentence}"
    end 
    redirect_to posts_path  
  end 

  def post_params
    params.require(:post).permit(:body)
  end 

end

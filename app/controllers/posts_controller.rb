class PostsController < ApplicationController
  def index
    # This is how you would show posts by current user and current user's friends, but this
    # is an advanced topic you will learn more about later. 
    # @posts = Post.where('poster_id in (?)', current_user.friends.collect(&:id) << current_user.id )
    @posts = Post.order("updated_at DESC").page(1).per(10)
  end

  def new
  end 

  def test 
    @posts = Post.all.order("updated_at DESC")
  end 

  def create
    @post = Post.new post_params
    @post.poster = current_user
    @post.wall_user ||= current_user
    if @post.save
      if @post.photo 
        flash[:success] = "Success in creating post and uploading photo"
      else 
        flash[:success] = "Success in creating post"
      end
      PostMailer.notify_new_post(@post).deliver  
    else
      flash[:error] = "#{@post.errors.full_messages.to_sentence}"
    end 
    redirect_back fallback_location: root_path
  end

  def destroy
    @post = Post.find(params[:monster_post].to_i)
    @post.destroy 
    redirect_back fallback_location: root_path
  end 

  def post_params
    params.require(:post).permit(:body, :wall_user_id, :photo)
  end 

end

class PostsController < ApplicationController
  before_action :require_login, only: [:create]
  def index
    # This is how you would show posts by current user and current user's friends, but this
    # is an advanced topic you will learn more about later. 
    # @posts = Post.where('poster_id in (?)', current_user.friends.collect(&:id) << current_user.id )
    params[:per] ||= 10 
    @posts = Post.order("updated_at DESC").page(params[:page]).per(params[:per])

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end 
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

  def show 
    @post = Post.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json
    end 
  end 

  def paging
    params[:per] ||= 10
    @posts = Post.order("updated_at DESC").page(params[:page]).per(params[:per])
    render partial: "post", collection: @posts, layout: false
  end 

  def post_params
    params.require(:post).permit(:body, :wall_user_id, :photo)
  end 

end

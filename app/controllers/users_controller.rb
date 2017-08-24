class UsersController < ApplicationController
  before_action :require_login, only: [:index]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "User created."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  def index
    
  end

  def profile
    @user = User.find(params[:id])
    @posts = @user.posts + Post.all.where(wall_user_id: @user.id)
    @posts.sort! { |b,a|  a.created_at <=> b.created_at }
    @posts.uniq!
  end

  def search
  @users = User.autocomplete(params[:q])
    respond_to do |format|
      format.html {render }
      format.json
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :gender, :password_confirmation, :avatar, :search)
  end
end

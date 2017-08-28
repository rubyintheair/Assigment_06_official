class HomeController < ApplicationController
  def index
    @posts = Post.order("updated_at DESC").page(params[:page]).per(params[:per])
  end
end

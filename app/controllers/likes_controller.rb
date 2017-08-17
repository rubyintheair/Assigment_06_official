class LikesController < ApplicationController
  before_action :authenticate_user!

  def toggle
    if params[:post_id]
      item = Post.find params[:post_id]
    end 

    current_user.toggle_like! (item)
  end 
end

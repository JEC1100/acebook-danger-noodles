class LikesController < ApplicationController

  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    Like.create(:post_id => params[:post_id], :user_id => current_user.id)
    redirect_to posts_url
  end

  def find_like
    @like = @post.likes.find(params[:id])
 end

 def destroy
    @like.destroy
    redirect_to posts_url
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end  
end

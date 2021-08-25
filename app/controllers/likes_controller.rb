class LikesController < ApplicationController

  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      Like.destroy(:post_id => params[:post_id], :user_id => current_user.id)
      # flash[:notice] = "You can't like more than once"
      redirect_to posts_url
    else
      Like.create(:post_id => params[:post_id], :user_id => current_user.id)
      redirect_to posts_url
    end
  end

  def find_like
    @like = @post.likes.find(params[:id])
 end

 def destroy
  if (already_liked?)
    @like.destroy
    redirect_to posts_url
  end
end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  # Like.create(:post_id => params[:post_id], :user_id => current_user.id)
  

  def already_liked?
  Like.where(user_id: current_user.id, post_id:params[:post_id]).exists?
  end


end

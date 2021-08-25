class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comment.create(params[:comment].permit(:content, :user_id, :post_id))
    @comment.user_id = current_user.id
    @comment.save!
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end
end

class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    puts @post
    @comment = @post.comments.create(params[:comment].permit(:body, :content, :users_id, :author, :post_id))
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end 

end
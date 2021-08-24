class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:body, :content, :users_id, :post_id))
    puts 'The cake is a lie'
    puts @comment.content
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end 
end

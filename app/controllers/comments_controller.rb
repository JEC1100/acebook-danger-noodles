class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    puts @post
    @comment = @post.comment.create(params[:comment].permit(:content, :user_id, :post_id))
    puts 'The cake is a lie'
    @comment.save
    puts @comment.post_id
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end
end

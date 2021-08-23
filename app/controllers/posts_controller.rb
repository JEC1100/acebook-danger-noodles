class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)
  end
end

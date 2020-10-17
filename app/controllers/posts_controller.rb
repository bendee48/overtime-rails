class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)

    if post.save
      flash.notice ="Post created."
      redirect_to post
    else
      flash.now.alert = "Something went wrong"
      render :new 
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale)
  end
end

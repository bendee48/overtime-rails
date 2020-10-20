class PostsController < ApplicationController
  before_action :get_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id

    if post.save
      flash.notice ="Post created."
      redirect_to post
    else
      flash.now.alert = "Something went wrong"
      render :new 
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash.notice = "Post successfully updated"
      redirect_to @post
    else
      flash.now.alert = "Something went wrong"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def get_post
    @post = Post.find(params[:id])
  end
end

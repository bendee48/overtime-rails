class PostsController < ApplicationController
  before_action :get_post, only: [:show, :edit, :update, :destroy, :approve]

  def index
    @posts = Post.all_posts_of(current_user).page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def approve
    authorize @post
    
    @post.approved!
    flash.notice = "Hours have been approved."
    redirect_to root_path
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash.notice = "Thanks. Your hours have been added."
      redirect_to @post
    else
      render :new 
    end
  end

  def show
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    
    if @post.update(post_params)
      flash.notice = "Your post has been updated."
      redirect_to @post
    else
      flash.now.alert = "Something went wrong"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash.alert = "Your post has been deleted."
      redirect_to posts_path
    else
      flash.now.alert = "Something went wrong"
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:date, :work_performed, :status, :daily_hours)
  end

  def get_post
    @post = Post.find(params[:id])
  end
end

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
    sweetalert('Hours have been approved.', 'Approved', timer: 3000, position: 'top-end', toast: true, icon: 'success', background: '#EEEEFF')
    redirect_to root_path
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      sweetalert('Your post has been added.', 'Post Created', timer: 3000, position: 'top-end', toast: true, icon: 'success', background: '#EEEEFF')
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
      sweetalert('Your post has been updated.', 'Post Updated', timer: 3000, position: 'top-end', toast: true, icon: 'success', background: '#EEEEFF')
      redirect_to @post
    else
      flash.now.alert = "Something went wrong"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      sweetalert('Your post has been deleted.', 'Post Deleted', timer: 3000, position: 'top-end', toast: true, icon: 'error', background: '#EEEEFF')
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

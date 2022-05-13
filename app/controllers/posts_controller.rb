class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy

    redirect_to posts_path, status: :see_other
  end

  private
    def post_params
      params.require(:post).permit(:title, :description,:image).merge(user_id: current_user.id)
    end
end

# frozen_string_literal: true

# This shiny device polishes bared foos
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_user_post, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save ? (redirect_to @post) : (render :new, status: :unprocessable_entity)
  end

  def edit; end

  def update
    @post.update(post_params) ? (redirect_to @post) : (render :edit, status: :unprocessable_entity)
  end

  def destroy
    @post.destroy
    redirect_to posts_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user_post
    authorize @post
  end
end

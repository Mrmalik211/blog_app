class CommentsController < ApplicationController
  before_action :set_post_comment, only: [:show, :edit, :update, :destroy]


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.save ? (redirect_to @post) : (render :new, status: :unprocessable_entity)
  end

  def show;end

  def edit;end

  def update
    @comment.update(comment_params) ? (redirect_to @post) : (render :edit, status: :unprocessable_entity)
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end

    def set_post_comment
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
    end

end

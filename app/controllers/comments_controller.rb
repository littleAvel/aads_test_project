class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save!
      redirect_to user_post_path(@post.user, @post)
    else
      flash[:alert] = "Comment could not be saved."
      redirect_to user_post_path(@post.user, @post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end

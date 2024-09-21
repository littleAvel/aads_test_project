class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_post, only: [ :show ]

  def index
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.where(parent_id: nil)
  end

  def new
    @post = @user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save!
      flash[:notice] = "Post was successfully created."
      redirect_to user_posts_path(current_user)
    else
      @posts = current_user.posts
      flash[:alert] = "There was an error creating the post."
      render :index
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [ :index ]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
  end

  def follow
    if current_user == @user
      flash[:alert] = "You cannot follow yourself."
    elsif current_user.followings.include?(@user)
      flash[:alert] = "You are already following this user."
    else
      current_user.active_connections.create(followed: @user)
      flash[:notice] = "Successfully followed the user."
    end

    redirect_to users_path
  end

  def unfollow
    if current_user == @user
      flash[:alert] = "You cannot unfollow yourself."
    elsif !current_user.followings.include?(@user)
      flash[:alert] = "You are not following this user."
    else
      connection = current_user.active_connections.find_by(followed: @user)
      connection.destroy! if connection
      flash[:notice] = "Successfully unfollowed the user."
    end

    redirect_to user_path(current_user)
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

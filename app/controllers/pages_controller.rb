class PagesController < ApplicationController
  def home
    if user_signed_in?
      @posts = Post.joins(user: :followers)
                   .where(connections: { follower_id: current_user.id })
                   .order(created_at: :desc)
    end
  end
end

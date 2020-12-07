class StaticPagesController < ApplicationController
  def home
    @posts = Post.order("created_at DESC").paginate(page: params[:page], per_page: 5)
    @users_most_active = User.joins(:likes).select('users.*, COUNT(likes.id) as likes_count').group('users.id').order('likes_count DESC')
    @posts_most_active = Post.joins(:likes).select('posts.*, COUNT(likes.id) as likes_count').group('posts.id').order('likes_count DESC')
  end
end

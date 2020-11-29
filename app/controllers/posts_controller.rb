class PostsController < ApplicationController
  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments
    @new_comment = Comment.new({user_id: current_user&.id, post_id: @post.id})
  end
  def post_params
		params.require(:post).permit(:content, :typing, :image)
	end
end

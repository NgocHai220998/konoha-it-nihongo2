class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :destroy]
	
	def new
		@post = Post.new
		@options_typing = @post.get_option_typing
	end
	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = t("controllers.posts.create_success")
			redirect_to root_url
		else
			@options_typing = @post.get_option_typing
			render "new"
		end
	end
	
	def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments
    @likes = @post.likes
    @like = Like.find_by({user_id: current_user&.id, post_id: @post.id})
    @like ||= Like.new({user_id: current_user&.id, post_id: @post.id})
    @new_comment = Comment.new({user_id: current_user&.id, post_id: @post.id})
	end
	
	private
	
	def post_params
		postparam = params.require(:post).permit(:typing, :content, :image)
		postparam['typing'] = postparam['typing'].to_i
		return postparam
	end
end

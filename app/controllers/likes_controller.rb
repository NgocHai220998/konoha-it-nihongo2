class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.save
    @likes = Post.find_by(id: like_params[:post_id]).likes
    respond_to do |format|
      format.html { redirect_to @like.post }
      format.js
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @like.destroy
    @likes = Post.find_by(id: @like.post_id).likes
    respond_to do |format|
      format.html { redirect_to @like.post }
      format.js
    end
  end

  def like_params
		params.require(:like).permit(:user_id, :post_id)
  end
  
end

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    respond_to do |format|
      format.html { redirect_to @comment.post }
      format.js
    end
  end

  def update
  end

  def destroy
  end

  def comment_params
		params.require(:comment).permit(:content, :user_id, :post_id)
	end
end

class CommentsController < ApplicationController

  before_action :ensure_login!

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id ||= params[:post_id]

    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(@comment.post)
    end

  end

  def show
    @comment = Comment.find(params[:id])
    # @comment.post_id = params[:post_id]
  end

  def comment_params
    params.require(:comment).permit(:content, :parent_comment_id, :post_id)
  end
end

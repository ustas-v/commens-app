class CommentsController < ApplicationController
  ## Modules, constants
  ## Helpers
  ## Before, after and other filters
  ## Loading and authorize resource(s)
  ## Decorate resource(s)
  ## Responders

  ## Actions

  def create
    @comment = current_user.comments.create(comment_params)
    @comment_hash = (@comment.parent.presence || @comment).hash_tree
  end

  def reply
    @reply_comment = Comment.new parent_id: params[:id]
  end

  ## Protected methods
  ## Callbacks before, after, other filters and etc
  protected

  ## Private methods
  ## Callbacks before, after, other filters and etc
  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end

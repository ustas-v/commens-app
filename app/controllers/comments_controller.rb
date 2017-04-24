class CommentsController < ApplicationController
  ## Modules, constants
  ## Helpers
  ## Before, after and other filters

  before_action :find_comment, only: [:edit, :update]

  ## Loading and authorize resource(s)
  ## Decorate resource(s)
  ## Responders

  ## Actions

  def edit; end

  def create
    @comment_source = current_user.comments.create(comment_params)
    @comment_hash = (@comment_source.parent.presence || @comment_source).hash_tree
  end

  def update
    @comment_source.update comment_params
    @comment_hash = @comment_source.hash_tree
  end

  def reply
    @comment_source = Comment.new parent_id: params[:id]
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

  def find_comment
    @comment_source = Comment.find params[:id]
  end
end

class MainController < ApplicationController
  ## Modules, constants
  ## Helpers
  ## Before, after and other filters

  before_action :find_comments, only: [:index]

  ## Loading and authorize resource(s)
  ## Decorate resource(s)
  ## Responders

  ## Actions

  def index; end

  ## Protected methods
  ## Callbacks before, after, other filters and etc
  protected

  ## Private methods
  ## Callbacks before, after, other filters and etc
  private

  def find_comments
    # All comments without pagination - for tests
    @comments = Comment.includes(:user).hash_tree
  end
end

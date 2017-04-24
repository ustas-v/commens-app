class UsersController < ApplicationController
  ## Modules, constants
  ## Helpers
  ## Before, after and other filters

  before_action :find_users, only: [:index]

  ## Loading and authorize resource(s)
  ## Decorate resource(s)
  ## Responders

  ## Actions

  ## Protected methods
  ## Callbacks before, after, other filters and etc
  protected

  ## Private methods
  ## Callbacks before, after, other filters and etc
  private

  def find_users
    @users = User.all
  end
end

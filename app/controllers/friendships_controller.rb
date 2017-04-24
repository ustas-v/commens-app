class FriendshipsController < ApplicationController
  ## Modules, constants
  ## Helpers
  ## Before, after and other filters

  before_action :find_user, only: [:create, :destroy]

  ## Loading and authorize resource(s)
  ## Decorate resource(s)
  ## Responders

  ## Actions

  def create
    current_user.friendships.friend_request!(
      @user
    ) unless current_user.friend_with?(@user)
  end

  def destroy
    puts "!!!!!!!!!@user: #{@user}"
    current_user.friendships.delete_friend!(@user)
  end

  ## Protected methods
  ## Callbacks before, after, other filters and etc
  protected

  ## Private methods
  ## Callbacks before, after, other filters and etc
  private

  def find_user
    @user = User.find params[:id]
  end
end

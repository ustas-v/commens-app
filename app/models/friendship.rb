class Friendship < ApplicationRecord
  ## Modules, constants, attr_*
  ## Associations, delegates

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  ## Validations

  validates :user, :friend, presence: true

  ## Callbacks
  ## Scopes

  scope :accepted, -> { where accepted: true }
  scope :pending,  -> { where accepted: false }

  scope :by_user,   -> (ids) { where user_id: ids }
  scope :by_friend, -> (ids) { where friend_id: ids }

  ## Other meta methods

  # This method using by user.friendships.friend_request!
  def self.friend_request!(user)
    return if self.new.user_id == user.id

    transaction do
      # For tests automatically accepted
      # For me
      create(
        user_id: self.new.user_id, friend_id: user.id, accepted: true
      )
      # For friend
      create(
        user_id: user.id, friend_id: self.new.user_id, accepted: true
      )
    end
  end

  def self.delete_friend!(user)
    by_friend(user.id).destroy_all
  end

  def accept_friend_request!(user)
  end

  ## Protected methods
  ## Callbacks and etc.
  protected

  ## Private methods
  ## Callbacks and etc.
  private
end

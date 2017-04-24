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

  ## Other meta methods

  def self.friend_request!(user)
    create!(
      user_id: self.new.user_id, friend_id: user.id
    ) if self.new.user_id != user.id
  end

  def self.accept_friend_request!(user)

  end

  ## Protected methods
  ## Callbacks and etc.
  protected

  ## Private methods
  ## Callbacks and etc.
  private
end

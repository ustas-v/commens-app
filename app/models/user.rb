class User < ApplicationRecord
  ## Modules, constants, attr_*

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  ## Associations, delegates

  has_many :oauths, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :accepted_friendships, -> { accepted },
           class_name: 'Friendship'
  has_many :pending_friendships,  -> { pending },
           class_name: 'Friendship'
  has_many :friends, through: :accepted_friendships
  has_many :pending_friends, through: :pending_friendships, source: :friend

  has_many :comments

  ## Validations

  validates :login, presence: true, uniqueness: true

  ## Callbacks
  ## Scopes
  ## Other meta methods

  def friend_with?(user)
    accepted_friendships.by_user([id, user.id]).
      by_friend([id, user.id]).present?
  end

  ## Protected methods
  ## Callbacks and etc.
  protected

  ## Private methods
  ## Callbacks and etc.
  private
end

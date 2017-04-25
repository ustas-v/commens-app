class Oauth < ApplicationRecord
  ## Modules, constants, attr_*

  TYPES = {
    facebook: 'facebook'
  }

  ## Associations, delegates

  belongs_to :user

  ## Validations

  validates :user, :provider, :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }

  ## Callbacks
  ## Scopes
  ## Other meta methods

  def self.find_for_oauth(auth)
    find_or_create_by uid: auth.uid, provider: auth.provider
  end

  ## Protected methods
  ## Callbacks and etc.
  protected

  ## Private methods
  ## Callbacks and etc.
  private
end

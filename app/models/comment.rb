class Comment < ApplicationRecord
  ## Modules, constants, attr_*

  acts_as_tree order: 'created_at DESC'

  ## Associations, delegates

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  ## Validations

  validates :user, :body, presence: true

  ## Callbacks
  ## Scopes
  ## Other meta methods

  ## Protected methods
  ## Callbacks and etc.
  protected

  ## Private methods
  ## Callbacks and etc.
  private
end

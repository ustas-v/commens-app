class Ability
  ## Modules, constants, attr_*

  include CanCan::Ability

  REQUIRED_ABILITIES = %w(
    Base Comments
  )

  ## Other meta methods

  def initialize(user)
    # Anonymous users don't have access to anything
    return if user.nil?

    load_abilities user
  end

  ## Protected methods
  protected

  ## Private methods
  private

  def load_abilities(user)
    REQUIRED_ABILITIES.each do |ability|
      self.merge "Abilities::#{ability}".constantize.new(user)
    end
  end
end
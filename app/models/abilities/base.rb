class Abilities::Base
  include CanCan::Ability

  def initialize(user)
    can :see, :panel
    can :see, :comments
    can :see, :friends
  end
end
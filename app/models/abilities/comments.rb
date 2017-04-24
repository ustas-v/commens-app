class Abilities::Comments
  include CanCan::Ability

  def initialize(user)
    can :update, Comment, user_id: user.id
  end
end
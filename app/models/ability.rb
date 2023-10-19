class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :destroy, Recipe, user_id: user.id

    can :destroy, Food, user_id: user.id
    can :update, Recipe, user_id: user.id
  end
end

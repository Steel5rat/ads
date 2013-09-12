class Ability
  include CanCan::Ability

  def initialize(user)
	user ||= User.new # guest user (not logged in)
    if user.role == 2
      can :manage, :all
    end
  end
end

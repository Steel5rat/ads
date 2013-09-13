class Ability
  include CanCan::Ability

  def initialize(user)
	user ||= User.new :role => 0 # guest user (not logged in)
    if user.role == 2
      can :manage, :all
    end
    
    if user.role == 1
      can :read, AdsType
      can :read, User
      can :update, Ad, :user_id => user.id, :state_name => :draft
      can :delete, Ad, :user_id => user.id
      can :create, Ad
      can :myads, Ad
    end
    can :read, Ad
  end
end

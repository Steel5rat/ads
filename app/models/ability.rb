class Ability
  include CanCan::Ability

  def initialize(user)
	user ||= User.new :role => 0 # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
      cannot [:create,:update,:update_state], Ad      
      cannot :delete, Ad, :state_name => :draft #TODO: add read      
      cannot :manage, Image
      cannot :create, User
      can :read, Image
      can :update_state, Ad, :state_name => :new
    end
    
    if user.role == 'user'
      can :read, User
      can [:update,:update_state], Ad, :user_id => user.id, :state_name => :draft
      can :update_state, Ad, :user_id => user.id, :state_name => [:denied, :archived]
      can [:read,:delete], Ad, :user_id => user.id      
      can :create, Image
      can :manage, Image.of_user(user)
	  can :update, User, :id => user.id
      can [:create,:myads], Ad      
    end
    
    can :read, Ad, :state_name => [:published,:draft] #TODO: remove draft!
    can :read, AdsType    
  end
end

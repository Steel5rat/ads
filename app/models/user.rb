class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  extend Enumerize
  
  has_many :ads, :dependent => :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :id
  attr_accessible :name
  attr_accessible :role
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  enumerize :role, in: [:user, :admin], :default => :user
  
  after_initialize :default_values
  before_destroy :check_last_admin
  
  def check_last_admin
    #logger.debug("admins count: #{User.where(:role => :admin).count}")
    if role.admin?
		if User.where(:role => :admin).count == 1
			errors.add :base, "Cannot delete last admin"
			return false
		end
	end
	true
  end 
  
  
private
  def default_values
    self.role ||= 1
  end
end

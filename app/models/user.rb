class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  extend Enumerize
  
  has_many :ads
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :id
  attr_accessible :name
  attr_accessible :role
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  after_initialize :default_values
  #validates :role,  :format => { :with => /[1,2]/, :message => "only allows digits 1 or 2" }
  enumerize :role, in: [:user, :admin], :default => :user
  
private
  def default_values
    self.role ||= 1
  end
end

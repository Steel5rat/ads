class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :ads
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :id
  attr_accessible :name, :password
  attr_accessible :role
  validates_presence_of :name, :password
  validates_uniqueness_of :name, :email, :case_sensitive => false
  after_initialize :default_values
  validates :role,  :format => { :with => /[12]/, :message => "only allows digits 1 or 2" }
  
private
  def default_values
    self.role ||= 1
  end
end

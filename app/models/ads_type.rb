class AdsType < ActiveRecord::Base
  attr_accessible :name, :id
  validates :name, :uniqueness => true
  has_many :ads, :dependent => :restrict
end

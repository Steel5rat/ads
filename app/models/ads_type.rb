class AdsType < ActiveRecord::Base
  attr_accessible :name
  has_many :ads, :dependent => :restrict
end

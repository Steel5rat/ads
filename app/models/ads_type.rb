class AdsType < ActiveRecord::Base
  attr_accessible :name, :id, :ads
  validates :name, :uniqueness => true
  has_many :ads, :dependent => :restrict
  before_destroy :check_ads_count, :check_last_type
  
  def check_ads_count
	ads.count == 0
  end
  
  def check_last_type
	AdsType.count > 1
  end
end

class Image < ActiveRecord::Base
  attr_accessible :title, :picture, :ad_id, :id
  has_attached_file :picture, :default_url => "/images/missing.png"
  belongs_to :ad
end

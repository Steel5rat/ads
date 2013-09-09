class Ad < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  validates :status,  :format => { :with => /[1-6]/, :message => "only allows digits (1-6)" }
  validates :ads_type_id, :presence => true
  attr_accessible :description, :name, :status, :id, :ads_type_id, :updated_at

end

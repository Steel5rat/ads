class Image < ActiveRecord::Base
  attr_accessible :title, :picture, :ad_id, :id
  has_attached_file :picture, :presence => true 
  belongs_to :ad  
  
  def self.of_user user
    Ad.with_states(:draft).where(:user_id => user.id).map do |ad|
		where(:ad_id => ad.id)
	end
  end
end

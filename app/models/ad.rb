class Ad < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  belongs_to :user
  validates :ads_type_id, :user_id, :presence => true
  attr_accessible :description, :name, :id, :ads_type_id, :updated_at, :user_id, :state, :images
  
  state_machine :initial => :draft do
    state :draft, :value => 1
    state :new, :value => 2
    state :denied, :value => 3
    state :approved, :value => 4
    state :published, :value => 5
    state :archived, :value => 6
    
    event :to_draft do
      transition [:denied, :archived] => :draft
    end
    
    event :to_new do
      transition :draft => :new
    end
    
    event :deny do
      transition :new => :denied
    end
    
    event :approve do
      transition :new => :approved
    end
    
    event :publish do
      transition :approved => :published
    end
    
    event :archive do 
      transition :published => :archived
	end
    
  end
end

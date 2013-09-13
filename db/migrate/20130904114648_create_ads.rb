class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.text :description
      t.string :name
      t.integer :status
      t.integer :state
      #t.index :state
      t.belongs_to :ads_type, :null =>false
      t.belongs_to :user, :null =>false
      t.timestamps
    end
  end
end

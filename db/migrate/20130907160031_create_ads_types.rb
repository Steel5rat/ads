class CreateAdsTypes < ActiveRecord::Migration
  def change
    create_table :ads_types do |t|
      t.string :name

      t.timestamps
    end
    
  end
  #AdsTypes.create (:name => 'default')
end

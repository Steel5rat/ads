class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.belongs_to :ad, :null =>false

      t.timestamps
    end
  end
end

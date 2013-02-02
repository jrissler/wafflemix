class CreateWafflemixImages < ActiveRecord::Migration
  def change
    create_table :wafflemix_images do |t|
      t.integer :asset_id
      t.string :imageable_type
      t.string :imageable_id

      t.timestamps
    end
  end
end

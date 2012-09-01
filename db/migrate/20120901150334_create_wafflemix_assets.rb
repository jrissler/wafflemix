class CreateWafflemixAssets < ActiveRecord::Migration
  def change
    create_table :wafflemix_assets do |t|
      t.string :asset_uid
      t.string :asset_mime_type
      t.integer :asset_file_size

      t.timestamps
    end
  end
end

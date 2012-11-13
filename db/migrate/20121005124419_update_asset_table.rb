class UpdateAssetTable < ActiveRecord::Migration
  def change
    remove_column :wafflemix_assets, :asset_uid
    remove_column :wafflemix_assets, :asset_file_size
    remove_column :wafflemix_assets, :asset_mime_type

    add_column :wafflemix_assets, :assetable_type, :string
    add_column :wafflemix_assets, :assetable_id, :integer
  end
end

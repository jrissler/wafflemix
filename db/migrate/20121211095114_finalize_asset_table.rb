class FinalizeAssetTable < ActiveRecord::Migration
  def change
    add_column :wafflemix_assets, :asset_name, :string
    add_column :wafflemix_assets, :asset_mime_type, :string
    add_column :wafflemix_assets, :asset_uid, :string
    add_column :wafflemix_assets, :asset_size, :integer

    remove_column :wafflemix_assets, :assetable_type, :string
    remove_column :wafflemix_assets, :assetable_id, :integer
  end
end

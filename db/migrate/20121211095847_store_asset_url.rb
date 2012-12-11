class StoreAssetUrl < ActiveRecord::Migration
  def change
    add_column :wafflemix_assets, :asset_origin, :string, :limit => 500
  end
end

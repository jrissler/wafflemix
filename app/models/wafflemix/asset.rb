module Wafflemix
  class Asset < ActiveRecord::Base
    image_accessor :asset

    attr_accessible :asset_name, :asset_mime_type, :asset_uid, :asset_size, :asset_origin

    after_create :store_image_info

    private
      def store_image_info
        if self.asset_origin
          app = Dragonfly[:images]
          remote_asset = app.fetch_url(self.asset_origin)
          self.asset = remote_asset
          self.asset_mime_type = remote_asset.mime_type
          self.asset_size = remote_asset.size
          self.save
        end
      end
  end
end

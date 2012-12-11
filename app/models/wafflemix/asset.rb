module Wafflemix
  class Asset < ActiveRecord::Base
    image_accessor :asset

    attr_accessible :asset_name, :asset_mime_type, :asset_uid, :asset_size, :asset_origin

    after_create :store_image_info

    private
      def store_image_info
        if self.asset_origin
          self.asset_mime_type = self.asset.mime_type
          self.asset_size = self.asset.size
          self.save
        end
      end
  end
end

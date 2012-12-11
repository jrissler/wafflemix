module Wafflemix
  class Asset < ActiveRecord::Base

    image_accessor :asset

    attr_accessible :asset_name, :asset_mime_type, :asset_uid, :asset_size, :asset_origin, :asset

    attr_accessor :path

    #one convenient method to pass jq_upload the necessary information
    def to_jq_upload
      {
        "name" => read_attribute(:asset_name),
        "size" => asset_size,
        "url" => asset_url,
        "thumbnail_url" => asset.url,
        "delete_url" => Wafflemix::Engine::routes.url_helpers.root_path,
        "delete_type" => "DELETE"
      }
    end
  end
end

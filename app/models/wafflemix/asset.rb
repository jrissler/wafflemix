module Wafflemix
  class Asset < ActiveRecord::Base
    image_accessor :asset

    attr_accessible :asset_name, :asset_mime_type, :asset_uid, :asset_size
  end
end

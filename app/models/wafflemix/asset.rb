module Wafflemix
  class Asset < ActiveRecord::Base
    image_accessor :asset

    attr_accessible :asset_file_size, :asset_mime_type, :asset_uid
  end
end

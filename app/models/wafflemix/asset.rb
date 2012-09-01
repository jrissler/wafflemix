module Wafflemix
  class Asset < ActiveRecord::Base
    attr_accessible :asset_file_size, :asset_mime_type, :asset_uid
  end
end

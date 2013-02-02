module Wafflemix
  class Slide < ActiveRecord::Base
    attr_accessible :name, :position, :parent_id

    validates_presence_of :name

    has_ancestry

    has_many :asset_images, :as => :imageable
    has_many :images, :through => :asset_images
  end
end

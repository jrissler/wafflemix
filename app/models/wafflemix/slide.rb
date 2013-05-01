module Wafflemix
  class Slide < ActiveRecord::Base
    default_scope  :order => 'position ASC'

    attr_accessible :name, :position, :parent_id, :slide_link, :content

    validates_presence_of :name

    has_ancestry

    has_many :images, :as => :imageable
    has_many :assets, :through => :images
  end
end

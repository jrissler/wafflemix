module Wafflemix
  class Portfolio < ActiveRecord::Base
    attr_accessible :content, :intro, :title

    validates_presence_of :content, :intro, :title
    validates_uniqueness_of :title

    has_ancestry

    has_many :images, :as => :imageable
    has_many :assets, :through => :images
  end
end

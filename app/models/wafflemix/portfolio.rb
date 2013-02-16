module Wafflemix
  class Portfolio < ActiveRecord::Base
    attr_accessible :content, :intro, :title, :meta_content_attributes

    validates_presence_of :content, :intro, :title
    validates_uniqueness_of :title

    has_ancestry

    has_many :images, :as => :imageable
    has_many :assets, :through => :images
    has_one :meta_content, :as => :metable, :class_name => 'Wafflemix::MetaContent'

    accepts_nested_attributes_for :meta_content
  end
end

module Wafflemix
  class Page < ActiveRecord::Base
    attr_accessible :deletable, :draft, :link_url, :parent_id, :position, :show_in_menu, :skip_to_first, :title, :translations_attributes, :locale, :content_parts_attributes

    has_many :content_parts, :as => :contentable, :class_name => 'Wafflemix::ContentSection'
    accepts_nested_attributes_for :content_parts

    default_scope  :order => 'position ASC'
    scope :active, where(:draft => false, :show_in_menu => true)

    has_ancestry

    translates :title

    class Translation
      attr_accessible :title, :locale
    end

    def to_param
      "#{link_url}"
    end
  end
end

module Wafflemix
  class Page < ActiveRecord::Base
    attr_accessible :deletable, :draft, :link_url, :parent_id, :position, :show_in_menu, :skip_to_first, :title, :body, :translations_attributes

    default_scope  :order => 'position ASC'
    scope :active, where(:draft => false, :show_in_menu => true)

    has_ancestry

    translates :title, :body
  end
end

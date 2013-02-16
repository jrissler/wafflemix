module Wafflemix
  class Page < ActiveRecord::Base
    attr_accessible :deletable, :draft, :link_url, :parent_id, :position, :show_in_menu, :skip_to_first, :title, :translations_attributes, :locale, :content_parts_attributes

    has_many :content_parts, :as => :contentable, :class_name => 'Wafflemix::ContentSection'
    has_one :meta_content, :as => :metable, :class_name => 'Wafflemix::MetaContent'

    accepts_nested_attributes_for :content_parts

    default_scope  :order => 'position ASC'
    scope :active, where(:draft => false, :show_in_menu => true)

    has_ancestry

    translates :title

    class Translation
      attr_accessible :title, :locale
    end

    before_save :convert_to_safe_url

    validates_presence_of :title

    def to_param
      link_url.gsub('/', '')
    end

    def convert_to_safe_url
      if !self.link_url.blank?
        safe_url = self.link_url.gsub('/','').parameterize
      else
        safe_url = self.title.parameterize
      end
      self.link_url = safe_url
    end
  end
end

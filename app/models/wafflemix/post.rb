module Wafflemix

  class Post < ActiveRecord::Base
    attr_accessible :draft, :link_url, :published_at, :translations_attributes, :locale, :title, :content, :tag_list, :category_ids, :meta_content_attributes

    acts_as_taggable
    ActsAsTaggableOn.force_parameterize = true

    default_scope :order => 'published_at DESC'
    scope :published, lambda { where("published_at <= ? AND draft != ?", Time.zone.now, true) }

    has_many :categoricals, :as => :categorical
    has_many :categories, :through => :categoricals
    has_many :images, :as => :imageable
    has_many :assets, :through => :images
    has_one :meta_content, :as => :metable, :class_name => 'Wafflemix::MetaContent'

    translates :title, :body, :excerpt

    accepts_nested_attributes_for :meta_content

    class Translation
      attr_accessible :title, :body, :excerpt, :locale
    end

    validates_presence_of :title

    def to_param
      "#{id}-#{link_url.gsub('/', '')}"
    end
  end
end


module Wafflemix
  class Post < ActiveRecord::Base
    attr_accessible :draft, :link_url, :published_at, :translations_attributes, :locale, :title, :content, :tag_list, :category_ids

    acts_as_taggable
    ActsAsTaggableOn.force_parameterize = true

    scope :published, lambda { where("published_at <= ? AND draft = ?", Time.zone.now, false) }

    has_many :categoricals, :as => :categorical
    has_many :categories, :through => :categoricals

    translates :title, :body

    class Translation
      attr_accessible :title, :body, :locale
    end

    validates_presence_of :title

    def to_param
      "#{id}-#{link_url.gsub('/', '')}"
    end
  end
end


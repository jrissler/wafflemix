module Wafflemix
  class Post < ActiveRecord::Base
    attr_accessible :draft, :link_url, :published_at, :translations_attributes, :locale

    default_scope  :order => 'published_at ASC'

    translates :title, :body

    class Translation
      attr_accessible :title, :body, :locale
    end
  end
end


module Wafflemix
  class Post < ActiveRecord::Base
    attr_accessible :draft, :link_url, :published_at
  end
end

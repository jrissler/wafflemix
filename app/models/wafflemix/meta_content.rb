module Wafflemix
  class MetaContent < ActiveRecord::Base
    attr_accessible :meta_description, :meta_keywords, :meta_title, :metable_id, :metable_type
  end
end

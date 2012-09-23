module Wafflemix
  class Slide < ActiveRecord::Base
    attr_accessible :name, :position, :parent_id

    validates_presence_of :name

    has_ancestry
  end
end

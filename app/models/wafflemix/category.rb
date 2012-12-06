module Wafflemix
  class Category < ActiveRecord::Base
    attr_accessible :ancestry, :categorical_id, :categorical_type, :name, :position

    has_many :categoricals
    has_many :posts, :through => :categoricals, :source => :categorical, :source_type => 'Wafflemix::Post'
  end
end

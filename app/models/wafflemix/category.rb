module Wafflemix
  class Category < ActiveRecord::Base
    attr_accessible :ancestry, :categorical_id, :categorical_type, :name, :position

    has_many :categoricals, :as => :categorical
  end
end

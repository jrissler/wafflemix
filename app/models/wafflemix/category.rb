module Wafflemix
  class Category < ActiveRecord::Base
    attr_accessible :ancestry, :categorical_id, :categorical_type, :name, :position

    belongs_to :categorical, :polymorphic => true
  end
end

module Wafflemix
  class Categorical < ActiveRecord::Base
    attr_accessible :category_id, :categorical_id, :categorical_type

    belongs_to :categorical, :polymorphic => true
    belongs_to :category, :class_name => 'Wafflemix::Category'
  end
end

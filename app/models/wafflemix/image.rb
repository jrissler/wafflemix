module Wafflemix
  class Image < ActiveRecord::Base
    attr_accessible :asset_id, :imageable_id, :imageable_type

    belongs_to :imageable, :polymorphic => true
    belongs_to :asset, :class_name => 'Wafflemix::Asset'
  end
end

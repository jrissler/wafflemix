module Wafflemix
  class ContentSection < ActiveRecord::Base
    attr_accessible :content, :contentable_id, :contentable_type, :name

    belongs_to :contentable, :polymorphic => true
  end
end

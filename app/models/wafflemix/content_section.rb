module Wafflemix
  class ContentSection < ActiveRecord::Base
    attr_accessible :content, :contentable_id, :contentable_type, :name

    belongs_to :contentable, :polymorphic => true

    def self.title
    	self.name.downcase.parameterize
    end

		def self.content_for(name)
			part = where(["name LIKE ?", "%#{name}%"]).first
			part.content
		end

  end
end

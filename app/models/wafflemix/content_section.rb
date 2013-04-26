module Wafflemix
  class ContentSection < ActiveRecord::Base
    attr_accessible :content, :contentable_id, :contentable_type, :name

    belongs_to :contentable, :polymorphic => true

    def self.title
    	self.name.downcase.parameterize
    end

		def self.content_for(name)
      part = where('lower(name) LIKE ?', "%#{name.downcase}%").first
      if part
			  part.content
      else
        false
      end
		end

  end
end

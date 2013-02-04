module Wafflemix
  class Portfolio < ActiveRecord::Base
    attr_accessible :content, :intro, :title
  end
end

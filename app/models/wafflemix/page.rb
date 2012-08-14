module Wafflemix
  class Page < ActiveRecord::Base
    attr_accessible :deletable, :draft, :link_url, :parent_id, :position, :show_in_menu, :skip_to_first
  end
end

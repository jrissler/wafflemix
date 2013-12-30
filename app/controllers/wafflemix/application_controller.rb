module Wafflemix
  class ApplicationController < ActionController::Base

    before_filter :menu_items

    def menu_items
      @menu_items = Page.active.arrange(:order => :position)
    end

  end
end

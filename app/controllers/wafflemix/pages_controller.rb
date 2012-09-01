require_dependency "wafflemix/application_controller"

module Wafflemix
  class PagesController < ApplicationController

    def index
      @pages = Page.all
  
      respond_to do |format|
        format.html
      end
    end

    def show
      @page = Page.find(params[:id])
  
      respond_to do |format|
        format.html
      end
    end

    def home
      @page = Page.find_by_link_url("/")

      respond_to do |format|
        format.html
      end
    end
  end
end

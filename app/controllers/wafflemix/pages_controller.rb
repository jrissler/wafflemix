require_dependency "wafflemix/application_controller"

module Wafflemix
  class PagesController < ApplicationController

    def index
      @pages = Page.active.arrange(:order => :position)
  
      respond_to do |format|
        format.html
      end
    end

    def show
      #@page = Page.find(params[:id])
      @page = Page.find_by_title(params[:path].to_s.split('/').last.capitalize)#(params[:path] ? params[:path].to_s.split('/').last : params[:id])
  
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

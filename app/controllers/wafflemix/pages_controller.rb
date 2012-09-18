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
      if params[:id]
        @page = Page.find(params[:id])
      else
        @page = Page.find_by_link_url('/' + params[:path].to_s.split('/').last)#(params[:path] ? params[:path].to_s.split('/').last : params[:id])
      end

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

    def mercury_update
      page = Page.find(params[:id])
      page.title = params[:content][:page_title][:value]
      page.body = params[:content][:page_body][:value]
      page.save!
      render text: ""
    end

  end
end

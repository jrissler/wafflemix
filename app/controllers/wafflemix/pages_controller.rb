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
        @page = Page.find_by_link_url(params[:path].to_s.split('/').last)#(params[:path] ? params[:path].to_s.split('/').last : params[:id])
      end

      respond_to do |format|
        format.html
      end
    end

    def home
      @page = Page.find_by_link_url('home')

      respond_to do |format|
        format.html
      end
    end

    def mercury_update
      if params[:id]
        page = Page.find(params[:id])
      else
        page = Page.find_by_link_url(params[:path].to_s.split('/').last)#(params[:path] ? params[:path].to_s.split('/').last : params[:id])
      end

      page.title = params[:content][:page_title][:value] if params[:content][:page_title]

      params[:content].each do |key, value|
        if key =~ /content_section/
          section = key.gsub /(content_section_|_)/, 'content_section_' => '', '_' => ''
          content_to_update = page.content_parts.find_by_name(section)
          content_to_update.content = value[:value]
          content_to_update.save
        end
      end
      page.save!
      render text: ""
    end

  end
end

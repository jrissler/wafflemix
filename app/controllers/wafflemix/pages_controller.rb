require_dependency "wafflemix/application_controller"

module Wafflemix
  class PagesController < ApplicationController

    def index
      @pages = Page.all
  
      respond_to do |format|
        format.html
        format.json { render json: @pages }
      end
    end

    def show
      @page = Page.find(params[:id])
  
      respond_to do |format|
        format.html
        format.json { render json: @page }
      end
    end
  end
end

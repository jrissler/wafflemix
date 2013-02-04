require_dependency "wafflemix/application_controller"

module Wafflemix
  class PortfoliosController < ApplicationController

    def index
      @portfolios = Portfolio.all
      @page = Page.find_by_link_url('portfolios')
  
      respond_to do |format|
        format.html
        format.json { render json: @portfolios }
      end
    end

    def show
      @portfolio = Portfolio.find(params[:id])
      @page = Page.find_by_link_url('portfolios')
  
      respond_to do |format|
        format.html
        format.json { render json: @portfolio }
      end
    end
  end
end

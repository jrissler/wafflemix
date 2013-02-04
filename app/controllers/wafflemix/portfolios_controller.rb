require_dependency "wafflemix/application_controller"

module Wafflemix
  class PortfoliosController < ApplicationController

    def index
      @portfolios = Portfolio.all
  
      respond_to do |format|
        format.html
        format.json { render json: @portfolios }
      end
    end

    def show
      @portfolio = Portfolio.find(params[:id])
  
      respond_to do |format|
        format.html
        format.json { render json: @portfolio }
      end
    end
  end
end

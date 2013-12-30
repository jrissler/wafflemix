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

    def mercury_update
      portfolio = Portfolio.find(params[:id])
      portfolio.title   = params[:content][:portfolio_title][:value]
      portfolio.intro   = params[:content][:portfolio_intro][:value]
      portfolio.content = params[:content][:portfolio_content][:value]
      portfolio.save!
      render text: ""
    end
  end
end

require_dependency "wafflemix/application_controller"

module Wafflemix
  class Admin::PortfoliosController < ApplicationController

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

    def new
      @portfolio = Portfolio.new
  
      respond_to do |format|
        format.html
        format.json { render json: @portfolio }
      end
    end

    def edit
      @portfolio = Portfolio.find(params[:id])
    end

    def create
      @portfolio = Portfolio.new(params[:portfolio])
  
      respond_to do |format|
        if @portfolio.save
          format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
          format.json { render json: @portfolio, status: :created, location: @portfolio }
        else
          format.html { render action: "new" }
          format.json { render json: @portfolio.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @portfolio = Portfolio.find(params[:id])
  
      respond_to do |format|
        if @portfolio.update_attributes(params[:portfolio])
          format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @portfolio.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @portfolio = Portfolio.find(params[:id])
      @portfolio.destroy
  
      respond_to do |format|
        format.html { redirect_to portfolios_url }
        format.json { head :no_content }
      end
    end
  end
end

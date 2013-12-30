module Wafflemix
  class Admin::PortfoliosController < ApplicationController

    layout 'wafflemix/admin'

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
      @portfolio.build_meta_content
  
      respond_to do |format|
        format.html
        format.json { render json: @portfolio }
      end
    end

    def edit
      @portfolio = Portfolio.find(params[:id])

      unless @portfolio.meta_content
        @portfolio.build_meta_content
      end
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

    def sort
      params[:portfolio].sort { |a, b| a <=> b }.each_with_index do |id, index|
        value = id[1][:id]
        position = id[1][:position]
        position = position.to_i + 1
        id[1][:parent_id] == "null" ? parent = nil : parent = id[1][:parent_id]
        Portfolio.update(value, :position => position, :parent_id => parent)
      end
      render :nothing => true
    end
  end
end

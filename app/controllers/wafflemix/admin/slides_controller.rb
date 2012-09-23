require_dependency "wafflemix/application_controller"

module Wafflemix
  class Admin::SlidesController < ApplicationController

    def index
      @slides = Slide.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @slides }
      end
    end
  
    def show
      @slide = Slide.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @slide }
      end
    end

    def new
      @slide = Slide.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @slide }
      end
    end

    def edit
      @slide = Slide.find(params[:id])
    end

    def create
      @slide = Slide.new(params[:slide])
  
      respond_to do |format|
        if @slide.save
          format.html { redirect_to @slide, notice: 'Slide was successfully created.' }
          format.json { render json: @slide, status: :created, location: @slide }
        else
          format.html { render action: "new" }
          format.json { render json: @slide.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @slide = Slide.find(params[:id])
  
      respond_to do |format|
        if @slide.update_attributes(params[:slide])
          format.html { redirect_to @slide, notice: 'Slide was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @slide.errors, status: :unprocessable_entity }
        end
      end
    end
 
    def destroy
      @slide = Slide.find(params[:id])
      @slide.destroy
  
      respond_to do |format|
        format.html { redirect_to slides_url }
        format.json { head :no_content }
      end
    end
  end
end

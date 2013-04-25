require_dependency "wafflemix/application_controller"

module Wafflemix
  class Admin::SlidesController < ApplicationController

    layout 'wafflemix/example_layout'

    def index
      @slides = Slide.all
  
      respond_to do |format|
        format.html
        format.json { render json: @slides }
      end
    end
  
    def show
      @slide = Slide.find(params[:id])
  
      respond_to do |format|
        format.html
        format.json { render json: @slide }
      end
    end

    def new
      @slide = Slide.new
  
      respond_to do |format|
        format.html
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
          format.html { redirect_to admin_slides_path, notice: 'Slide was successfully created.' }
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
          format.html { redirect_to admin_slides_path, notice: 'Slide was successfully updated.' }
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
        format.html { redirect_to admin_slides_path }
        format.json { head :no_content }
      end
    end

    def sort
      params[:slide].sort { |a, b| a <=> b }.each_with_index do |id, index|
        value = id[1][:id]
        position = id[1][:position]
        position = position.to_i + 1
        id[1][:parent_id] == "null" ? parent = nil : parent = id[1][:parent_id]
        Slide.update(value, :position => position, :parent_id => parent)
      end
      render :nothing => true
    end
  end
end

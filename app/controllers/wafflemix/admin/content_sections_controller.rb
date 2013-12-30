module Wafflemix
  class Admin::ContentSectionsController < ApplicationController
    def index
      @content_sections = ContentSection.all
  
      respond_to do |format|
        format.html
        format.json { render json: @content_sections }
      end
    end
  
    def show
      @content_section = ContentSection.find(params[:id])
  
      respond_to do |format|
        format.html
        format.json { render json: @content_section }
      end
    end
 
    def new
      @content_section = ContentSection.new
  
      respond_to do |format|
        format.html
        format.json { render json: @content_section }
      end
    end

    def edit
      @content_section = ContentSection.find(params[:id])
    end

    def create
      if params[:resource]
        @content_section = ContentSection.new
        @content_section.contentable = params[:resource].constantize.find(params[:resource_id])
        @content_section.name = params[:name]
        @content_section.content = "Insert your page content here."
      else
        @content_section = ContentSection.new(params[:content_section])
      end
  
      respond_to do |format|
        if @content_section.save
          format.html { redirect_to @content_section, notice: 'Content section was successfully created.' }
          format.json { render json: @content_section, status: :created, location: @content_section }
          format.js
        else
          format.html { render action: "new" }
          format.json { render json: @content_section.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end

    def update
      @content_section = ContentSection.find(params[:id])
  
      respond_to do |format|
        if @content_section.update_attributes(params[:content_section])
          format.html { redirect_to @content_section, notice: 'Content section was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @content_section.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @content_section = ContentSection.find(params[:id])
      @section_name = @content_section.name
      @content_section.destroy
  
      respond_to do |format|
        format.html { redirect_to content_sections_url }
        format.json { head :no_content }
        format.js
      end
    end
  end
end

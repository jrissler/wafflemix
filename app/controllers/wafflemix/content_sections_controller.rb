require_dependency "wafflemix/application_controller"

module Wafflemix
  class ContentSectionsController < ApplicationController
    # GET /content_sections
    # GET /content_sections.json
    def index
      @content_sections = ContentSection.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @content_sections }
      end
    end
  
    # GET /content_sections/1
    # GET /content_sections/1.json
    def show
      @content_section = ContentSection.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @content_section }
      end
    end
  
    # GET /content_sections/new
    # GET /content_sections/new.json
    def new
      @content_section = ContentSection.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @content_section }
      end
    end
  
    # GET /content_sections/1/edit
    def edit
      @content_section = ContentSection.find(params[:id])
    end
  
    # POST /content_sections
    # POST /content_sections.json
    def create
      @content_section = ContentSection.new(params[:content_section])
  
      respond_to do |format|
        if @content_section.save
          format.html { redirect_to @content_section, notice: 'Content section was successfully created.' }
          format.json { render json: @content_section, status: :created, location: @content_section }
        else
          format.html { render action: "new" }
          format.json { render json: @content_section.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /content_sections/1
    # PUT /content_sections/1.json
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
  
    # DELETE /content_sections/1
    # DELETE /content_sections/1.json
    def destroy
      @content_section = ContentSection.find(params[:id])
      @content_section.destroy
  
      respond_to do |format|
        format.html { redirect_to content_sections_url }
        format.json { head :no_content }
      end
    end
  end
end

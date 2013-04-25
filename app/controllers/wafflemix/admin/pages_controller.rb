require_dependency "wafflemix/application_controller"

module Wafflemix
  class Admin::PagesController < ApplicationController

    layout 'wafflemix/example_layout'

    def index
      @pages = Page.arrange(:order => :position)

      respond_to do |format|
        format.html
        format.json { render json: @pages }
      end
    end

    def show
      @page = Page.find_by_link_url(params[:id])

      respond_to do |format|
        format.html
        format.json { render json: @page }
      end
    end

    def new
      @page = Page.new
      @page.build_meta_content

      respond_to do |format|
        format.html
        format.json { render json: @page }
      end
    end

    def edit
      @page = Page.find_by_link_url(params[:id])

      unless @page.meta_content
        @page.build_meta_content
      end
    end

    def create
      @page = Page.new(params[:page])

      respond_to do |format|
        if @page.save
          format.html { redirect_to admin_pages_path, notice: 'Page was successfully created.' }
          format.json { render json: @page, status: :created, location: @page }
        else
          format.html { render action: "new" }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @page = Page.find_by_link_url(params[:id])

      respond_to do |format|
        if @page.update_attributes(params[:page])
          format.html { redirect_to admin_pages_path, notice: 'Page was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @page = Page.find_by_link_url(params[:id])
      @page.destroy

      respond_to do |format|
        format.html { redirect_to pages_url }
        format.json { head :no_content }
      end
    end

    def sort
      params[:page].sort { |a, b| a <=> b }.each_with_index do |id, index|
        value = id[1][:id]
        position = id[1][:position]
        position = position.to_i + 1
        id[1][:parent_id] == "null" ? parent = nil : parent = id[1][:parent_id]
        Page.update(value, :position => position, :parent_id => parent)
      end
      render :nothing => true
    end
  end
end

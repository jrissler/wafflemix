require_dependency "wafflemix/application_controller"

module Wafflemix
  class Admin::AssetsController < ApplicationController

    layout 'wafflemix/example_layout'

    def index
      @assets = Asset.all
  
      respond_to do |format|
        format.html
        format.json { render :json => @assets.collect { |p| p.to_jq_upload }.to_json }
      end
    end

    def show
      @asset = Asset.find(params[:id])
  
      respond_to do |format|
        format.html
        format.json { render json: @asset }
      end
    end

    def new
      @asset = Asset.new
  
      respond_to do |format|
        format.html
        format.json { render json: @asset }
      end
    end

    def edit
      @asset = Asset.find(params[:id])
    end

    def create
      @asset = Asset.new(params[:asset])
      if @asset.save
        respond_to do |format|
          format.html {
            render :json => [@asset.to_jq_upload].to_json,
            :content_type => 'text/html',
            :layout => false
          }
          format.json {
            render :json => [@asset.to_jq_upload].to_json
          }
        end
      else
        render :json => [{:error => "custom_failure"}], :status => 304
      end
    end

    def update
      @asset = Asset.find(params[:id])
  
      respond_to do |format|
        if @asset.update_attributes(params[:asset])
          format.html { redirect_to [:admin, @asset], notice: 'Asset was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @asset.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @asset = Asset.find(params[:id])
      @asset.destroy
  
      respond_to do |format|
        format.html { redirect_to admin_assets_path }
        format.json { head :no_content }
      end
    end

    def add_image
      slide = params[:resource].constantize.find(params[:resource_id])
      asset = Asset.find(params[:asset_id])

      respond_to do |format|
        if slide.assets << asset
          format.js
        else
          format.js
        end
      end
    end

  end
end

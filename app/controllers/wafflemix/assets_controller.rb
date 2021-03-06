require_dependency "wafflemix/application_controller"

module Wafflemix
  class AssetsController < ApplicationController
    respond_to :json

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
        render :json => {image: {url: "#{@asset.asset.url}"}}
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
  end
end

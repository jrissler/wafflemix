require_dependency "wafflemix/application_controller"

module Wafflemix
  class CategoriesController < ApplicationController
    before_filter :find_page

    def index
      @categories = Category.all

      respond_to do |format|
        format.html
        format.json { render json: @categories }
      end
    end

    def show
      @category = Category.find(params[:id])
      @posts = @category.posts

      respond_to do |format|
        format.html
        format.json { render json: @category }
      end
    end

    private
      def find_page
        @page = Page.find_by_title("Blog")
      end

  end
end

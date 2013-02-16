require_dependency "wafflemix/application_controller"

module Wafflemix
  class Admin::PostsController < ApplicationController

    layout "wafflemix/admin"

    def index
      @posts = Post.all

      respond_to do |format|
        format.html
        format.json { render json: @posts }
      end
    end

    def show
      @post = Post.find(params[:id])

      respond_to do |format|
        format.html
        format.json { render json: @post }
      end
    end

    def new
      @post = Post.new
      @post.build_meta_content

      respond_to do |format|
        format.html
        format.json { render json: @post }
      end
    end

    def edit
      @post = Post.find(params[:id])

      unless @post.meta_content
        @post.build_meta_content
      end
    end

    def create
      @post = Post.new(params[:post])

      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render json: @post, status: :created, location: @post }
        else
          format.html { render action: "new" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @post = Post.find(params[:id])

      respond_to do |format|
        if @post.update_attributes(params[:post])
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end
  end
end

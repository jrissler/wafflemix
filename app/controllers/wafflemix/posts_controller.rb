require_dependency "wafflemix/application_controller"

module Wafflemix
  class PostsController < ApplicationController

    def index
      @posts = Post.all
      @tags = Post.tag_counts_on(:tags)
  
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

    def mercury_update
      post = Post.find(params[:id])
      post.title = params[:content][:post_title][:value]
      post.body = params[:content][:post_body][:value]
      post.save!
      render text: ""
    end

    def tagged
      @posts = Post.tagged_with(params[:id])
      @tags = @posts.tag_counts_on(:tags)

      respond_to do |format|
        format.html
        format.json { render json: @posts }
      end
    end

  end
end

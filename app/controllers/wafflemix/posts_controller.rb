require_dependency "wafflemix/application_controller"

module Wafflemix
  class PostsController < ApplicationController

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
        format.html # show.html.erb
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

  end
end

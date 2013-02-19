require_dependency "wafflemix/application_controller"

module Wafflemix
  class ContactFormsController < ApplicationController

    def show
      @contact_form = ContactForm.find(params[:id])
      @page = Page.find_by_link_url('contact-us')

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @contact_form }
      end
    end

    def new
      @contact_form = ContactForm.new
      @page = Page.find_by_link_url('contact-us')
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @contact_form }
      end
    end

    def create
      @contact_form = ContactForm.new(params[:contact_form])
  
      respond_to do |format|
        if @contact_form.save
          format.html { redirect_to @contact_form, notice: 'Contact form was successfully created.' }
          format.json { render json: @contact_form, status: :created, location: @contact_form }
        else
          format.html { render action: "new" }
          format.json { render json: @contact_form.errors, status: :unprocessable_entity }
        end
      end
    end

  end
end

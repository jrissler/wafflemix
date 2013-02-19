require_dependency "wafflemix/application_controller"

module Wafflemix
  class ContactFormsController < ApplicationController

    before_filter :find_page

    def show
      @contact_form = ContactForm.find(params[:id])

      respond_to do |format|
        format.html
        format.json { render json: @contact_form }
      end
    end

    def new
      @contact_form = ContactForm.new
  
      respond_to do |format|
        format.html
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

    private

      def find_page
        @page = Page.find_by_link_url('contact-us')
      end

  end
end

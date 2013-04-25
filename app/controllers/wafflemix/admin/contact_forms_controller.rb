require_dependency "wafflemix/application_controller"

module Wafflemix
  class Admin::ContactFormsController < ApplicationController

    layout 'wafflemix/example_layout'

    def index
      @contact_forms = ContactForm.all
  
      respond_to do |format|
        format.html
        format.json { render json: @contact_forms }
      end
    end

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

    def edit
      @contact_form = ContactForm.find(params[:id])
    end

    def create
      @contact_form = ContactForm.new(params[:contact_form])
  
      respond_to do |format|
        if @contact_form.save
          format.html { redirect_to [:admin, @contact_form], notice: 'Contact form was successfully created.' }
          format.json { render json: @contact_form, status: :created, location: @contact_form }
        else
          format.html { render action: "new" }
          format.json { render json: @contact_form.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @contact_form = ContactForm.find(params[:id])
  
      respond_to do |format|
        if @contact_form.update_attributes(params[:contact_form])
          format.html { redirect_to [:admin, @contact_form], notice: 'Contact form was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @contact_form.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @contact_form = ContactForm.find(params[:id])
      @contact_form.destroy
  
      respond_to do |format|
        format.html { redirect_to admin_contact_forms_url }
        format.json { head :no_content }
      end
    end
  end
end

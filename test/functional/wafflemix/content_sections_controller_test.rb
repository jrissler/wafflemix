require 'test_helper'

module Wafflemix
  class ContentSectionsControllerTest < ActionController::TestCase
    setup do
      @content_section = content_sections(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:content_sections)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create content_section" do
      assert_difference('ContentSection.count') do
        post :create, content_section: { content: @content_section.content, contentable_id: @content_section.contentable_id, contentable_type: @content_section.contentable_type, name: @content_section.name }
      end
  
      assert_redirected_to content_section_path(assigns(:content_section))
    end
  
    test "should show content_section" do
      get :show, id: @content_section
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @content_section
      assert_response :success
    end
  
    test "should update content_section" do
      put :update, id: @content_section, content_section: { content: @content_section.content, contentable_id: @content_section.contentable_id, contentable_type: @content_section.contentable_type, name: @content_section.name }
      assert_redirected_to content_section_path(assigns(:content_section))
    end
  
    test "should destroy content_section" do
      assert_difference('ContentSection.count', -1) do
        delete :destroy, id: @content_section
      end
  
      assert_redirected_to content_sections_path
    end
  end
end

require 'test_helper'

module Wafflemix
  class PagesControllerTest < ActionController::TestCase
    setup do
      @page = pages(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:pages)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create page" do
      assert_difference('Page.count') do
        post :create, page: { deletable: @page.deletable, draft: @page.draft, link_url: @page.link_url, parent_id: @page.parent_id, position: @page.position, show_in_menu: @page.show_in_menu, skip_to_first: @page.skip_to_first }
      end
  
      assert_redirected_to page_path(assigns(:page))
    end
  
    test "should show page" do
      get :show, id: @page
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @page
      assert_response :success
    end
  
    test "should update page" do
      put :update, id: @page, page: { deletable: @page.deletable, draft: @page.draft, link_url: @page.link_url, parent_id: @page.parent_id, position: @page.position, show_in_menu: @page.show_in_menu, skip_to_first: @page.skip_to_first }
      assert_redirected_to page_path(assigns(:page))
    end
  
    test "should destroy page" do
      assert_difference('Page.count', -1) do
        delete :destroy, id: @page
      end
  
      assert_redirected_to pages_path
    end
  end
end

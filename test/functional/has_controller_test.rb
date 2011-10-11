require 'test_helper'

class HasControllerTest < ActionController::TestCase
  setup do
    @ha = has(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:has)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ha" do
    assert_difference('Ha.count') do
      post :create, :ha => @ha.attributes
    end

    assert_redirected_to ha_path(assigns(:ha))
  end

  test "should show ha" do
    get :show, :id => @ha.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ha.to_param
    assert_response :success
  end

  test "should update ha" do
    put :update, :id => @ha.to_param, :ha => @ha.attributes
    assert_redirected_to ha_path(assigns(:ha))
  end

  test "should destroy ha" do
    assert_difference('Ha.count', -1) do
      delete :destroy, :id => @ha.to_param
    end

    assert_redirected_to has_path
  end
end

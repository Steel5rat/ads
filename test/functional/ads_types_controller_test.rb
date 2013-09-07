require 'test_helper'

class AdsTypesControllerTest < ActionController::TestCase
  setup do
    @ads_type = ads_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ads_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ads_type" do
    assert_difference('AdsType.count') do
      post :create, :ads_type => { :name => @ads_type.name }
    end

    assert_redirected_to ads_type_path(assigns(:ads_type))
  end

  test "should show ads_type" do
    get :show, :id => @ads_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ads_type
    assert_response :success
  end

  test "should update ads_type" do
    put :update, :id => @ads_type, :ads_type => { :name => @ads_type.name }
    assert_redirected_to ads_type_path(assigns(:ads_type))
  end

  test "should destroy ads_type" do
    assert_difference('AdsType.count', -1) do
      delete :destroy, :id => @ads_type
    end

    assert_redirected_to ads_types_path
  end
end

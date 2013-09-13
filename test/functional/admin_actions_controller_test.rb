require 'test_helper'

class AdminActionsControllerTest < ActionController::TestCase
  test "should get deny" do
    get :deny
    assert_response :success
  end

  test "should get approve" do
    get :approve
    assert_response :success
  end

end

require 'test_helper'

class UserActionsControllerTest < ActionController::TestCase
  test "should get to_draft" do
    get :to_draft
    assert_response :success
  end

  test "should get to_new" do
    get :to_new
    assert_response :success
  end

end

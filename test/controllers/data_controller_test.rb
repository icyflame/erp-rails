require 'test_helper'

class DataControllerTest < ActionController::TestCase
  test "should get addmore" do
    get :addmore
    assert_response :success
  end

end

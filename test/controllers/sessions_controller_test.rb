require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new (new sessions path/login)" do
    get login_path
    assert_response :success
  end

end

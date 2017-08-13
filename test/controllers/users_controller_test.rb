require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user1 = users(:user_one)
    @user2 = users(:user_two)
  end
  
  test "should redirect index when not loged in" do
    get users_path
    assert_redirected_to login_url
  end
  
  test "should get new" do
    get signup_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_user_path(@user1)
    assert_not flash.empty?
    assert_redirected_to login_path
  end
  
  test "should redirect update when not logged in" do
    patch user_path(@user1), params: { user: { name: @user1.name, email: @user1.email } }
    assert_not flash.empty?
    assert_redirected_to login_path
  end
  
  test "should redirect when editing wrong user" do
    log_in_as(@user2)
    get edit_user_path(@user1)
    assert_not flash.empty?
    assert_redirected_to user_path(@user2)
  end
  
  test "should redirect when updating wrong user" do
    log_in_as(@user2)
    patch user_path(@user1), params: { user: { name: @user1.name, email: @user1.email } }
    assert_not flash.empty?
    assert_redirected_to user_path(@user2)
  end
  
  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@user2)
    assert_not @user2.admin?
    patch user_path(@user2), params: { user: { password: "password", password_confirmation: "password", admin: true } }
    assert_not @user2.reload.admin?
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user1)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@user2)
    assert_no_difference 'User.count' do 
      delete user_path(@user1)
    end
    assert_redirected_to user_path(@user2)
  end

end

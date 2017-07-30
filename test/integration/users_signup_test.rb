require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "", email: "user@invalid", password: "doesn't", password_confirmation: "match" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end
  
  test "valid signup information" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_difference 'User.count', 1 do
      post signup_path, params: { user: { name: "Example Three", email: "three@example.com", password: "password", password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    assert is_logged_in?
  end
  
end

require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:user_two)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "", email: "not@valid", password: "not", password_confirmation: "valid" } }
    assert_template 'users/edit'
    assert_select 'div.alert-danger', "The form contains 4 errors."
  end
  
  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Example Uno"
    email = "valid@email.com"
    patch user_path(@user), params: { user: { name: name, email: email, password: "", password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end
  
  test "friendly forwarding if not logged in, with successful edit" do
    # Try to edit user, not logged in
    get edit_user_path(@user)
    # Redirected to login, with danger flash, storing edit path in the session to redirect to when logged in
    assert_not flash.empty?
    assert_redirected_to login_url
    assert_not_nil session[:forwarding_url]
    # Log in, redirect to forwarding url
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    # Successful edit
    name = "Example Uno"
    email = "valid@email.com"
    patch user_path(@user), params: { user: { name: name, email: email, password: "", password_confirmation: "" } }
    # Redirected to user profile, with success flash, and delete forwarding url from session
    assert_not flash.empty?
    assert_redirected_to @user
    assert_nil session[:forwarding_url]
    # Relaod user to verify changes are saved
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end

end

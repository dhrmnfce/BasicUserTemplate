require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:user_one)
  end
  
  test "layout links, with login change" do
    get root_url
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_url
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
    get help_path
    assert_select "title", full_title("Help")
    log_in_as(@user)
    get root_url
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
  end
  
  test "container change" do
    get root_url
    assert_template 'static_pages/home'
    assert_select "div.container-fluid"
    get help_path
    assert_template 'static_pages/help'
    assert_select "div.container"
  end
  
end

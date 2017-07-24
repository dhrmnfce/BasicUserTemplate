require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "layout links" do
    get root_url
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_url
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
    get help_path
    assert_select "title", full_title("Help")
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

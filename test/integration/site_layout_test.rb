require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    # assert_template 'static/home'
    # assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path

    # get contact_path
    # assert_select "title", full_title("Contact")
  end

  test "full title helper" do
    assert_equal full_title,         "Sample App"
    # assert_equal full_title("Help"), "Sample App"
  end

  test "full title helper" do
    get signup_path
    # assert_equal full_title, "Sample App"
  end
end

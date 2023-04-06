require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get landing_page" do
    get static_landing_page_url
    assert_response :success
  end

  test "should get dashboard" do
    get static_dashboard_url
    assert_response :success
  end
end

require "test_helper"

class Admin::MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_movies_show_url
    assert_response :success
  end
end

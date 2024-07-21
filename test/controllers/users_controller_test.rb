require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get search page" do
    get search_users_url
    assert_response :success
  end
end

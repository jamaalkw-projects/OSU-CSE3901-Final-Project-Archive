=begin
  users_view_controller_test.rb - Project 6
  Created 07/20/24 by Jamaal Wairegi
=end

require "test_helper"

# Created 07/20/24 by Jamaal Wairegi
class UsersViewControllerTest < ActionDispatch::IntegrationTest
  # Test 1 - page that displays all users
  test "should get Users page" do
    get users_url
    assert_response :success
  end
end

=begin
  users_view_controller_test.rb - Project 6
  Created 07/20/24 by Jamaal Wairegi
=end

require "test_helper"

# Created 07/20/24 by Jamaal Wairegi
class UsersViewControllerTest < ActionDispatch::IntegrationTest
  # Test 1 - page that displays all users
  test "should get all users page" do
    # routing
    assert_routing "/users", :controller => "users_view", :action => "index"
    get users_url
    assert_response :success
  end

  # Created 07/22/24 by Jamaal Wairegi
  # Test 2 - page that displays user's profile
  test "should get individual user profiles" do
    # routing
    assert_routing "/users/:id", :controller => "users_view", :action => "show", :id => ":id"
    get users_url(:id)
    assert_response :success
  end
end

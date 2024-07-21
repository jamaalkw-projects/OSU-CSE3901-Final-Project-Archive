=begin
  join_game_controller_test.rb - Project 6
  Created 07/19/24 by Jamaal Wairegi
=end
require "test_helper"

# Created 07/19/24 by Jamaal Wairegi
class JoinGameControllerTest < ActionDispatch::IntegrationTest
  # Test 1 - Join Game Page
  test "should go to Join Game Page" do
    # routing
    assert_routing "/join_game", :controller => "join_game", :action => "index"
    get join_game_url
    assert_response :success

    # page content
  end
end
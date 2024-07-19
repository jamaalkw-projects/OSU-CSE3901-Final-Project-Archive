=begin
  landing_page_controller_test.rb - Project 6
  Created 07/16/24 by Jamaal Wairegi
=end
require "test_helper"

# Created 07/16/24 by Jamaal Wairegi
# Edited 07/17/24 by Jamaal Wairegi: Added tests for Sign Up and Join Game pages
class LandingPageControllerTest < ActionDispatch::IntegrationTest
  # Test 1 - Landing Home Page
  test "should have a Home page (the root)" do
    # routing
    assert_routing "/", :controller => "landing_page", :action => "index"
    get root_url
    assert_response :success

    # page content
    assert_select "title", "QuizGem"
    assert_select "form input", {:count => 3}
    assert_select "button", {:count => 2}
  end

  # Test 2 - Landing Sign Up Page
  test "should have a Sign In page" do
    # routing
    assert_routing "/sign_up", :controller => "landing_page", :action => "sign_up"
    get "/sign_up"
    assert_response :success

    # page content
    assert_select "title", "Sign Up - QuizGem"
  end

  # Test 3 - Landing Join Game Page
  test "should have a Join Game page" do
    # routing
    assert_routing "/join_game", :controller => "landing_page", :action => "join_game"
    get "/join_game"
    assert_response :success

    # page content
    assert_select "title", "Join Multiplayer Game - QuizGem"
  end
end

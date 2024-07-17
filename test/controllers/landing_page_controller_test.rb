=begin
  landing_page_controller_test.rb - Project 6
  Created 07/16/24 by Jamaal Wairegi
=end
require "test_helper"

# Created 07/16/24 by Jamaal Wairegi
class LandingPageControllerTest < ActionDispatch::IntegrationTest
  # Test 1 - Checking the result of doing a GET request on the Landing Page Home
  test "should get home" do
    get landing_page_home_url
    assert_response :success
    assert_select "title", "Landing Page Home"
  end

  # Test 2 - Checking for the input fields for the login section
  test "should house links to other pages" do
    get landing_page_home_url
    assert_response :success
    assert_select "form input", {:count => 3}
  end
end

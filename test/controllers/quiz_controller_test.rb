require "test_helper"

class QuizControllerTest < ActionDispatch::IntegrationTest
  # Created 07/19/24 by Jamaal Wairegi
  # Test 1 - Quiz Index Page
  test "should get Quizzes page" do
    get quizzes_url
    assert_response :success
  end
end

require "test_helper"

class QuizControllerTest < ActionDispatch::IntegrationTest
  # Created 07/19/24 by Jamaal Wairegi
  # Edited 07/21/24 by Sirojiddin Aripov: Added more tests
  # Test 1 - Quiz Index Page
  test "should get Quizzes page" do
    get quizzes_url
    assert_response :success
  end
  test "should get quizzes" do
    get quizzes_path
    assert_response :success
  end
  test "should get new quiz page" do
    get new_quiz_path
    assert_response :success
  end
  test "should get all quizzes" do
    get quizzes_path
    assert_response :success
  end
end

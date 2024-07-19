=begin
  quiz_information_controller_test.rb - Project 6
  Created 07/18/2024 by Nicholas Colacarro
  Edited 07/19/2024 by Nicholas Colacarro: Added tests for userProfile/listQuizUser pages and tests for buttons.
=end

require "test_helper"

class QuizInformationControllerTest < ActionDispatch::IntegrationTest
  # Test 1 - Quiz Information Page
  test "should get index" do
    get root_path
    assert_response :success
    assert_select "title", "Quiz Name"
    assert_select "button", {:count => 5}
  end

  # Test 2
  test "should get userProfile" do
    get userProfile_path
    assert_response :success
  end

  # Test 3
  test "should get listQuizUser" do
    get listQuizUser_path
    assert_response :success
  end

  #Test 4 
  test "should get home" do
    get home_path
    assert_response :success
  end

  # Test 5 - Study Quiz Page
  test "should get study" do
    get study_path
    assert_response :success
    assert_select "title", "Quiz Name | Study"
    assert_select "button", {:count => 2}
  end

  # Test 6
  test "should get host" do
    get host_path
    assert_response :success
  end
  
  # Test 7 - Question Page
  test "should get question" do
    get question_path
    assert_response :success
    assert_select "title", "Quiz Name | Question #"
    assert_select "button", {:count => 3}
  end

  # Test 8 - End of Quiz Page
  test "should get quizEnd" do
    get quizEnd_path
    assert_response :success
    assert_select "title", "Quiz Name | Quiz Ended"
    assert_select "button", {:count => 2}
  end
end

=begin
  quiz_information_controller_test.rb - Project 6
  Created 07/18/2024 by Nicholas Colacarro
=end

require "test_helper"

class QuizInformationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
    assert_select "title", "Quiz Name"
  end

  test "should get home" do
    get home_path
    assert_response :success
  end

  test "should get study" do
    get study_path
    assert_response :success
    assert_select "title", "Quiz Name | Study"
  end

  test "should get host" do
    get host_path
    assert_response :success
  end
  
  test "should get question" do
    get question_path
    assert_response :success
    assert_select "title", "Quiz Name | Question #"
  end

  test "should get quizEnd" do
    get quizEnd_path
    assert_response :success
    assert_select "title", "Quiz Name | Quiz Ended"
  end
end

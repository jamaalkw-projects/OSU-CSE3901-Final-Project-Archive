require "test_helper"

class QuizInformationControllerTest < ActionDispatch::IntegrationTest
  test "should get host" do
    get quiz_information_host_url
    assert_response :success
  end

  test "should get study" do
    get quiz_information_study_url
    assert_response :success
  end

  test "should get home" do
    get quiz_information_home_url
    assert_response :success
  end
end

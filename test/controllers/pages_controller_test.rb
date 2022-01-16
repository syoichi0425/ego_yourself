require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get show" do
    get pages_show_url
    assert_response :success
  end

  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get question" do
    get pages_question_url
    assert_response :success
  end

  test "should get inquiry" do
    get pages_inquiry_url
    assert_response :success
  end

  test "should get agreement" do
    get pages_agreement_url
    assert_response :success
  end

  test "should get help" do
    get pages_help_url
    assert_response :success
  end
end

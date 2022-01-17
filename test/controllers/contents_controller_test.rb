require "test_helper"

class ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contents_index_url
    assert_response :success
  end

  test "should get show" do
    get contents_show_url
    assert_response :success
  end

  test "should get home" do
    get contents_home_url
    assert_response :success
  end

  test "should get question" do
    get contents_question_url
    assert_response :success
  end

  test "should get inquiry" do
    get contents_inquiry_url
    assert_response :success
  end

  test "should get agreement" do
    get contents_agreement_url
    assert_response :success
  end

  test "should get help" do
    get contents_help_url
    assert_response :success
  end

  test "should get egogram_explanation" do
    get contents_egogram_explanation_url
    assert_response :success
  end

  test "should get egogram_example" do
    get contents_egogram_examples_url
    assert_response :success
  end

  test "should get diary_explanation" do
    get contents_diary_explanation_url
    assert_response :success
  end
end

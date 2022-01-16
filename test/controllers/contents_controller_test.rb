require "test_helper"

class ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get egogram_explanations" do
    get contents_egogram_explanations_url
    assert_response :success
  end

  test "should get egogram_examples" do
    get contents_egogram_examples_url
    assert_response :success
  end

  test "should get diary_explanations" do
    get contents_diary_explanations_url
    assert_response :success
  end
end

require "test_helper"

class GoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get goals_new_url
    assert_response :success
  end

  test "should get fix_and_dalete" do
    get goals_fix_and_dalete_url
    assert_response :success
  end
end

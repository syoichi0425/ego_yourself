require 'test_helper'

class EgogramsControllerTest < ActionDispatch::IntegrationTest
  test 'should get test' do
    get egograms_test_url
    assert_response :success
  end

  test 'should get result' do
    get egograms_result_url
    assert_response :success
  end

  test 'should get confirmation' do
    get egograms_confirmation_url
    assert_response :success
  end
end

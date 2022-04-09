require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test 'should get password_forget_request' do
    get requests_password_forget_request_url
    assert_response :success
  end

  test 'should get password_forget_resetting' do
    get requests_password_forget_resetting_url
    assert_response :success
  end

  test 'should get withdrawal' do
    get requests_withdrawal_url
    assert_response :success
  end

  test 'should get after_withdrawal' do
    get requests_after_withdrawal_url
    assert_response :success
  end
end

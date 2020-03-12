require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should respond correctly on success" do
    check = checks(:unsent)
    Timecop.freeze do
      post payments_url, params: {check_id: check.id}, xhr: true
      assert_response :success
      assert_equal Time.now, check.reload.sent_at
    end
  end

  test "should respond correctly on error" do
    check = checks(:unsent)
    raise_error = Proc.new { raise SendCheck::FailedSend, "Failed!" }
    SendCheck.stub :call, raise_error do
      post payments_url, params: {check_id: check.id}, xhr: true
      error_hash = {error: "Failed!"}
      assert_response :unprocessable_entity
      assert_equal error_hash.to_json, @response.body
    end
  end
end

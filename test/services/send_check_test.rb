require 'test_helper'

class SendCheckTest < ActiveSupport::TestCase
  test "sends the check" do
    check = checks(:unsent)
    Timecop.freeze do
      SendCheck.call(check)
      assert_equal Time.now, check.reload.sent_at
    end
  end

  test "does not double-send" do
    check = checks(:sent)
    sent_at = check.sent_at
    SendCheck.call(check)
    assert_equal sent_at, check.reload.sent_at
  end

end

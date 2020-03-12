require 'test_helper'

class CheckTest < ActiveSupport::TestCase
  test "is valid with a positive amount" do
    check = checks(:sent)
    assert check.valid?
  end

  test "is invalid with a negative amount" do
    check = checks(:sent)
    check.amount = -10
    assert check.invalid?
  end

  test "is invalid with a zero amount" do
    check = checks(:sent)
    check.amount = 0
    assert check.invalid?
  end

  test "is invalid without a nonprofit" do
    check = checks(:sent)
    check.nonprofit = nil
    assert check.invalid?
  end

  test "lists the unsent checks with the oldest first" do
    sent = checks(:sent)
    unsent = checks(:unsent)
    old_unsent = Check.create(amount: 10, nonprofit: nonprofits(:no_stripe), sent_at: nil, created_at: 1.hour.ago)
    assert_equal [old_unsent, unsent], Check.unsent
  end

  test "marks itself as sent" do
    Timecop.freeze do
      check = checks(:unsent)
      check.mark_as_sent!
      assert_equal Time.now, check.reload.sent_at
    end
  end
end

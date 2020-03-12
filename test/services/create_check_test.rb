require 'test_helper'

class CreateCheckTest < ActiveSupport::TestCase
  test "creates a check for a nonprofit with a batch of donations" do
    nonprofit = nonprofits(:no_stripe)
    check = CreateCheck.call(nonprofit, Donation.all)
    assert_equal nonprofit, check.nonprofit
    assert_equal Donation.all.pluck(:amount).sum, check.amount
    assert_equal [check.id], Donation.all.pluck(:check_id).uniq
  end
end

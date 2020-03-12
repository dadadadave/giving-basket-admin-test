require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  test "is valid with a positive amount" do
    donation = donations(:one)
    assert donation.valid?
  end

  test "is invalid with a negative amount" do
    donation = donations(:one)
    donation.amount = -10
    assert donation.invalid?
  end

  test "is invalid with a zero amount" do
    donation = donations(:one)
    donation.amount = 0
    assert donation.invalid?
  end

  test "is invalid without a nonprofit" do
    donation = donations(:one)
    donation.nonprofit = nil
    assert donation.invalid?
  end

  test "is valid without a check" do
    donation = donations(:one)
    donation.check = nil
    assert donation.valid?
  end

  test "includes donations with no check" do
    with_check = Donation.create(amount: 1, nonprofit: nonprofits(:with_stripe), check: checks(:sent))
    no_check = Donation.create(amount: 1, nonprofit: nonprofits(:with_stripe), check: nil)
    assert_equal [no_check], Donation.with_no_check
  end
end

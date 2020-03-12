require 'test_helper'

class NonprofitTest < ActiveSupport::TestCase
  test "is valid with a name and address" do
    nonprofit = nonprofits(:no_stripe)
    assert nonprofit.valid?
  end

  test "is invalid without a name" do
    nonprofit = nonprofits(:no_stripe)
    nonprofit.name = ""
    assert nonprofit.invalid?
  end

  test "is invalid without an address" do
    nonprofit = nonprofits(:no_stripe)
    nonprofit.address = ""
    assert nonprofit.invalid?
  end

  test "includes nonprofits with no stripe account" do
    with_stripe = nonprofits(:with_stripe)
    without_stripe = nonprofits(:no_stripe)
    assert_equal [without_stripe], Nonprofit.no_stripe
  end

  test "includes nonprofits with no stripe account that have donations with no check" do
    no_stripe1 = Nonprofit.create(name: "Nonprofit1", address: "123 Fake St", stripe_acct: nil)
    no_stripe2 = Nonprofit.create(name: "Nonprofit2", address: "456 Fake St", stripe_acct: nil)
    no_stripe3 = Nonprofit.create(name: "Nonprofit3", address: "890 Fake St", stripe_acct: nil)
    with_stripe = Nonprofit.create(name: "Nonprofit4", address: "123 Real St", stripe_acct: "123")
    Donation.create(amount: 1, nonprofit: no_stripe1)
    Donation.create(amount: 2, nonprofit: no_stripe1)
    Donation.create(amount: 1, nonprofit: no_stripe2, check: checks(:unsent))
    Donation.create(amount: 1, nonprofit: with_stripe)
    assert_equal [no_stripe1], Nonprofit.with_unprocessed_donations
  end

  test "responds correctly when updating with valid params" do
    nonprofit = Nonprofit.find_and_update(nonprofits(:no_stripe).id, name: "New Name")
    assert_equal "New Name", nonprofit.name
    assert nonprofit.valid?
  end

  test "responds correctly when updating with invalid params" do
    nonprofit = Nonprofit.find_and_update(nonprofits(:no_stripe).id, name: "")
    assert_equal "", nonprofit.name
    assert nonprofit.invalid?
  end
end

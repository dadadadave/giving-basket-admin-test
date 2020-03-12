require 'test_helper'

class CheckTest < ActiveSupport::TestCase
  test "is valid with a positive amount" do
    check = checks(:one)
    assert check.valid?
  end

  test "is invalid with a negative amount" do
    check = checks(:one)
    check.amount = -10
    assert check.invalid?
  end

  test "is invalid with a zero amount" do
    check = checks(:one)
    check.amount = 0
    assert check.invalid?
  end

  test "is invalid without a nonprofit" do
    check = checks(:one)
    check.nonprofit = nil
    assert check.invalid?
  end
end

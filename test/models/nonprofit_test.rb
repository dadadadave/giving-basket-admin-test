require 'test_helper'

class NonprofitTest < ActiveSupport::TestCase
  test "is valid with a name and address" do
    nonprofit = nonprofits(:one)
    assert nonprofit.valid?
  end

  test "is invalid without a name" do
    nonprofit = nonprofits(:one)
    nonprofit.name = ""
    assert nonprofit.invalid?
  end

  test "is invalid without an address" do
    nonprofit = nonprofits(:one)
    nonprofit.address = ""
    assert nonprofit.invalid?
  end
end

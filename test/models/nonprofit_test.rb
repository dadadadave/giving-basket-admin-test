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

  test "responds correctly when updating with valid params" do
    nonprofit = Nonprofit.find_and_update(nonprofits(:one).id, name: "New Name")
    assert_equal "New Name", nonprofit.name
    assert nonprofit.valid?
  end

  test "responds correctly when updating with invalid params" do
    nonprofit = Nonprofit.find_and_update(nonprofits(:one).id, name: "")
    assert_equal "", nonprofit.name
    assert nonprofit.invalid?
  end
end

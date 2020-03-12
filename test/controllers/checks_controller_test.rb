require 'test_helper'

class ChecksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checks_url, xhr: true
    assert_response :success
  end

  test "should render the list of unsent checks correctly" do
    check_one = checks(:unsent)
    check_two = Check.create(amount: 10, sent_at: nil, nonprofit: nonprofits(:two))

    hash_one = {nonprofit_id: check_one.nonprofit_id,
                nonprofit_name: check_one.nonprofit.name,
                nonprofit_address: check_one.nonprofit.address,
                check_amount: check_one.amount,
                check_id: check_one.id}
    hash_two = {nonprofit_id: check_two.nonprofit_id,
                nonprofit_name: check_two.nonprofit.name,
                nonprofit_address: check_two.nonprofit.address,
                check_amount: check_two.amount,
                check_id: check_two.id}

    get checks_url, xhr: true
    assert_equal [hash_one, hash_two].to_json, @response.body
  end
end

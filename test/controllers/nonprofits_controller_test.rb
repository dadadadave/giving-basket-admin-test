require 'test_helper'

class NonprofitsControllerTest < ActionDispatch::IntegrationTest
  test "should update nonprofit on success" do
    nonprofit = nonprofits(:one)
    patch nonprofit_url(nonprofit), params: {nonprofit: {name: "New Name", address: "New Address"}}, xhr: true
    nonprofit_hash = {nonprofit_id: nonprofit.id, nonprofit_name: "New Name", nonprofit_address: "New Address"}
    assert_response :success
    assert_equal nonprofit_hash.to_json, @response.body
  end

  test "should respond correctly on failed update" do
    nonprofit = nonprofits(:one)
    patch nonprofit_url(nonprofit), params: {nonprofit: {name: ""}}, xhr: true
    error_hash = {name: ["can't be blank"]}
    assert_response :unprocessable_entity
    assert_equal error_hash.to_json, @response.body
  end
end

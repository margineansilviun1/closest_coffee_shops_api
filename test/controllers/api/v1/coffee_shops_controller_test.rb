require "test_helper"

class Api::V1::CoffeeShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get closest" do
    get api_v1_coffee_shops_closest_url
    assert_response :success
  end
end

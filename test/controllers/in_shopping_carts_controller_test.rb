require 'test_helper'

class InShoppingCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get in_shopping_carts_add_url
    assert_response :success
  end

end

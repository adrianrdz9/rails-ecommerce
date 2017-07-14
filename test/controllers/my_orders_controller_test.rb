require 'test_helper'

class MyOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get my_orders_show_url
    assert_response :success
  end

end

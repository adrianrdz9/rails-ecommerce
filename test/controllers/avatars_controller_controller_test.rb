require 'test_helper'

class AvatarsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get avatars_controller_create_url
    assert_response :success
  end

end

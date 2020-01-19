require 'test_helper'

class LiveHousesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get live_houses_show_url
    assert_response :success
  end

end

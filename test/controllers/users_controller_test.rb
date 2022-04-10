require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:alice)
  end

  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should get show" do
    get users_show_path
    assert_response :success
  end
end

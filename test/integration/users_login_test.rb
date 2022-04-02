require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:alice)    # サインインするとき
    sign_in(@user)
    # サインアウトするとき
    #sign_out
  end

  test "login with valid information" do
    get new_user_session_path
    post user_session_path, params: { session: { email:    @user.email,
                                      password: 'password' } }
     follow_redirect!
     assert_template 'pages/index'
     assert_select "a[href=?]", new_user_session_path, count: 0
     assert_select "a[href=?]", destroy_user_session_path
     assert_select "a[href=?]", edit_user_registration_path
  end

end

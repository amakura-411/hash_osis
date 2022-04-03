require "test_helper"

class CharactersCreateTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  def setup
  Warden.test_mode!
  @user = users( :alice )
  login_as(@user)
  end


  test "character interface" do
    #log_in_as(@user)
    get '/characters/new'
    assert_template 'characters/new'
        # chara_nameが無効な送信
        assert_no_difference 'Character.count' do
          post characters_path, params: { character: { chara_name: "", appear_in: "" } }
        end
    # 有効な送信
    chara_name = "ルパン３世"
    appear_in = "ルパン３世"
    assert_difference 'Character.count', 1 do
      post characters_path, params: { character: { chara_name: chara_name, appear_in: appear_in } }
    end
    assert_redirected_to characters_path
  end

end

require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @character = characters(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Character.count' do
      post characters_path, params: {character: {chara_name: "Lorem ipsum",appear_in: "original" } }
    end
    #assert_redirected_to home_index_path
  end
end

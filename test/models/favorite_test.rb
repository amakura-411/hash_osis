require "test_helper"

class FavoriteTest < ActiveSupport::TestCase
  def setup
    @user =users(:alice)
    @favorite  =     @user.favorites.new(character_id: characters(:two).id)
end

test "should be valid" do
  assert @favorite.valid?
end

test "should require a user_id" do
  @favorite.character_id = nil
  assert_not @favorite.valid?
end

test "should require a character_id" do
  @favorite.character_id = nil
  assert_not @favorite.valid?
end

end
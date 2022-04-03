require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  def setup
    @user = users(:alice)
    # このコードは慣習的に正しくない
    @character = @user.characters.build(chara_name: "Lorem ipsum",appear_in: "original")
  end

  test "should be valid" do
    assert @character.valid?
  end

  test "user id should be present" do
    @character.user_id = nil
    assert_not @character.valid?
  end

  test "chara_name should be present" do
    @character.chara_name = "    "
    @character.appear_in  = "original"
    assert_not @character.valid?
  end

  test "appear_in should be present" do
    @character.chara_name = "a"
    @character.appear_in  = "    "
    assert_not @character.valid?
  end

  test "chara_name should be at most 100 characters" do
    @character.chara_name = "a" * 100
    @character.appear_in  = "o"
    assert @character.valid?
  end


  test "appear_in should be at most 100 characters" do
    @character.chara_name = "a"
    @character.appear_in  = "o" * 380
    assert @character.valid?
  end

  test "appear_in should be at most 381 characters" do
    @character.chara_name = "a"
    @character.appear_in  = "o" * 381
    assert_not @character.valid?
  end

  test "chara_name should be at most 101 characters" do
    @character.chara_name = "a" * 101
    @character.appear_in  = "original"
    assert_not @character.valid?
  end

  test "order should be most recent first" do
    assert_equal characters(:most_recent), Character.first
  end

end

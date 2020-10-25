require 'test_helper'

class RushingTest < ActiveSupport::TestCase
  test "should not save rushing without player name" do
    rushing = Rushing.new
    assert_not rushing.save
  end

  test "should not save rushing without team name" do
    rushing = Rushing.new(player: 'test')
    assert_not rushing.save
  end

  test "should save rushing with player and team" do
    rushing = Rushing.new(player: 'test', team: 'aa')
    assert rushing.save
  end
end

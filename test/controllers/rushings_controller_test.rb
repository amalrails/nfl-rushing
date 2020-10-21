require 'test_helper'

class RushingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rushing = rushings(:one)
  end

  test "should get index" do
    get rushings_url
    assert_response :success
  end

  test "should get new" do
    get new_rushing_url
    assert_response :success
  end

  test "should create rushing" do
    assert_difference('Rushing.count') do
      post rushings_url, params: { rushing: { 1st: @rushing.1st, 1st%: @rushing.1st%, 20+: @rushing.20+, 40+: @rushing.40+, att: @rushing.att, att/g: @rushing.att/g, avg: @rushing.avg, fum: @rushing.fum, lng: @rushing.lng, player: @rushing.player, pos: @rushing.pos, td: @rushing.td, team: @rushing.team, yds: @rushing.yds, yds/g: @rushing.yds/g } }
    end

    assert_redirected_to rushing_url(Rushing.last)
  end

  test "should show rushing" do
    get rushing_url(@rushing)
    assert_response :success
  end

  test "should get edit" do
    get edit_rushing_url(@rushing)
    assert_response :success
  end

  test "should update rushing" do
    patch rushing_url(@rushing), params: { rushing: { 1st: @rushing.1st, 1st%: @rushing.1st%, 20+: @rushing.20+, 40+: @rushing.40+, att: @rushing.att, att/g: @rushing.att/g, avg: @rushing.avg, fum: @rushing.fum, lng: @rushing.lng, player: @rushing.player, pos: @rushing.pos, td: @rushing.td, team: @rushing.team, yds: @rushing.yds, yds/g: @rushing.yds/g } }
    assert_redirected_to rushing_url(@rushing)
  end

  test "should destroy rushing" do
    assert_difference('Rushing.count', -1) do
      delete rushing_url(@rushing)
    end

    assert_redirected_to rushings_url
  end
end

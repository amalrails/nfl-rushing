require "application_system_test_case"

class RushingsTest < ApplicationSystemTestCase
  setup do
    @rushing = rushings(:one)
  end

  test "visiting the index" do
    visit rushings_url
    assert_selector "h1", text: "Rushings"
  end

  test "creating a Rushing" do
    visit rushings_url
    click_on "New Rushing"

    fill_in "1st", with: @rushing.1st
    fill_in "1st%", with: @rushing.1st%
    fill_in "20+", with: @rushing.20+
    fill_in "40+", with: @rushing.40+
    fill_in "Att", with: @rushing.att
    fill_in "Att/g", with: @rushing.att/g
    fill_in "Avg", with: @rushing.avg
    fill_in "Fum", with: @rushing.fum
    fill_in "Lng", with: @rushing.lng
    fill_in "Player", with: @rushing.player
    fill_in "Pos", with: @rushing.pos
    fill_in "Td", with: @rushing.td
    fill_in "Team", with: @rushing.team
    fill_in "Yds", with: @rushing.yds
    fill_in "Yds/g", with: @rushing.yds/g
    click_on "Create Rushing"

    assert_text "Rushing was successfully created"
    click_on "Back"
  end

  test "updating a Rushing" do
    visit rushings_url
    click_on "Edit", match: :first

    fill_in "1st", with: @rushing.1st
    fill_in "1st%", with: @rushing.1st%
    fill_in "20+", with: @rushing.20+
    fill_in "40+", with: @rushing.40+
    fill_in "Att", with: @rushing.att
    fill_in "Att/g", with: @rushing.att/g
    fill_in "Avg", with: @rushing.avg
    fill_in "Fum", with: @rushing.fum
    fill_in "Lng", with: @rushing.lng
    fill_in "Player", with: @rushing.player
    fill_in "Pos", with: @rushing.pos
    fill_in "Td", with: @rushing.td
    fill_in "Team", with: @rushing.team
    fill_in "Yds", with: @rushing.yds
    fill_in "Yds/g", with: @rushing.yds/g
    click_on "Update Rushing"

    assert_text "Rushing was successfully updated"
    click_on "Back"
  end

  test "destroying a Rushing" do
    visit rushings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rushing was successfully destroyed"
  end
end

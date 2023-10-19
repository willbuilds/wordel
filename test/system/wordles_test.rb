require "application_system_test_case"

class WordlesTest < ApplicationSystemTestCase
  setup do
    @wordle = wordles(:one)
  end

  test "visiting the index" do
    visit wordles_url
    assert_selector "h1", text: "Wordles"
  end

  test "should create wordle" do
    visit wordles_url
    click_on "New wordle"

    fill_in "Solution", with: @wordle.solution
    click_on "Create Wordle"

    assert_text "Wordle was successfully created"
    click_on "Back"
  end

  test "should update Wordle" do
    visit wordle_url(@wordle)
    click_on "Edit this wordle", match: :first

    fill_in "Solution", with: @wordle.solution
    click_on "Update Wordle"

    assert_text "Wordle was successfully updated"
    click_on "Back"
  end

  test "should destroy Wordle" do
    visit wordle_url(@wordle)
    click_on "Destroy this wordle", match: :first

    assert_text "Wordle was successfully destroyed"
  end
end

require "application_system_test_case"

class HealersTest < ApplicationSystemTestCase
  setup do
    @healer = healers(:one)
  end

  test "visiting the index" do
    visit healers_url
    assert_selector "h1", text: "Healers"
  end

  test "should create healer" do
    visit healers_url
    click_on "New healer"

    fill_in "Contact", with: @healer.contact
    fill_in "Description", with: @healer.description
    fill_in "Name", with: @healer.name
    fill_in "Service", with: @healer.service
    click_on "Create Healer"

    assert_text "Healer was successfully created"
    click_on "Back"
  end

  test "should update Healer" do
    visit healer_url(@healer)
    click_on "Edit this healer", match: :first

    fill_in "Contact", with: @healer.contact
    fill_in "Description", with: @healer.description
    fill_in "Name", with: @healer.name
    fill_in "Service", with: @healer.service
    click_on "Update Healer"

    assert_text "Healer was successfully updated"
    click_on "Back"
  end

  test "should destroy Healer" do
    visit healer_url(@healer)
    click_on "Destroy this healer", match: :first

    assert_text "Healer was successfully destroyed"
  end
end

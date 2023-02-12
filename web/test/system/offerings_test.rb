require "application_system_test_case"

class OfferingsTest < ApplicationSystemTestCase
  setup do
    @offering = offerings(:one)
  end

  test "visiting the index" do
    visit offerings_url
    assert_selector "h1", text: "Offerings"
  end

  test "should create offering" do
    visit offerings_url
    click_on "New offering"

    fill_in "Category", with: @offering.category
    fill_in "Description", with: @offering.description
    fill_in "Email", with: @offering.email
    fill_in "Phone", with: @offering.phone
    fill_in "Service provider", with: @offering.service_provider_id
    fill_in "Title", with: @offering.title
    click_on "Create Offering"

    assert_text "Offering was successfully created"
    click_on "Back"
  end

  test "should update Offering" do
    visit offering_url(@offering)
    click_on "Edit this offering", match: :first

    fill_in "Category", with: @offering.category
    fill_in "Description", with: @offering.description
    fill_in "Email", with: @offering.email
    fill_in "Phone", with: @offering.phone
    fill_in "Service provider", with: @offering.service_provider_id
    fill_in "Title", with: @offering.title
    click_on "Update Offering"

    assert_text "Offering was successfully updated"
    click_on "Back"
  end

  test "should destroy Offering" do
    visit offering_url(@offering)
    click_on "Destroy this offering", match: :first

    assert_text "Offering was successfully destroyed"
  end
end

require "application_system_test_case"

class ServiceProvidersTest < ApplicationSystemTestCase
  setup do
    @service_provider = service_providers(:one)
  end

  test "visiting the index" do
    visit service_providers_url
    assert_selector "h1", text: "Service providers"
  end

  test "should create service provider" do
    visit service_providers_url
    click_on "New service provider"

    fill_in "Bio", with: @service_provider.bio
    fill_in "Company", with: @service_provider.company
    fill_in "Email", with: @service_provider.email
    fill_in "Name", with: @service_provider.name
    fill_in "Phone", with: @service_provider.phone
    fill_in "User", with: @service_provider.user_id
    click_on "Create Service provider"

    assert_text "Service provider was successfully created"
    click_on "Back"
  end

  test "should update Service provider" do
    visit service_provider_url(@service_provider)
    click_on "Edit this service provider", match: :first

    fill_in "Bio", with: @service_provider.bio
    fill_in "Company", with: @service_provider.company
    fill_in "Email", with: @service_provider.email
    fill_in "Name", with: @service_provider.name
    fill_in "Phone", with: @service_provider.phone
    fill_in "User", with: @service_provider.user_id
    click_on "Update Service provider"

    assert_text "Service provider was successfully updated"
    click_on "Back"
  end

  test "should destroy Service provider" do
    visit service_provider_url(@service_provider)
    click_on "Destroy this service provider", match: :first

    assert_text "Service provider was successfully destroyed"
  end
end

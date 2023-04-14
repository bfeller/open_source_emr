require "application_system_test_case"

class PharmaciesTest < ApplicationSystemTestCase
  setup do
    @pharmacy = pharmacies(:one)
  end

  test "visiting the index" do
    visit pharmacies_url
    assert_selector "h1", text: "Pharmacies"
  end

  test "should create pharmacy" do
    visit pharmacies_url
    click_on "New pharmacy"

    fill_in "Address", with: @pharmacy.address
    fill_in "Email", with: @pharmacy.email
    fill_in "Name", with: @pharmacy.name
    fill_in "Phone", with: @pharmacy.phone
    click_on "Create Pharmacy"

    assert_text "Pharmacy was successfully created"
    click_on "Back"
  end

  test "should update Pharmacy" do
    visit pharmacy_url(@pharmacy)
    click_on "Edit this pharmacy", match: :first

    fill_in "Address", with: @pharmacy.address
    fill_in "Email", with: @pharmacy.email
    fill_in "Name", with: @pharmacy.name
    fill_in "Phone", with: @pharmacy.phone
    click_on "Update Pharmacy"

    assert_text "Pharmacy was successfully updated"
    click_on "Back"
  end

  test "should destroy Pharmacy" do
    visit pharmacy_url(@pharmacy)
    click_on "Destroy this pharmacy", match: :first

    assert_text "Pharmacy was successfully destroyed"
  end
end

require "application_system_test_case"

class PatientPharmaciesTest < ApplicationSystemTestCase
  setup do
    @patient_pharmacy = patient_pharmacies(:one)
  end

  test "visiting the index" do
    visit patient_pharmacies_url
    assert_selector "h1", text: "Patient pharmacies"
  end

  test "should create patient pharmacy" do
    visit patient_pharmacies_url
    click_on "New patient pharmacy"

    fill_in "Patient", with: @patient_pharmacy.patient_id
    fill_in "Pharmacy", with: @patient_pharmacy.pharmacy_id
    check "Preferred" if @patient_pharmacy.preferred
    click_on "Create Patient pharmacy"

    assert_text "Patient pharmacy was successfully created"
    click_on "Back"
  end

  test "should update Patient pharmacy" do
    visit patient_pharmacy_url(@patient_pharmacy)
    click_on "Edit this patient pharmacy", match: :first

    fill_in "Patient", with: @patient_pharmacy.patient_id
    fill_in "Pharmacy", with: @patient_pharmacy.pharmacy_id
    check "Preferred" if @patient_pharmacy.preferred
    click_on "Update Patient pharmacy"

    assert_text "Patient pharmacy was successfully updated"
    click_on "Back"
  end

  test "should destroy Patient pharmacy" do
    visit patient_pharmacy_url(@patient_pharmacy)
    click_on "Destroy this patient pharmacy", match: :first

    assert_text "Patient pharmacy was successfully destroyed"
  end
end

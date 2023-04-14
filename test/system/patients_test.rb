require "application_system_test_case"

class PatientsTest < ApplicationSystemTestCase
  setup do
    @patient = patients(:one)
  end

  test "visiting the index" do
    visit patients_url
    assert_selector "h1", text: "Patients"
  end

  test "should create patient" do
    visit patients_url
    click_on "New patient"

    fill_in "Archived at", with: @patient.archived_at
    fill_in "Dob", with: @patient.dob
    fill_in "Full name", with: @patient.full_name
    fill_in "Gender", with: @patient.gender
    fill_in "Health card", with: @patient.health_card
    fill_in "Notes", with: @patient.notes
    fill_in "User", with: @patient.user_id
    fill_in "Version code", with: @patient.version_code
    click_on "Create Patient"

    assert_text "Patient was successfully created"
    click_on "Back"
  end

  test "should update Patient" do
    visit patient_url(@patient)
    click_on "Edit this patient", match: :first

    fill_in "Archived at", with: @patient.archived_at
    fill_in "Dob", with: @patient.dob
    fill_in "Full name", with: @patient.full_name
    fill_in "Gender", with: @patient.gender
    fill_in "Health card", with: @patient.health_card
    fill_in "Notes", with: @patient.notes
    fill_in "User", with: @patient.user_id
    fill_in "Version code", with: @patient.version_code
    click_on "Update Patient"

    assert_text "Patient was successfully updated"
    click_on "Back"
  end

  test "should destroy Patient" do
    visit patient_url(@patient)
    click_on "Destroy this patient", match: :first

    assert_text "Patient was successfully destroyed"
  end
end

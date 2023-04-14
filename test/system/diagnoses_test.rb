require "application_system_test_case"

class DiagnosesTest < ApplicationSystemTestCase
  setup do
    @diagnosis = diagnoses(:one)
  end

  test "visiting the index" do
    visit diagnoses_url
    assert_selector "h1", text: "Diagnoses"
  end

  test "should create diagnosis" do
    visit diagnoses_url
    click_on "New diagnosis"

    fill_in "Name", with: @diagnosis.name
    click_on "Create Diagnosis"

    assert_text "Diagnosis was successfully created"
    click_on "Back"
  end

  test "should update Diagnosis" do
    visit diagnosis_url(@diagnosis)
    click_on "Edit this diagnosis", match: :first

    fill_in "Name", with: @diagnosis.name
    click_on "Update Diagnosis"

    assert_text "Diagnosis was successfully updated"
    click_on "Back"
  end

  test "should destroy Diagnosis" do
    visit diagnosis_url(@diagnosis)
    click_on "Destroy this diagnosis", match: :first

    assert_text "Diagnosis was successfully destroyed"
  end
end

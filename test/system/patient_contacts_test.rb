require "application_system_test_case"

class PatientContactsTest < ApplicationSystemTestCase
  setup do
    @patient_contact = patient_contacts(:one)
  end

  test "visiting the index" do
    visit patient_contacts_url
    assert_selector "h1", text: "Patient contacts"
  end

  test "should create patient contact" do
    visit patient_contacts_url
    click_on "New patient contact"

    fill_in "Address", with: @patient_contact.address
    fill_in "Contact method", with: @patient_contact.contact_method
    fill_in "Email", with: @patient_contact.email
    fill_in "Name", with: @patient_contact.name
    fill_in "Notes", with: @patient_contact.notes
    fill_in "Patient", with: @patient_contact.patient_id
    fill_in "Phone", with: @patient_contact.phone
    check "Primary" if @patient_contact.primary
    click_on "Create Patient contact"

    assert_text "Patient contact was successfully created"
    click_on "Back"
  end

  test "should update Patient contact" do
    visit patient_contact_url(@patient_contact)
    click_on "Edit this patient contact", match: :first

    fill_in "Address", with: @patient_contact.address
    fill_in "Contact method", with: @patient_contact.contact_method
    fill_in "Email", with: @patient_contact.email
    fill_in "Name", with: @patient_contact.name
    fill_in "Notes", with: @patient_contact.notes
    fill_in "Patient", with: @patient_contact.patient_id
    fill_in "Phone", with: @patient_contact.phone
    check "Primary" if @patient_contact.primary
    click_on "Update Patient contact"

    assert_text "Patient contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Patient contact" do
    visit patient_contact_url(@patient_contact)
    click_on "Destroy this patient contact", match: :first

    assert_text "Patient contact was successfully destroyed"
  end
end

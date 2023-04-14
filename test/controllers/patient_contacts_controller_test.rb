require "test_helper"

class PatientContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_contact = patient_contacts(:one)
  end

  test "should get index" do
    get patient_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_contact_url
    assert_response :success
  end

  test "should create patient_contact" do
    assert_difference("PatientContact.count") do
      post patient_contacts_url, params: { patient_contact: { address: @patient_contact.address, contact_method: @patient_contact.contact_method, email: @patient_contact.email, name: @patient_contact.name, notes: @patient_contact.notes, patient_id: @patient_contact.patient_id, phone: @patient_contact.phone, primary: @patient_contact.primary } }
    end

    assert_redirected_to patient_contact_url(PatientContact.last)
  end

  test "should show patient_contact" do
    get patient_contact_url(@patient_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_contact_url(@patient_contact)
    assert_response :success
  end

  test "should update patient_contact" do
    patch patient_contact_url(@patient_contact), params: { patient_contact: { address: @patient_contact.address, contact_method: @patient_contact.contact_method, email: @patient_contact.email, name: @patient_contact.name, notes: @patient_contact.notes, patient_id: @patient_contact.patient_id, phone: @patient_contact.phone, primary: @patient_contact.primary } }
    assert_redirected_to patient_contact_url(@patient_contact)
  end

  test "should destroy patient_contact" do
    assert_difference("PatientContact.count", -1) do
      delete patient_contact_url(@patient_contact)
    end

    assert_redirected_to patient_contacts_url
  end
end

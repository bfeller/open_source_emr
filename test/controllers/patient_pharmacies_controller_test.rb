require "test_helper"

class PatientPharmaciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_pharmacy = patient_pharmacies(:one)
  end

  test "should get index" do
    get patient_pharmacies_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_pharmacy_url
    assert_response :success
  end

  test "should create patient_pharmacy" do
    assert_difference("PatientPharmacy.count") do
      post patient_pharmacies_url, params: { patient_pharmacy: { patient_id: @patient_pharmacy.patient_id, pharmacy_id: @patient_pharmacy.pharmacy_id, preferred: @patient_pharmacy.preferred } }
    end

    assert_redirected_to patient_pharmacy_url(PatientPharmacy.last)
  end

  test "should show patient_pharmacy" do
    get patient_pharmacy_url(@patient_pharmacy)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_pharmacy_url(@patient_pharmacy)
    assert_response :success
  end

  test "should update patient_pharmacy" do
    patch patient_pharmacy_url(@patient_pharmacy), params: { patient_pharmacy: { patient_id: @patient_pharmacy.patient_id, pharmacy_id: @patient_pharmacy.pharmacy_id, preferred: @patient_pharmacy.preferred } }
    assert_redirected_to patient_pharmacy_url(@patient_pharmacy)
  end

  test "should destroy patient_pharmacy" do
    assert_difference("PatientPharmacy.count", -1) do
      delete patient_pharmacy_url(@patient_pharmacy)
    end

    assert_redirected_to patient_pharmacies_url
  end
end

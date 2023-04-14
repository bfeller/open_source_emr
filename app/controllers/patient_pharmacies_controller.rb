class PatientPharmaciesController < ApplicationController
  before_action :set_patient_pharmacy, only: [:update, :destroy]
  before_action :authenticate_user!

  # POST /patient_pharmacies
  def create
    @patient_pharmacy = PatientPharmacy.new(patient_pharmacy_params)

    if @patient_pharmacy.save
      redirect_to patient_pharmacies_url, notice: 'Patient pharmacy was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /patient_pharmacies/1
  def update
    if @patient_pharmacy.update(patient_pharmacy_params)
      redirect_back fallback_location: root_path, notice: 'Patient pharmacy was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /patient_pharmacies/1
  def destroy
    @patient_pharmacy.destroy
    redirect_back fallback_location: patient_pharmacies_url, notice: 'Patient pharmacy was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_pharmacy
      @patient_pharmacy = PatientPharmacy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_pharmacy_params
      params.require(:patient_pharmacy).permit(:patient_id, :pharmacy_id, :preferred)
    end
end

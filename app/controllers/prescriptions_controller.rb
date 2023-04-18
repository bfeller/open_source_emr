class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # POST /prescriptions
  def create
    @prescription = Prescription.new(prescription_params)

    if @prescription.save
      redirect_to appointment_path(@prescription.treatment.appointment), notice: 'Prescription was successfully created.'
    else
      flash[:error] = @prescription.errors.full_messages.to_sentence
      redirect_back fallback_location: prescriptions_url
    end
  end

  # PATCH/PUT /prescriptions/1
  def update
    if @prescription.update(prescription_params)
      redirect_to appointment_path(@prescription.treatment.appointment), notice: 'Prescription was successfully updated.'
    else
      flash[:error] = @prescription.errors.full_messages.to_sentence
      redirect_back fallback_location: prescriptions_url
    end
  end

  # DELETE /prescriptions/1
  def destroy
    @prescription.destroy
    redirect_back fallback_location: prescriptions_url, notice: 'Prescription was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prescription_params
      params.require(:prescription).permit(:patient_id, :notes, :name, :dosage, :frequency, :user_id, :treatment_id)
    end
end

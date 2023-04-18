class PatientContactsController < ApplicationController
  before_action :set_patient_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # POST /patient_contacts
  def create
    @patient_contact = PatientContact.new(patient_contact_params)

    if @patient_contact.save
      redirect_back fallback_location: root_path, notice: 'Patient contact was successfully created.'
    else
      flash[:error] = @patient_contact.errors.full_messages.join(", ")
      redirect_back fallback_location: root_path
    end
  end

  # PATCH/PUT /patient_contacts/1
  def update
    if @patient_contact.update(patient_contact_params)
      redirect_back fallback_location: root_path, notice: 'Patient contact was successfully updated.'
    else
      flash[:error] = @patient_contact.errors.full_messages.join(", ")
      redirect_back fallback_location: root_path
    end
  end

  # DELETE /patient_contacts/1
  def destroy
    @patient_contact.destroy
    redirect_back fallback_location: patient_contacts_url, notice: 'Patient contact was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_contact
      @patient_contact = PatientContact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_contact_params
      params.require(:patient_contact).permit(:name, :patient_id, :primary, :phone, :email, :address, :contact_method, :name, :notes)
    end
end

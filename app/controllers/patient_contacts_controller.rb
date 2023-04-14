class PatientContactsController < ApplicationController
  before_action :set_patient_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /patient_contacts
  def index
    @patient_contacts = PatientContact.all
  end

  # GET /patient_contacts/1
  def show
  end

  # GET /patient_contacts/new
  def new
    @patient_contact = PatientContact.new
  end

  # GET /patient_contacts/1/edit
  def edit
  end

  # POST /patient_contacts
  def create
    @patient_contact = PatientContact.new(patient_contact_params)

    if @patient_contact.save
      redirect_to patient_contacts_url, notice: 'Patient contact was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /patient_contacts/1
  def update
    if @patient_contact.update(patient_contact_params)
      redirect_back fallback_location: root_path, notice: 'Patient contact was successfully updated.'
    else
      render :edit
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

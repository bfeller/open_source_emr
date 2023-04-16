class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /patients
  def index
    @patients = Patient.all.limit(40)
  end

  def search
    @patients = Patient.where("full_name ILIKE ?", "%#{params[:query]}%")
    render layout: false
  end

  # GET /patients/1
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patients_url, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /patients/1
  def update
    if @patient.update(patient_params)
      redirect_back fallback_location: root_path, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /patients/1
  def destroy
    pid = @patient.id
    @patient.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{pid}_patient") }
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:full_name, :dob, :user_id, :gender, :health_card, :version_code, :archived_at, :notes)
    end
end

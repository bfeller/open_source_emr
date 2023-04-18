class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /appointments
  def index
    if params[:start] && params[:end]
      @appointments = Appointment.where(start_time: params[:start]..params[:end])
    else
      @appointments = Appointment.where(start_time: Date.today.beginning_of_day..Date.today.end_of_day)
    end
  end

  def calendar_columns
    @users = User.all
    respond_to do |format|
      format.json { render :calendar_columns }
    end
  end
  # GET /appointments/1
  def show
    @note = Note.new
    @treatment = Treatment.new
    @diagnoses = Diagnosis.all
    @prescription = Prescription.new
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to calendar_path, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      respond_to do |format|
        format.html { redirect_to calendar_path, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      end
    else
      render :edit
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    redirect_to calendar_path, notice: 'Appointment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:patient_id, :user_id, :start_time, :end_time, :reception_notes)
    end
end

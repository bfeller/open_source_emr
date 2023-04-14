class TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /treatments
  def index
    @treatments = Treatment.all
  end

  # GET /treatments/1
  def show
  end

  # GET /treatments/new
  def new
    @treatment = Treatment.new
  end

  # GET /treatments/1/edit
  def edit
  end

  # POST /treatments
  def create
    @treatment = Treatment.new(treatment_params)

    if @treatment.save
      redirect_to treatments_url, notice: 'Treatment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /treatments/1
  def update
    if @treatment.update(treatment_params)
      redirect_back fallback_location: root_path, notice: 'Treatment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /treatments/1
  def destroy
    @treatment.destroy
    redirect_back fallback_location: treatments_url, notice: 'Treatment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment
      @treatment = Treatment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treatment_params
      params.require(:treatment).permit(:diagnosis_id, :patient_id, :user_id, :appointment_id, :name)
    end
end

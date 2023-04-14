class DiagnosesController < ApplicationController
  before_action :set_diagnosis, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /diagnoses
  def index
    @diagnoses = Diagnosis.all
  end

  # GET /diagnoses/1
  def show
  end

  # GET /diagnoses/new
  def new
    @diagnosis = Diagnosis.new
  end

  # GET /diagnoses/1/edit
  def edit
  end

  # POST /diagnoses
  def create
    @diagnosis = Diagnosis.new(diagnosis_params)

    if @diagnosis.save
      redirect_to diagnoses_url, notice: 'Diagnosis was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /diagnoses/1
  def update
    if @diagnosis.update(diagnosis_params)
      redirect_back fallback_location: root_path, notice: 'Diagnosis was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /diagnoses/1
  def destroy
    @diagnosis.destroy
    redirect_back fallback_location: diagnoses_url, notice: 'Diagnosis was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnosis
      @diagnosis = Diagnosis.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diagnosis_params
      params.require(:diagnosis).permit(:name)
    end
end

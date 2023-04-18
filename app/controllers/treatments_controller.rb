class TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # POST /treatments
  def create
    @treatment = Treatment.new(treatment_params)

    if @treatment.save
      redirect_to appointment_path(@treatment.appointment), notice: 'Treatment was successfully created.'
    else
      flash[:error] = @treatment.errors.full_messages.to_sentence
      redirect_back fallback_location: treatments_url
    end
  end

  # PATCH/PUT /treatments/1
  def update
    if @treatment.update(treatment_params)
      redirect_back fallback_location: root_path, notice: 'Treatment was successfully updated.'
    else
      flash[:error] = @treatment.errors.full_messages.to_sentence
      redirect_back fallback_location: treatments_url
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

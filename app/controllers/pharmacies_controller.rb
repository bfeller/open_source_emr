class PharmaciesController < ApplicationController
  before_action :set_pharmacy, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pharmacies
  def index
    @pharmacies = Pharmacy.all
  end

  # GET /pharmacies/1
  def show
  end

  # GET /pharmacies/new
  def new
    @pharmacy = Pharmacy.new
  end

  # GET /pharmacies/1/edit
  def edit
  end

  # POST /pharmacies
  def create
    @pharmacy = Pharmacy.new(pharmacy_params)

    if @pharmacy.save
      redirect_to pharmacies_url, notice: 'Pharmacy was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pharmacies/1
  def update
    if @pharmacy.update(pharmacy_params)
      redirect_back fallback_location: root_path, notice: 'Pharmacy was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pharmacies/1
  def destroy
    @pharmacy.destroy
    redirect_back fallback_location: pharmacies_url, notice: 'Pharmacy was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pharmacy
      @pharmacy = Pharmacy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pharmacy_params
      params.require(:pharmacy).permit(:name, :address, :phone, :email, :notes)
    end
end

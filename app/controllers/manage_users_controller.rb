class ManageUsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_special, except: [:edit, :update]

  # GET /patients
  def index
    @users = User.all
  end


  # GET /patients/new
  def new
    @user = User.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  def create
    if current_user.admin?
      @user = User.new(user_params)

    else
      @user = current_user
    end
      if @user.save
        redirect_to manage_users_path, notice: 'User was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /patients/1
  def update
    if current_user.admin? || @user == current_user
      params[:user].delete(:password) if params[:user][:password].blank?
      params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
      if @user.update(user_params)
        redirect_back fallback_location: root_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    else
      flash[:error] = 'You do not have sufficient permissions to perform this action.'
      redirect_back fallback_location: root_path
    end
  end

  # DELETE /patients/1
  def destroy
    @user.destroy
    redirect_to manage_users_path, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :full_name, 
        :password,
        :password_confirmation,
        :admin
      )
    end

    def admin_special
      unless current_user.admin?
        flash[:notice] = 'You do not have sufficient permissions to perform this action.'
        redirect_back fallback_location: root_path
      end
    end
end

class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_back fallback_location: notes_url, notice: 'Note was successfully created.'
    else
      flash[:error] = @note.errors.full_messages.to_sentence
      redirect_back fallback_location: notes_url
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      redirect_back fallback_location: notes_url, notice: 'Note was successfully updated.'
    else
      flash[:error] = @note.errors.full_messages.to_sentence
      redirect_back fallback_location: notes_url
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
    redirect_back fallback_location: notes_url, notice: 'Note was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:appointment_id, :treatment_id, :user_id, :body)
    end
end

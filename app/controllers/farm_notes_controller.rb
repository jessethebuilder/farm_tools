class FarmNotesController < ApplicationController
  before_action :set_farm_note, only: [:show, :edit, :update, :destroy]

  # GET /farm_notes
  def index
    @farm_notes = FarmNote.all
  end

  # GET /farm_notes/1
  def show
  end

  # GET /farm_notes/new
  def new
    @farm_note = FarmNote.new
  end

  # GET /farm_notes/1/edit
  def edit
  end

  # POST /farm_notes
  def create
    @farm_note = FarmNote.new(farm_note_params)

    if @farm_note.save
      redirect_to @farm_note, notice: 'Farm note was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /farm_notes/1
  def update
    if @farm_note.update(farm_note_params)
      redirect_to @farm_note, notice: 'Farm note was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farm_notes/1
  def destroy
    @farm_note.destroy
    redirect_to farm_notes_url, notice: 'Farm note was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm_note
      @farm_note = FarmNote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def farm_note_params
      params.require(:farm_note).permit(:has_farm_notes_id, :has_farm_notes_type, :content)
    end
end

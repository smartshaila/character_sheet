class LevelProgressionsController < ApplicationController
  before_action :set_level_progression, only: [:show, :edit, :update, :destroy]

  # GET /level_progressions
  # GET /level_progressions.json
  def index
    @level_progressions = LevelProgression.all
  end

  # GET /level_progressions/1
  # GET /level_progressions/1.json
  def show
  end

  # GET /level_progressions/new
  def new
    @level_progression = LevelProgression.new
  end

  # GET /level_progressions/1/edit
  def edit
  end

  # POST /level_progressions
  # POST /level_progressions.json
  def create
    @level_progression = LevelProgression.new(level_progression_params)

    respond_to do |format|
      if @level_progression.save
        format.html { redirect_to @level_progression, notice: 'Level progression was successfully created.' }
        format.json { render :show, status: :created, location: @level_progression }
      else
        format.html { render :new }
        format.json { render json: @level_progression.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /level_progressions/1
  # PATCH/PUT /level_progressions/1.json
  def update
    respond_to do |format|
      if @level_progression.update(level_progression_params)
        format.html { redirect_to @level_progression, notice: 'Level progression was successfully updated.' }
        format.json { render :show, status: :ok, location: @level_progression }
      else
        format.html { render :edit }
        format.json { render json: @level_progression.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /level_progressions/1
  # DELETE /level_progressions/1.json
  def destroy
    @level_progression.destroy
    respond_to do |format|
      format.html { redirect_to level_progressions_url, notice: 'Level progression was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level_progression
      @level_progression = LevelProgression.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_progression_params
      params.require(:level_progression).permit(:level, :proficiency, :min_xp)
    end
end

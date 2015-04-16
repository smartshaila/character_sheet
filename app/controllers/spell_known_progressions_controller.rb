class SpellKnownProgressionsController < ApplicationController
  before_action :set_spell_known_progression, only: [:show, :edit, :update, :destroy]

  # GET /spell_known_progressions
  # GET /spell_known_progressions.json
  def index
    @spell_known_progressions = SpellKnownProgression.all
  end

  # GET /spell_known_progressions/1
  # GET /spell_known_progressions/1.json
  def show
  end

  # GET /spell_known_progressions/new
  def new
    @spell_known_progression = SpellKnownProgression.new
  end

  # GET /spell_known_progressions/1/edit
  def edit
  end

  # POST /spell_known_progressions
  # POST /spell_known_progressions.json
  def create
    @spell_known_progression = SpellKnownProgression.new(spell_known_progression_params)

    respond_to do |format|
      if @spell_known_progression.save
        format.html { redirect_to @spell_known_progression, notice: 'Spell known progression was successfully created.' }
        format.json { render :show, status: :created, location: @spell_known_progression }
      else
        format.html { render :new }
        format.json { render json: @spell_known_progression.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spell_known_progressions/1
  # PATCH/PUT /spell_known_progressions/1.json
  def update
    respond_to do |format|
      if @spell_known_progression.update(spell_known_progression_params)
        format.html { redirect_to @spell_known_progression, notice: 'Spell known progression was successfully updated.' }
        format.json { render :show, status: :ok, location: @spell_known_progression }
      else
        format.html { render :edit }
        format.json { render json: @spell_known_progression.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spell_known_progressions/1
  # DELETE /spell_known_progressions/1.json
  def destroy
    @spell_known_progression.destroy
    respond_to do |format|
      format.html { redirect_to spell_known_progressions_url, notice: 'Spell known progression was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spell_known_progression
      @spell_known_progression = SpellKnownProgression.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spell_known_progression_params
      params.require(:spell_known_progression).permit(:adventuring_class_id, :subclass_id, :level_progression_id, :value)
    end
end

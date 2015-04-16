class SpellProgressionsController < ApplicationController
  before_action :set_spell_progression, only: [:show, :edit, :update, :destroy]

  # GET /spell_progressions
  # GET /spell_progressions.json
  def index
    @spell_progressions = SpellProgression.all
  end

  # GET /spell_progressions/1
  # GET /spell_progressions/1.json
  def show
  end

  # GET /spell_progressions/new
  def new
    @spell_progression = SpellProgression.new
  end

  # GET /spell_progressions/1/edit
  def edit
  end

  # POST /spell_progressions
  # POST /spell_progressions.json
  def create
    @spell_progression = SpellProgression.new(spell_progression_params)

    respond_to do |format|
      if @spell_progression.save
        format.html { redirect_to @spell_progression, notice: 'Spell progression was successfully created.' }
        format.json { render :show, status: :created, location: @spell_progression }
      else
        format.html { render :new }
        format.json { render json: @spell_progression.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spell_progressions/1
  # PATCH/PUT /spell_progressions/1.json
  def update
    respond_to do |format|
      if @spell_progression.update(spell_progression_params)
        format.html { redirect_to @spell_progression, notice: 'Spell progression was successfully updated.' }
        format.json { render :show, status: :ok, location: @spell_progression }
      else
        format.html { render :edit }
        format.json { render json: @spell_progression.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spell_progressions/1
  # DELETE /spell_progressions/1.json
  def destroy
    @spell_progression.destroy
    respond_to do |format|
      format.html { redirect_to spell_progressions_url, notice: 'Spell progression was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spell_progression
      @spell_progression = SpellProgression.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spell_progression_params
      params.require(:spell_progression).permit(:adventuring_class_id, :subclass_id, :level_progression_id, :spell_level, :slots)
    end
end

class KnownSpellsController < ApplicationController
  before_action :set_known_spell, only: [:show, :edit, :update, :destroy]

  # GET /known_spells
  # GET /known_spells.json
  def index
    @known_spells = KnownSpell.all
  end

  # GET /known_spells/1
  # GET /known_spells/1.json
  def show
  end

  # GET /known_spells/new
  def new
    @known_spell = KnownSpell.new
  end

  # GET /known_spells/1/edit
  def edit
  end

  # POST /known_spells
  # POST /known_spells.json
  def create
    @known_spell = KnownSpell.new(known_spell_params)

    respond_to do |format|
      if @known_spell.save
        format.html { redirect_to @known_spell, notice: 'Known spell was successfully created.' }
        format.json { render :show, status: :created, location: @known_spell }
      else
        format.html { render :new }
        format.json { render json: @known_spell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /known_spells/1
  # PATCH/PUT /known_spells/1.json
  def update
    respond_to do |format|
      if @known_spell.update(known_spell_params)
        format.html { redirect_to @known_spell, notice: 'Known spell was successfully updated.' }
        format.json { render :show, status: :ok, location: @known_spell }
      else
        format.html { render :edit }
        format.json { render json: @known_spell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /known_spells/1
  # DELETE /known_spells/1.json
  def destroy
    @known_spell.destroy
    respond_to do |format|
      format.html { redirect_to known_spells_url, notice: 'Known spell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_known_spell
      @known_spell = KnownSpell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def known_spell_params
      params.require(:known_spell).permit(:character_id, :spell_id)
    end
end

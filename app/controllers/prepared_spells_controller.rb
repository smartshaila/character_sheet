class PreparedSpellsController < ApplicationController
  before_action :set_prepared_spell, only: [:show, :edit, :update, :destroy]

  # GET /prepared_spells
  # GET /prepared_spells.json
  def index
    @prepared_spells = PreparedSpell.all
  end

  # GET /prepared_spells/1
  # GET /prepared_spells/1.json
  def show
  end

  # GET /prepared_spells/new
  def new
    @prepared_spell = PreparedSpell.new
  end

  # GET /prepared_spells/1/edit
  def edit
  end

  # POST /prepared_spells
  # POST /prepared_spells.json
  def create
    @prepared_spell = PreparedSpell.new(prepared_spell_params)

    respond_to do |format|
      if @prepared_spell.save
        format.html { redirect_to @prepared_spell, notice: 'Prepared spell was successfully created.' }
        format.json { render :show, status: :created, location: @prepared_spell }
      else
        format.html { render :new }
        format.json { render json: @prepared_spell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prepared_spells/1
  # PATCH/PUT /prepared_spells/1.json
  def update
    respond_to do |format|
      if @prepared_spell.update(prepared_spell_params)
        format.html { redirect_to @prepared_spell, notice: 'Prepared spell was successfully updated.' }
        format.json { render :show, status: :ok, location: @prepared_spell }
      else
        format.html { render :edit }
        format.json { render json: @prepared_spell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prepared_spells/1
  # DELETE /prepared_spells/1.json
  def destroy
    @prepared_spell.destroy
    respond_to do |format|
      format.html { redirect_to prepared_spells_url, notice: 'Prepared spell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prepared_spell
      @prepared_spell = PreparedSpell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prepared_spell_params
      params.require(:prepared_spell).permit(:character_id, :spell_id, :is_cast)
    end
end

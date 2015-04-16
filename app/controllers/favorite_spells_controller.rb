class FavoriteSpellsController < ApplicationController
  before_action :set_favorite_spell, only: [:show, :edit, :update, :destroy]

  # GET /favorite_spells
  # GET /favorite_spells.json
  def index
    @favorite_spells = FavoriteSpell.all
  end

  # GET /favorite_spells/1
  # GET /favorite_spells/1.json
  def show
  end

  # GET /favorite_spells/new
  def new
    @favorite_spell = FavoriteSpell.new
  end

  # GET /favorite_spells/1/edit
  def edit
  end

  # POST /favorite_spells
  # POST /favorite_spells.json
  def create
    @favorite_spell = FavoriteSpell.new(favorite_spell_params)

    respond_to do |format|
      if @favorite_spell.save
        format.html { redirect_to @favorite_spell, notice: 'Favorite spell was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_spell }
      else
        format.html { render :new }
        format.json { render json: @favorite_spell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_spells/1
  # PATCH/PUT /favorite_spells/1.json
  def update
    respond_to do |format|
      if @favorite_spell.update(favorite_spell_params)
        format.html { redirect_to @favorite_spell, notice: 'Favorite spell was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_spell }
      else
        format.html { render :edit }
        format.json { render json: @favorite_spell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_spells/1
  # DELETE /favorite_spells/1.json
  def destroy
    @favorite_spell.destroy
    respond_to do |format|
      format.html { redirect_to favorite_spells_url, notice: 'Favorite spell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_spell
      @favorite_spell = FavoriteSpell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_spell_params
      params.require(:favorite_spell).permit(:player_id, :spell_id)
    end
end

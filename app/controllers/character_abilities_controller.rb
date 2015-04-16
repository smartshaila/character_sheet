class CharacterAbilitiesController < ApplicationController
  before_action :set_character_ability, only: [:show, :edit, :update, :destroy]

  # GET /character_abilities
  # GET /character_abilities.json
  def index
    @character_abilities = CharacterAbility.all
  end

  # GET /character_abilities/1
  # GET /character_abilities/1.json
  def show
  end

  # GET /character_abilities/new
  def new
    @character_ability = CharacterAbility.new
  end

  # GET /character_abilities/1/edit
  def edit
  end

  # POST /character_abilities
  # POST /character_abilities.json
  def create
    @character_ability = CharacterAbility.new(character_ability_params)

    respond_to do |format|
      if @character_ability.save
        format.html { redirect_to @character_ability, notice: 'Character ability was successfully created.' }
        format.json { render :show, status: :created, location: @character_ability }
      else
        format.html { render :new }
        format.json { render json: @character_ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_abilities/1
  # PATCH/PUT /character_abilities/1.json
  def update
    respond_to do |format|
      if @character_ability.update(character_ability_params)
        format.html { redirect_to @character_ability, notice: 'Character ability was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_ability }
      else
        format.html { render :edit }
        format.json { render json: @character_ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_abilities/1
  # DELETE /character_abilities/1.json
  def destroy
    @character_ability.destroy
    respond_to do |format|
      format.html { redirect_to character_abilities_url, notice: 'Character ability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_ability
      @character_ability = CharacterAbility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_ability_params
      params.require(:character_ability).permit(:character_id, :ability_id, :value)
    end
end

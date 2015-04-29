class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.all
  end

  # GET /characters/1
  # GET /characters/1.json
  def show

  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    result = @character.update(character_params)
    ca = params[:character_abilities]
    unless ca.nil?
      ca.each do |ability|
        character_ability = CharacterAbility.find(ability[:id])
        result &= character_ability.update(value: ability[:value])
      end
    end
    cs = params[:skills]
    unless cs.nil?
      cs = cs.select{|skill| skill[:proficient]}
      CharacterSkill.where(character: @character).destroy_all
      cs.each do |skill|
        result &= CharacterSkill.create(character: @character, skill_id: skill[:id])
      end
    end
    respond_to do |format|
      if result
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name, :race, :player_id, :campaign_id, :alignment, :current_xp, :max_hp, :current_hp, :speed, :notes, :has_inspiration, :adventuring_class_id, :character_abilities, :character_skills)
    end
end

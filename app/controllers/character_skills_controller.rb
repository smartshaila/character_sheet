class CharacterSkillsController < ApplicationController
  before_action :set_character_skill, only: [:show, :edit, :update, :destroy]

  # GET /character_skills
  # GET /character_skills.json
  def index
    @character_skills = CharacterSkill.all
  end

  # GET /character_skills/1
  # GET /character_skills/1.json
  def show
  end

  # GET /character_skills/new
  def new
    @character_skill = CharacterSkill.new
  end

  # GET /character_skills/1/edit
  def edit
  end

  # POST /character_skills
  # POST /character_skills.json
  def create
    @character_skill = CharacterSkill.new(character_skill_params)

    respond_to do |format|
      if @character_skill.save
        format.html { redirect_to @character_skill, notice: 'Character skill was successfully created.' }
        format.json { render :show, status: :created, location: @character_skill }
      else
        format.html { render :new }
        format.json { render json: @character_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_skills/1
  # PATCH/PUT /character_skills/1.json
  def update
    respond_to do |format|
      if @character_skill.update(character_skill_params)
        format.html { redirect_to @character_skill, notice: 'Character skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_skill }
      else
        format.html { render :edit }
        format.json { render json: @character_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_skills/1
  # DELETE /character_skills/1.json
  def destroy
    @character_skill.destroy
    respond_to do |format|
      format.html { redirect_to character_skills_url, notice: 'Character skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_skill
      @character_skill = CharacterSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_skill_params
      params.require(:character_skill).permit(:character_id, :skill_id)
    end
end

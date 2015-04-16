class SpellMaterialsController < ApplicationController
  before_action :set_spell_material, only: [:show, :edit, :update, :destroy]

  # GET /spell_materials
  # GET /spell_materials.json
  def index
    @spell_materials = SpellMaterial.all
  end

  # GET /spell_materials/1
  # GET /spell_materials/1.json
  def show
  end

  # GET /spell_materials/new
  def new
    @spell_material = SpellMaterial.new
  end

  # GET /spell_materials/1/edit
  def edit
  end

  # POST /spell_materials
  # POST /spell_materials.json
  def create
    @spell_material = SpellMaterial.new(spell_material_params)

    respond_to do |format|
      if @spell_material.save
        format.html { redirect_to @spell_material, notice: 'Spell material was successfully created.' }
        format.json { render :show, status: :created, location: @spell_material }
      else
        format.html { render :new }
        format.json { render json: @spell_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spell_materials/1
  # PATCH/PUT /spell_materials/1.json
  def update
    respond_to do |format|
      if @spell_material.update(spell_material_params)
        format.html { redirect_to @spell_material, notice: 'Spell material was successfully updated.' }
        format.json { render :show, status: :ok, location: @spell_material }
      else
        format.html { render :edit }
        format.json { render json: @spell_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spell_materials/1
  # DELETE /spell_materials/1.json
  def destroy
    @spell_material.destroy
    respond_to do |format|
      format.html { redirect_to spell_materials_url, notice: 'Spell material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spell_material
      @spell_material = SpellMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spell_material_params
      params.require(:spell_material).permit(:spell_id, :description, :value, :is_consumed)
    end
end

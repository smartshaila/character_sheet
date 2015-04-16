class ClassSpellsController < ApplicationController
  before_action :set_class_spell, only: [:show, :edit, :update, :destroy]

  # GET /class_spells
  # GET /class_spells.json
  def index
    @class_spells = ClassSpell.all
  end

  # GET /class_spells/1
  # GET /class_spells/1.json
  def show
  end

  # GET /class_spells/new
  def new
    @class_spell = ClassSpell.new
  end

  # GET /class_spells/1/edit
  def edit
  end

  # POST /class_spells
  # POST /class_spells.json
  def create
    @class_spell = ClassSpell.new(class_spell_params)

    respond_to do |format|
      if @class_spell.save
        format.html { redirect_to @class_spell, notice: 'Class spell was successfully created.' }
        format.json { render :show, status: :created, location: @class_spell }
      else
        format.html { render :new }
        format.json { render json: @class_spell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_spells/1
  # PATCH/PUT /class_spells/1.json
  def update
    respond_to do |format|
      if @class_spell.update(class_spell_params)
        format.html { redirect_to @class_spell, notice: 'Class spell was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_spell }
      else
        format.html { render :edit }
        format.json { render json: @class_spell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_spells/1
  # DELETE /class_spells/1.json
  def destroy
    @class_spell.destroy
    respond_to do |format|
      format.html { redirect_to class_spells_url, notice: 'Class spell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_spell
      @class_spell = ClassSpell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_spell_params
      params.require(:class_spell).permit(:adventuring_class_id, :subclass_id, :spell_id)
    end
end

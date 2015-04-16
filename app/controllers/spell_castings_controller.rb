class SpellCastingsController < ApplicationController
  before_action :set_spell_casting, only: [:show, :edit, :update, :destroy]

  # GET /spell_castings
  # GET /spell_castings.json
  def index
    @spell_castings = SpellCasting.all
  end

  # GET /spell_castings/1
  # GET /spell_castings/1.json
  def show
  end

  # GET /spell_castings/new
  def new
    @spell_casting = SpellCasting.new
  end

  # GET /spell_castings/1/edit
  def edit
  end

  # POST /spell_castings
  # POST /spell_castings.json
  def create
    @spell_casting = SpellCasting.new(spell_casting_params)

    respond_to do |format|
      if @spell_casting.save
        format.html { redirect_to @spell_casting, notice: 'Spell casting was successfully created.' }
        format.json { render :show, status: :created, location: @spell_casting }
      else
        format.html { render :new }
        format.json { render json: @spell_casting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spell_castings/1
  # PATCH/PUT /spell_castings/1.json
  def update
    respond_to do |format|
      if @spell_casting.update(spell_casting_params)
        format.html { redirect_to @spell_casting, notice: 'Spell casting was successfully updated.' }
        format.json { render :show, status: :ok, location: @spell_casting }
      else
        format.html { render :edit }
        format.json { render json: @spell_casting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spell_castings/1
  # DELETE /spell_castings/1.json
  def destroy
    @spell_casting.destroy
    respond_to do |format|
      format.html { redirect_to spell_castings_url, notice: 'Spell casting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spell_casting
      @spell_casting = SpellCasting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spell_casting_params
      params.require(:spell_casting).permit(:spell_id, :time_increment_id, :value)
    end
end

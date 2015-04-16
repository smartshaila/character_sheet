class SpellRangesController < ApplicationController
  before_action :set_spell_range, only: [:show, :edit, :update, :destroy]

  # GET /spell_ranges
  # GET /spell_ranges.json
  def index
    @spell_ranges = SpellRange.all
  end

  # GET /spell_ranges/1
  # GET /spell_ranges/1.json
  def show
  end

  # GET /spell_ranges/new
  def new
    @spell_range = SpellRange.new
  end

  # GET /spell_ranges/1/edit
  def edit
  end

  # POST /spell_ranges
  # POST /spell_ranges.json
  def create
    @spell_range = SpellRange.new(spell_range_params)

    respond_to do |format|
      if @spell_range.save
        format.html { redirect_to @spell_range, notice: 'Spell range was successfully created.' }
        format.json { render :show, status: :created, location: @spell_range }
      else
        format.html { render :new }
        format.json { render json: @spell_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spell_ranges/1
  # PATCH/PUT /spell_ranges/1.json
  def update
    respond_to do |format|
      if @spell_range.update(spell_range_params)
        format.html { redirect_to @spell_range, notice: 'Spell range was successfully updated.' }
        format.json { render :show, status: :ok, location: @spell_range }
      else
        format.html { render :edit }
        format.json { render json: @spell_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spell_ranges/1
  # DELETE /spell_ranges/1.json
  def destroy
    @spell_range.destroy
    respond_to do |format|
      format.html { redirect_to spell_ranges_url, notice: 'Spell range was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spell_range
      @spell_range = SpellRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spell_range_params
      params.require(:spell_range).permit(:spell_id, :range_type_id, :value)
    end
end

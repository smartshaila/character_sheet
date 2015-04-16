class SpellDurationsController < ApplicationController
  before_action :set_spell_duration, only: [:show, :edit, :update, :destroy]

  # GET /spell_durations
  # GET /spell_durations.json
  def index
    @spell_durations = SpellDuration.all
  end

  # GET /spell_durations/1
  # GET /spell_durations/1.json
  def show
  end

  # GET /spell_durations/new
  def new
    @spell_duration = SpellDuration.new
  end

  # GET /spell_durations/1/edit
  def edit
  end

  # POST /spell_durations
  # POST /spell_durations.json
  def create
    @spell_duration = SpellDuration.new(spell_duration_params)

    respond_to do |format|
      if @spell_duration.save
        format.html { redirect_to @spell_duration, notice: 'Spell duration was successfully created.' }
        format.json { render :show, status: :created, location: @spell_duration }
      else
        format.html { render :new }
        format.json { render json: @spell_duration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spell_durations/1
  # PATCH/PUT /spell_durations/1.json
  def update
    respond_to do |format|
      if @spell_duration.update(spell_duration_params)
        format.html { redirect_to @spell_duration, notice: 'Spell duration was successfully updated.' }
        format.json { render :show, status: :ok, location: @spell_duration }
      else
        format.html { render :edit }
        format.json { render json: @spell_duration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spell_durations/1
  # DELETE /spell_durations/1.json
  def destroy
    @spell_duration.destroy
    respond_to do |format|
      format.html { redirect_to spell_durations_url, notice: 'Spell duration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spell_duration
      @spell_duration = SpellDuration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spell_duration_params
      params.require(:spell_duration).permit(:spell_id, :time_increment_id, :value)
    end
end

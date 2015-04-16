class TimeIncrementsController < ApplicationController
  before_action :set_time_increment, only: [:show, :edit, :update, :destroy]

  # GET /time_increments
  # GET /time_increments.json
  def index
    @time_increments = TimeIncrement.all
  end

  # GET /time_increments/1
  # GET /time_increments/1.json
  def show
  end

  # GET /time_increments/new
  def new
    @time_increment = TimeIncrement.new
  end

  # GET /time_increments/1/edit
  def edit
  end

  # POST /time_increments
  # POST /time_increments.json
  def create
    @time_increment = TimeIncrement.new(time_increment_params)

    respond_to do |format|
      if @time_increment.save
        format.html { redirect_to @time_increment, notice: 'Time increment was successfully created.' }
        format.json { render :show, status: :created, location: @time_increment }
      else
        format.html { render :new }
        format.json { render json: @time_increment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_increments/1
  # PATCH/PUT /time_increments/1.json
  def update
    respond_to do |format|
      if @time_increment.update(time_increment_params)
        format.html { redirect_to @time_increment, notice: 'Time increment was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_increment }
      else
        format.html { render :edit }
        format.json { render json: @time_increment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_increments/1
  # DELETE /time_increments/1.json
  def destroy
    @time_increment.destroy
    respond_to do |format|
      format.html { redirect_to time_increments_url, notice: 'Time increment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_increment
      @time_increment = TimeIncrement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_increment_params
      params.require(:time_increment).permit(:name, :description)
    end
end

class RangeTypesController < ApplicationController
  before_action :set_range_type, only: [:show, :edit, :update, :destroy]

  # GET /range_types
  # GET /range_types.json
  def index
    @range_types = RangeType.all
  end

  # GET /range_types/1
  # GET /range_types/1.json
  def show
  end

  # GET /range_types/new
  def new
    @range_type = RangeType.new
  end

  # GET /range_types/1/edit
  def edit
  end

  # POST /range_types
  # POST /range_types.json
  def create
    @range_type = RangeType.new(range_type_params)

    respond_to do |format|
      if @range_type.save
        format.html { redirect_to @range_type, notice: 'Range type was successfully created.' }
        format.json { render :show, status: :created, location: @range_type }
      else
        format.html { render :new }
        format.json { render json: @range_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /range_types/1
  # PATCH/PUT /range_types/1.json
  def update
    respond_to do |format|
      if @range_type.update(range_type_params)
        format.html { redirect_to @range_type, notice: 'Range type was successfully updated.' }
        format.json { render :show, status: :ok, location: @range_type }
      else
        format.html { render :edit }
        format.json { render json: @range_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /range_types/1
  # DELETE /range_types/1.json
  def destroy
    @range_type.destroy
    respond_to do |format|
      format.html { redirect_to range_types_url, notice: 'Range type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_range_type
      @range_type = RangeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def range_type_params
      params.require(:range_type).permit(:name, :description)
    end
end

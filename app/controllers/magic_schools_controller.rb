class MagicSchoolsController < ApplicationController
  before_action :set_magic_school, only: [:show, :edit, :update, :destroy]

  # GET /magic_schools
  # GET /magic_schools.json
  def index
    @magic_schools = MagicSchool.all
  end

  # GET /magic_schools/1
  # GET /magic_schools/1.json
  def show
  end

  # GET /magic_schools/new
  def new
    @magic_school = MagicSchool.new
  end

  # GET /magic_schools/1/edit
  def edit
  end

  # POST /magic_schools
  # POST /magic_schools.json
  def create
    @magic_school = MagicSchool.new(magic_school_params)

    respond_to do |format|
      if @magic_school.save
        format.html { redirect_to @magic_school, notice: 'Magic school was successfully created.' }
        format.json { render :show, status: :created, location: @magic_school }
      else
        format.html { render :new }
        format.json { render json: @magic_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magic_schools/1
  # PATCH/PUT /magic_schools/1.json
  def update
    respond_to do |format|
      if @magic_school.update(magic_school_params)
        format.html { redirect_to @magic_school, notice: 'Magic school was successfully updated.' }
        format.json { render :show, status: :ok, location: @magic_school }
      else
        format.html { render :edit }
        format.json { render json: @magic_school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magic_schools/1
  # DELETE /magic_schools/1.json
  def destroy
    @magic_school.destroy
    respond_to do |format|
      format.html { redirect_to magic_schools_url, notice: 'Magic school was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magic_school
      @magic_school = MagicSchool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magic_school_params
      params.require(:magic_school).permit(:name, :description)
    end
end

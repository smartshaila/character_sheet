class ClassProficienciesController < ApplicationController
  before_action :set_class_proficiency, only: [:show, :edit, :update, :destroy]

  # GET /class_proficiencies
  # GET /class_proficiencies.json
  def index
    @class_proficiencies = ClassProficiency.all
  end

  # GET /class_proficiencies/1
  # GET /class_proficiencies/1.json
  def show
  end

  # GET /class_proficiencies/new
  def new
    @class_proficiency = ClassProficiency.new
  end

  # GET /class_proficiencies/1/edit
  def edit
  end

  # POST /class_proficiencies
  # POST /class_proficiencies.json
  def create
    @class_proficiency = ClassProficiency.new(class_proficiency_params)

    respond_to do |format|
      if @class_proficiency.save
        format.html { redirect_to @class_proficiency, notice: 'Class proficiency was successfully created.' }
        format.json { render :show, status: :created, location: @class_proficiency }
      else
        format.html { render :new }
        format.json { render json: @class_proficiency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_proficiencies/1
  # PATCH/PUT /class_proficiencies/1.json
  def update
    respond_to do |format|
      if @class_proficiency.update(class_proficiency_params)
        format.html { redirect_to @class_proficiency, notice: 'Class proficiency was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_proficiency }
      else
        format.html { render :edit }
        format.json { render json: @class_proficiency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_proficiencies/1
  # DELETE /class_proficiencies/1.json
  def destroy
    @class_proficiency.destroy
    respond_to do |format|
      format.html { redirect_to class_proficiencies_url, notice: 'Class proficiency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_proficiency
      @class_proficiency = ClassProficiency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_proficiency_params
      params.require(:class_proficiency).permit(:adventuring_class_id, :ability_id)
    end
end
